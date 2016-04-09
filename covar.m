function sigma = covar(data)
    av = mean(data);
    for iter = 1:size(data,1)
        data(iter,:) = data(iter,:) - av;
    end
    sigma = (1/size(data,1))*transpose(data)*data;
end