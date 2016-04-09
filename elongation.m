function ratio = elongation( im )
%SYMMETRY Summary of this function goes here
%   Detailed explanation goes here
    points = surface(im);
    centre = centroid(im);
    for iter = 1:size(points,1)
        points(iter,:) = points(iter,:) - centre;
    end
    covar = (points.' * points)/size(points,1);
    lambdas = eig(covar);
    ratio = max(lambdas)/min(lambdas);
end

function points = surface(im)
    points = [];
    for ROWS = 1:size(im,1)
        for COLS = 1:size(im,2)
            if im(ROWS,COLS) == 1
                points = [points; ROWS, COLS];
            end
        end
    end
end

