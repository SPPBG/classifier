function av = mean(data)
    av = data(1,:);
    for iter = 2:size(data,1)
        av = av + data(iter,:);
    end
    av = av/size(data,1);
end