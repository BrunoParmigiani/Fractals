local geometry = {}
geometry["outline"] = {}

geometry["point"] = function(x, y)
    local point = {x, y}

    return point
end

geometry["midpoint"] = function(x1, y1, x2, y2)
    local midX = (x1 + x2) / 2
    local midY = (y1 + y2) / 2

    return geometry.point(midX, midY)
end

geometry["polygon"] = function(x, y, edges, sideLength)
    local vertices = {}
    local angle = 360 / edges
    local r = math.sqrt(sideLength / 2)

    for i = 0, edges - 1 do
        local _x = math.sin(math.rad(angle * i)) * sideLength
        local _y = math.cos(math.rad(angle * i)) * sideLength

        table.insert(vertices, _x)
        table.insert(vertices, _y)
    end
    
    return display.newPolygon(x, y, vertices)
end

geometry["equilateralTriangle"] = function (x, y, side)
    local h = (side * math.sqrt(3)) / 2
    
    local ax1 = x - side / 2
    local ay1 = y + h / 2
    local ax2 = x + side / 2
    local ay2 = y + h / 2

    local bx1 = x - side / 2
    local by1 = y + h / 2
    local bx2 = x
    local by2 = y - h / 2

    local cx1 = x + side / 2
    local cy1 = y + h / 2
    local cx2 = x
    local cy2 = y - h / 2

    local a = geometry.line(ax1, ay1, ax2, ay2)
    local b = geometry.line(bx1, by1, bx2, by2)
    local c = geometry.line(cx1, cy1, cx2, cy2)

    return a .. b .. c
end

return geometry