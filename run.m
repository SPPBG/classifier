labels = {'bird','bone','brick','camel','car','children','classic','elephant','face','fork','fountain','glas','hammer','Heart','key','Misk','Ray','turtle'};
trainFolder = '.\train_alt\';
testFolder = '.\test_alt\';

[priors, mus, sigmas] = train(trainFolder,labels);
confMat = test(testFolder,labels,priors,mus,sigmas)
accuracy = trace(confMat)/sum(sum(confMat))
