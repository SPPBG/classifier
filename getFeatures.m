function features = getFeatures(files)
    features = [];
        for file = 1:size(files,1)
            f = extractFeatures(files{file,1});
            features = [features; f];
        end
end