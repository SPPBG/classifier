function P = perim(points)
    P = 0;
    for iter = 1:(size(points,1)-1)
        vector = points(iter+1,:) - points(iter,:);
        P = P + vector*transpose(vector);
    end
end