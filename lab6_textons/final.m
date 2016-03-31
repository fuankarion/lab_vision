% calculateFullSetOfTextons('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/train32','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/train94','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/train96')
% calculateFullSetOfTextons('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/test/','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test32','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test94','/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test96')


%%%choose

[d,l]=createTrainigSet('/home/fuanka/Dropbox/lab6/textures/feats/test96');
tic;
BaggedEnsemble = TreeBagger(100,d,l','OOBPrediction','On','Method','classification')
toc;


%[gt,predicted]=createEvalationSet(BaggedEnsemble,'/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test32')


% 
% 
% 
% [d,l]=createTrainigSet('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test64');
% BaggedEnsemble = TreeBagger(50,d,l','OOBPrediction','On','Method','classification','NumPredictorsToSample','all')
% [gt,predicted]=createEvalationSet(BaggedEnsemble,'/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test64')
% 
% 
% 
% [d,l]=createTrainigSet('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test96');
% BaggedEnsemble = TreeBagger(50,d,l','OOBPrediction','On','Method','classification','NumPredictorsToSample','all')
% [gt,predicted]=createEvalationSet(BaggedEnsemble,'/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/feats/test96')
