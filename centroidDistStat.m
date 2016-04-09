function stats = centroidDistStat(im)
    avg = 0;
    var = 0;
    c = centroid(im);
    points = contour(im);
    for iter = 1:size(points,1)
        tmp = points(iter,:)-c;
        avg = avg + tmp*transpose(tmp);
    end
    avg = avg/size(points,1);
     for iter = 1:size(points,1)
        tmp = points(iter,:)-c;
        tmp = tmp*transpose(tmp);
        var = (tmp-avg)*(tmp-avg) + var;
    end
    var = var/size(points,1);
    stats = [avg, sqrt(var)];
end


