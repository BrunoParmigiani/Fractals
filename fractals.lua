local geometry = require("geometry")

local fractals = {}
fractals["outline"] = {}

fractals["sierpinski"] = function(x, y, side, depth)
	if depth == 0 then
		geometry.polygon(x, y, 3, side):rotate(180)
    else
        local p1 = geometry.midpoint(x, y, x - side / 2, y)
        local p2 = geometry.midpoint(x, y, x + side / 2, y)
        local p3 = geometry.midpoint(x, y, x, y - (side * math.sqrt(3)) / 2)
        
        fractals.sierpinski(p1[1], p1[2], side / 2, depth - 1, _table)
        fractals.sierpinski(p2[1], p2[2], side / 2, depth - 1, _table)
        fractals.sierpinski(p3[1], p3[2], side / 2, depth - 1, _table)
    end
end

fractals["square"] = function(x, y, side, depth)
    if depth == 0 then
        geometry.polygon(x, y, 4, side):rotate(45)
    else
        fractals.square(x - side / 3, y - side / 3, side / 3, depth - 1)
        fractals.square(x, y - side / 3, side / 3, depth - 1)
        fractals.square(x + side / 3, y - side / 3, side / 3, depth - 1)

        fractals.square(x - side / 3, y, side / 3, depth - 1)
        fractals.square(x + side / 3, y, side / 3, depth - 1)

        fractals.square(x - side / 3, y + side / 3, side / 3, depth - 1)
        fractals.square(x, y + side / 3, side / 3, depth - 1)
        fractals.square(x + side / 3, y + side / 3, side / 3, depth - 1)
    end
end

return fractals
