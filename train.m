function [priors,means, covars] =train(folder,labels) %labels is a cell array of strings
    covars = [];
    means = [];
    priors = zeros(size(labels,2),1);
    for label = 1:size(labels,2)
        files = strcat(folder,getFilenames(strcat(folder,labels{1,label},'*')));
        features = getFeatures(files);
        priors(label,1) = size(files,1);
        means = [means; mean(features)];
        sigma = correctCov(covar(features));
        covars = cat(3,covars,sigma);
    end
    priors = priors / sum(priors);
end



