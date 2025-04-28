local info = debug.getinfo(1, "S")
local scriptPath = info.source:sub(2)
local scriptDir = scriptPath:match("(.*/)")
package.path = package.path .. ";" .. scriptDir .. "themes/?.lua"

local rose_pine = require("custom_rose_pine")
local rose_pine_dawn = require("rose_pine_dawn")
local alabaster = require("alabaster")
local gruber_darker = require("gruber_darker_theme")

return rose_pine
