local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet



return {
	-- Examples of Greek letter snippets, autotriggered for efficiency
	-- s({trig=";a", snippetType="autosnippet"},
	-- {
	-- 	t("\\alpha"),
	-- }
	-- ),
	-- s({trig=";b", snippetType="autosnippet"},
	-- {
	-- 	t("\\beta"),
	-- }
	-- ),
	-- s({trig=";c", snippetType="autosnippet"},
	-- {
	-- 	t("\\gamma"),
	-- }
	-- ),

	s({trig="$$", snippetType="autosnippet"},
		fmta(
			"\\(<>\\)",
			{i(1)}
		)
	),
	s({trig="//", snippetType="autosnippet"},
		{
			t({"\\frac{"}), i(1),
			t({"}{"}), i(0),
			t({"}"}),
	}),
	-- s({trig="cdot", snippetType="autosnippet"},
	-- 	{t({"\\cdot"}),
	-- }),
	s("use", {t({"\\usepackage{"}), i(1), t({"}"}),
	}),
	s("usefrench", {t({
		"\\usepackage[utf8]{inputenc}",
		"\\usepackage[T1]{fontenc}",
		"\\usepackage[french]{babel}"
		})
	}),
	s("usemath", {t({
		"\\usepackage{commath}",
		"\\usepackage{esvect}",
		"\\usepackage{xcolor}",
		"\\usepackage{graphicx}",
		"\\usepackage{gensymb}",
		"\\usepackage{mathtools}",
		"\\usepackage{amsfonts}",
		"\\usepackage{wasysym}",
		"\\usepackage{MnSymbol}",
		"\\usepackage{IEEEtrantools}",
		"\\usepackage{calc}",
		"\\usepackage{siunitx}",
		"\\sisetup{product-symbol = \\ensuremath{\\cdot}}",
		"\\sisetup{inter-unit-product = \\ensuremath{{}\\cdot{}}}",
		"\\usepackage{fixdif}"
		})
	}),
	s("usearray", {t({
		"\\usepackage{tabularx}",
		"\\usepackage{array}",
		"\\usepackage{multirow}",
		"\\usepackage{booktabs}"
		})
	}),
	s({trig="usegeo", snippetType="autosnippet"},
		fmta(
			"\\usepackage[<>]{geometry}",
			{i(1)}
		)
	),
	s({trig="lra", snippetType="autosnippet"},
		{
			t({"\\Leftrightarrow"}),
	}),
	s({trig="emph", snippetType="autosnippet"},
		{
			t({"\\emph{"}), i(1), t({"}"}),
	}),
	s({trig="bold", snippetType="autosnippet"},
		{
			t({"\\textbf{"}), i(1), t({"}"}),
	}),
	s({trig="àà", snippetType="autosnippet"},
		{
			t({"\\"}),
	}),
}
