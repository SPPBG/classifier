function label = classify(x,priors,means,covars)
    max = - Inf;
    label = 0;
    for iter =1:size(priors,1)
        likelihood = posterior(iter,x,priors,means,covars);
        if likelihood > max
            max = likelihood;
            label = iter;
        end
    end
end

