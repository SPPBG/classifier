function ratio = convexity(im)
    points = contour(im);
    convex = convhull(points(:,1),points(:,2));
    ratio = perim(convex)/perim(points);
end

