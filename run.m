%labels = {}
labels = {'bird','bone','brick','camel','car','children','classic','elephant'};
trainFolder = '.\train\2\';
testFolder = '.\test\2\';

[priors, mus, sigmas] = train(trainFolder,labels);
confMat = test(testFolder,labels,priors,mus,sigmas)
accuracy = trace(confMat)/sum(sum(confMat))
