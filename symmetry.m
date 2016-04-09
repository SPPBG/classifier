function ratio = symmetry(im)
    centre = centroid(im);
    sym = 0;
    notSym = 0;
    for row = 1:size(im,1)
        for col = 1:centre(1,2)
        if int16(2*centre(1,2)-col)<=size(im,2) && im(row,col)>0 && im(row,col) == im(row,int16(2*centre(1,2)-col))
            sym = sym+1;
        elseif im(row,col)>0
            notSym = notSym +1;
        end
     end
    ratio =  sym/(sym+notSym);
end