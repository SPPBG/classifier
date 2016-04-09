function confMat = test(folder,labels,priors,mus,sigmas)
    confMat = zeros(size(labels,2));
    for label = 1:size(labels,2)
        testfiles  = getFilenames(strcat(folder,labels{1,label},'*.gif'));
        for iter = 1:size(testfiles,1)
            fullname = strcat(folder,testfiles{iter,1});
            features = extractFeatures(fullname);
            guessed_label = classify(features,priors,mus,sigmas);
            confMat(label,guessed_label) = confMat(label,guessed_label) + 1;
        end
    end
end