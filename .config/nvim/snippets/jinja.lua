local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
	parse({ trig = "mr" }, '{{ macro.ResponsiveImage(images, "${1}") }}${0}'),
	parse({ trig = "mi" }, '{{ macro.Image(images, "${1}") }}${0}'),
	parse({ trig = "bds" }, '<br class="u-hidden-down-sm">${0}'),
	parse({ trig = "bum" }, '<br class="u-hidden-up-md">${0}'),
}
