 
% calculateFullSetOfTextons('/home/jcleon/storage/disk1/textures/train/','/home/jcleon/storage/disk1/textures/feats/train32','/home/jcleon/storage/disk1/textures/feats/train64','/home/jcleon/storage/disk1/textures/feats/train96')
% calculateFullSetOfTextons('/home/jcleon/storage/disk1/textures/test/','/home/jcleon/storage/disk1/textures/feats/test32','/home/jcleon/storage/disk1/textures/feats/test64','/home/jcleon/storage/disk1/textures/feats/test96')


%%%choose



% [d,l]=createTrainigSet('/home/jcleon/storage/disk1/textures/feats/train32');
% mdlKNN = fitcknn(d,l')
% [gt,predicted]=createEvalationSet(mdlKNN,'/home/jcleon/storage/disk1/textures/feats/test32')
% confusionmat(gt,predicted)
% classperf(gt,predicted)


% [d,l]=createTrainigSet('/home/jcleon/storage/disk1/textures/feats/train64');
% mdlKNN = fitcknn(d,l')
% [gt,predicted]=createEvalationSet(mdlKNN,'/home/jcleon/storage/disk1/textures/feats/test64')
% confusionmat(gt,predicted)
% classperf(gt,predicted)


[d,l]=createTrainigSet('/home/fuanka/Dropbox/lab6/textures/feats/test32');
tic;
mdlKNN = fitcknn(d,l')
toc;
