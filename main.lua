local geometry = require("geometry")
local fractals = require("fractals")

local centerX = display.contentWidth / 2
local centerY = display.contentHeight / 2

fractals.sierpinski(centerX, centerY + 390, 700, 8)