local info = debug.getinfo(1, "S")
local scriptPath = info.source:sub(2)
local scriptDir = scriptPath:match("(.*/)")
package.path = package.path .. ";" .. scriptDir .. "themes/?.lua"

local rose_pine = require("custom-rose-pine")
local rose_pine_dawn = require("rose-pine-dawn")
local alabaster = require("alabaster")

return alabaster
