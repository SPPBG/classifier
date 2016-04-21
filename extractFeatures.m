function features = extractFeatures(fname)
    im = im2bw(imread(fname),1/256);
     features = abs(fft(chcode(im)));
     features = features .* features/max(features);
    features = features(1:4);
  % features = [solidity(im), convexity(im),symmetry(im),centroidDistStat(im)];
end