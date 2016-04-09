function c = centroid( im )
%CENTROID Summary of this function goes here
%   Detailed explanation goes here
    c = [0,0];
    n = 0;
    for ROWS = 1:size(im,1)
        for COLS = 1:size(im,2)
            if im(ROWS,COLS) == 1
                c = c + [ROWS,COLS]; 
                n = n+1;
            end
        end
    end
    c = c/n;
end