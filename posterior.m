function p = posterior(omega,x,priors,means,covars)
    correctedSigma = correctCov(covars(:,:,omega));
    likelihood = mvnpdf(transpose(x),transpose(means(omega,:)),correctedSigma); %Calculate the posterior
    p = priors(omega,1)*likelihood;
end