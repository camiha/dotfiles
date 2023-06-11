local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
	-- type definition
	parse({ trig = "ty" }, "type ${1} = {${2}}${0}"),
	parse({ trig = "et" }, "export type ${1} = {${2}}${0}"),
	parse({ trig = "iy" }, "interface ${1} = {${2}}${0}"),
	parse({ trig = "ei" }, "export interface ${1} = {${2}}${0}"),

	-- template literal
	parse({ trig = "tl" }, "\\${${1:val}\\}${0}"),

	-- functions
	parse({ trig = "caf" }, "const ${1} = (${2:val}):${3} => {${4}}$0"),
	parse({ trig = "ecaf" }, "export const ${1} = (${2:val}):${3} => {${4}}$0"),
	parse({ trig = "caaf" }, "const ${1} = async (${2:val}):${3} => {${4}}$0"),
	parse({ trig = "ceaaf" }, "export const ${1} = async (${2:val}):${3} => {${4}}$0"),

	-- dom api
	parse({ trig = "by." }, "document.getElementsByClassName('${1}')${0}"),
	parse({ trig = "by#" }, "document.getElementById('${1}')${0}"),

	-- for debug
	parse({ trig = "log" }, "console.log('${1}')${0}"),
}
