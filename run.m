labels = {'Alien','Arrow','Butterfly','Face','Star','Toonhead'};
trainFolder = '.\train\';
testFolder = '.\test\';

[priors, mus, sigmas] = train(trainFolder,labels);
confMat = test(testFolder,labels,priors,mus,sigmas)
accuracy = trace(confMat)/sum(sum(confMat))
