function result = solidity(im)
    points = contour(im);
    surface = area(im);
    convexIndices = convhull(points);
    convex = points(convexIndices,:);
    result = surface/polyarea(convex(:,1),convex(:,2));
end

