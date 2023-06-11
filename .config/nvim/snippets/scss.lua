local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
	-- media query
	parse({ trig = "bdl" }, "@include breakpoint-down(lg){${1}}${0}"),
	parse({ trig = "bdm" }, "@include breakpoint-down(md){${1}}${0}"),
	parse({ trig = "bds" }, "@include breakpoint-down(sm){${1}}${0}"),
	parse({ trig = "bul" }, "@include breakpoint-up(lg){${1}}${0}"),
	parse({ trig = "bum" }, "@include breakpoint-up(md){${1}}${0}"),
	parse({ trig = "bus" }, "@include breakpoint-up(sm){${1}}${0}"),

	-- pseudo elements
	parse({ trig = "be" }, "&::before{${1}}${0}"),
	parse({ trig = "af" }, "&::after{${1}}${0}"),
	parse(
		{ trig = "pse" },
		[[content: '';
position: absolute;
background-image: url(${1});
background-repeat: no-repeat;
background-size: contain;
width: 1rem;
height: 1rem;
top: 1rem;${0}]]
	),

	-- basic styling
	parse(
		{ trig = "flexcenter" },
		[[display: flex;
justify-content: center;
align-items: center;${0}
]]
	),
	parse(
		{ trig = "autox" },
		[[margin-right: auto;
margin-left: auto;${0}
]]
	),

	parse(
		{ trig = "padx" },
		[[padding-right: ${1};
padding-left: ${1};${0}
]]
	),

	parse(
		{ trig = "pady" },
		[[padding-top: ${1};
padding-bottom: ${1};${0}
]]
	),

	parse(
		{ trig = "marx" },
		[[margin-right: ${1};
margin-left: ${1};${0}
]]
	),

	parse(
		{ trig = "mary" },
		[[margin-top: ${1};
margin-bottom: ${1};${0}
]]
	),

	parse(
		{ trig = "whs" },
		[[width: ${1};
height: ${1};${0}
]]
	),
}
