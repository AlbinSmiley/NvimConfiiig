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
local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s({trig="$$", snippetType="autosnippet"},
		fmta(
			"\\(<>\\)",
			{i(1)}
		)
	),

	s({trig="alpha", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\alpha"),
		}
	),

	s({trig="beta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\beta"),
		}
	),

	s({trig="gamma", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\gamma"),
		}
	),

	s({trig="delta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\delta"),
		}
	),

	s({trig="epsilon", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\epsilon"),
		}
	),

	s({trig="zeta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\zeta"),
		}
	),

	s({trig="eta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\eta"),
		}
	),

	s({trig="theta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\theta"),
		}
	),

	s({trig="iota", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\iota"),
		}
	),

	s({trig="kappa", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\kappa"),
		}
	),

	s({trig="lambda", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\lambda"),
		}
	),

	s({trig="mu", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\mu"),
		}
	),

	s({trig="nu", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\nu"),
		}
	),

	s({trig="xi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\xi"),
		}
	),

	s({trig="omicron", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\omicron"),
		}
	),

	s({trig="pi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\pi"),
		}
	),

	s({trig="rho", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\rho"),
		}
	),

	s({trig="sigma", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\sigma"),
		}
	),

	s({trig="tau", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\tau"),
		}
	),

	s({trig="upsilon", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\upsilon"),
		}
	),

	s({trig="phi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\phi"),
		}
	),

	s({trig="varphi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\varphi"),
		}
	),

	s({trig="chi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\chi"),
		}
	),

	s({trig="psi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\psi"),
		}
	),

	s({trig="omega", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\omega"),
		}
	),

	s({trig="Gamma", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Gamma"),
		}
	),

	s({trig="Delta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Delta"),
		}
	),

	s({trig="Theta", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Theta"),
		}
	),

	s({trig="Lambda", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Lambda"),
		}
	),

	s({trig="Xi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Xi"),
		}
	),

	s({trig="Pi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Pi"),
		}
	),

	s({trig="Sigma", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Sigma"),
		}
	),

	s({trig="Upsilon", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Upsilon"),
		}
	),

	s({trig="Phi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Phi"),
		}
	),

	s({trig="Psi", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Psi"),
		}
	),

	s({trig="Omega", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\Omega"),
		}
	),

	s({trig="infty", snippetType="autosnippet", condition = in_mathzone},
		{
			t("\\infty"),
		}
	),

	s({trig="//", snippetType="autosnippet", condition = in_mathzone},
		{
			t({"\\frac{"}), i(1),
			t({"}{"}), i(0),
		t({"}"}),
	}),

	s({trig="sum", snippetType="autosnippet", condition = in_mathzone},
		{
			t({"\\sum_{"}), i(1),
			t({"}^{"}), i(0),
		t({"}"}),
	}),

	s({trig="lim", snippetType="autosnippet", condition = in_mathzone},
		{
			t({"\\lim_{"}), i(1),
			t({" \\to "}), i(0),
		t({"}"}),
	}),

	s({trig="cdot", snippetType="autosnippet", condition = in_mathzone},
		{t({"\\cdot"}),
	}),

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

	s({trig="ds", snippetType="autosnippet"},
		{
			t({"\\displaystyle"}),
	}),

	s({trig="<<", snippetType="autosnippet"},
		{
			t({"\\og "}),i(1),t({" \\fg{}"}),
	}),
}
