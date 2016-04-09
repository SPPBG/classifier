function features = extractFeatures(fname)
    im = im2bw(imread(fname),1/256);
    %{
    full_features = abs(fft(chcode(im)));
    len = length(full_features);
    N = 24;
    features = [];
    for i =1:N
        features = [features, full_features(int16(i*len/N))];
    end
    %}
    features = [solidity(im), convexity(im),symmetry(im)];
end