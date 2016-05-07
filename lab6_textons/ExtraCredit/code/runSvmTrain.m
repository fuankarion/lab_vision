setenv('LC_ALL','C') 

k=50
TrainSVM(strcat('/home/jcleon/storage/disk0/Other/textures/RepresetationGaussianFilter/',num2str(k),'/train'),strcat('/home/jcleon/storage/disk0/Other/textures/learntModels/GF',num2str(k),'.mat'))