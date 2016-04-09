function S = area(im)
    points = contour(im);
    S = polyarea(points(:,1),points(:,2));
end