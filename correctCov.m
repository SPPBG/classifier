function correctedCov = correctCov(sigma) %Sigma must be symmetric!
   threshold = 0.0001;
   lambdas = diag(max(eig(sigma),threshold)); %Corrected eigenvalues
    [eigVectors,~] = eig(sigma);
    correctedCov = eigVectors*lambdas*transpose(eigVectors);
end