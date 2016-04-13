function features = extractFeatures(fname)
    im = im2bw(imread(fname),1/256);
   features = [solidity(im), convexity(im),symmetry(im),centroidDistStat(im)];
end