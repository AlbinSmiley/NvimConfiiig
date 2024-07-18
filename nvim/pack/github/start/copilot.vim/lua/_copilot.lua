local copilot = {}

local showDocument = function(err, result, ctx, _)
  local fallback = vim.lsp.handlers['window/showDocument']
  if not fallback or (result.external and vim.g.copilot_browser) then
    return vim.fn['copilot#handlers#window_showDocument'](result)
  else
    return fallback(err, result, ctx, _)
  end
end

copilot.lsp_start_client = function(cmd, handler_names, opts, settings)
  local handlers = {['window/showDocument'] = showDocument}
  local id
  for _, name in ipairs(handler_names) do
    handlers[name] = function(err, result)
      if result then
        local retval = vim.call('copilot#agent#LspHandle', id, { method = name, params = result })
        if type(retval) == 'table' then
          return retval.result, retval.error
        end
      end
    end
  end
  id = vim.lsp.start_client({
    cmd = cmd,
    cmd_cwd = vim.call('copilot#job#Cwd'),
    name = 'copilot',
    init_options = opts.initializationOptions,
    workspace_folders = opts.workspace_folders,
    settings = settings,
    handlers = handlers,
    get_language_id = function(bufnr, filetype)
      return vim.call('copilot#doc#LanguageForFileType', filetype)
    end,
    on_init = function(client, initialize_result)
      vim.call('copilot#agent#LspInit', client.id, initialize_result)
      if vim.fn.has('nvim-0.8') == 0 then
        client.notify('workspace/didChangeConfiguration', { settings = settings })
      end
    end,
    on_exit = function(code, signal, client_id)
      vim.schedule(function()
        vim.call('copilot#agent#LspExit', client_id, code, signal)
      end)
    end,
  })
  return id
end

copilot.lsp_request = function(client_id, method, params, bufnr)
  local client = vim.lsp.get_client_by_id(client_id)
  if not client then
    return
  end
  if bufnr == vim.NIL then
    bufnr = nil
  end
  local _, id
  _, id = client.request(method, params, function(err, result)
    vim.call('copilot#agent#LspResponse', client_id, { id = id, error = err, result = result })
  end, bufnr)
  return id
end

copilot.rpc_request = function(client_id, method, params)
  local client = vim.lsp.get_client_by_id(client_id)
  if not client then
    return
  end
  local _, id
  _, id = client.rpc.request(method, params, function(err, result)
    vim.call('copilot#agent#LspResponse', client_id, { id = id, error = err, result = result })
  end)
  return id
end

copilot.rpc_notify = function(client_id, method, params)
  local client = vim.lsp.get_client_by_id(client_id)
  if not client then
    return
  end
  return client.rpc.notify(method, params)
end

return copilot
