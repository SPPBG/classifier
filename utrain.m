function [priors, mus, sigmas] = utrain(folder,k,threshold,print)
    files = strcat(folder,getFilenames(strcat(folder,'*.gif')));
    features = getFeatures(files);
    if print 
        plot3(features(:,1),features(:,2),features(:,3),'.k');
        hold on;
    end
    [priors,mus,sigmas] = initialize(features,k);
    oldLog = -Inf;
    newLog = logLikelihood(features,priors,mus,sigmas);
    while abs(oldLog-newLog)>threshold
        labels = classifyAll(features,priors,mus,sigmas);
        [priors,mus,sigmas] = update(features,labels,k);
        oldLog = newLog;
        newLog = logLikelihood(features,priors,mus,sigmas);
        disp(abs(oldLog-newLog));
    end
end

function labels = classifyAll(features,priors,mus,sigmas)
       labels = zeros(size(features,1),1);
       for i = 1:size(features,1)
            labels(i,1) = classify(features(i,:),priors,mus,sigmas);
       end
end

function [priors,mus,sigmas] = update(features,labels,k)
    priors = zeros(k,1);
    mus = zeros(k,size(features,2));
    sigmas = zeros(size(features,2),size(features,2),k);
    for label = 1:k
        labelFeatures = pick(features,labels,label);
        mus(label,:) = mean(labelFeatures);
        sigmas(:,:,label) = covar(labelFeatures);
        priors(label,1) = size(labelFeatures,1)/length(labels); 
    end
end

function [priors,mus,sigmas] = initialize(features,k)
    [labels,mus] = kmeans(features,k);
    priors = zeros(k,1);
    sigmas = zeros(size(features,2),size(features,2),k);
    for label = 1:k
        labelFeatures = pick(features,labels,label);
        sigmas(:,:,label) = covar(labelFeatures);
        priors(label,1) = size(labelFeatures,1)/length(labels); 
    end
end

function labelFeatures = pick(features,labels,label)
    labelFeatures = [];
    for iter = 1:size(labels,1)
        if labels(iter,1) == label
            labelFeatures = [labelFeatures; features(iter,:)];
        end
    end
end

function p =  prob(x,priors,mus,sigmas)
    p = 0;
    for i = 1:length(priors)
        p = p +posterior(i,x,priors,mus,sigmas);
    end
end

function result = logLikelihood(features,priors,mus,sigmas)
    result = 0;
    for i = 1:size(features,1)
        result = result + prob(features(i,:),priors,mus,sigmas);
    end
end