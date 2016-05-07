setenv('LC_ALL','C') 
%extra scale texton dict
addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')
fb=createBank(16,2);

size(fb)
%extra gaussian filters
fb{33,1}=fspecial('gaussian',13,0.1);
fb{34,1}=fspecial('gaussian',13,0.5);
fb{35,1}=fspecial('gaussian',13,1);
fb{36,1}=fspecial('gaussian',13,5);
fb{37,1}=fspecial('gaussian',13,10);
fb{38,1}=fspecial('gaussian',13,50);

fb{33,2}=fspecial('gaussian',19,0.1);
fb{34,2}=fspecial('gaussian',19,0.5);
fb{35,2}=fspecial('gaussian',19,1);
fb{36,2}=fspecial('gaussian',19,5);
fb{37,2}=fspecial('gaussian',19,10);
fb{38,2}=fspecial('gaussian',19,50);

textons=load('/home/jcleon/storage/disk0/Other/textures/gaussianFilters/models/3/full/textonsk50.mat')


theDirTrain='/home/jcleon/storage/disk0/Other/textures/train/'
theDirTest='/home/jcleon/storage/disk0/Other/textures/test/'

D=dir(theDirTrain);

for i=3:numel(D)    
    D(i).name
    F=dir(strcat(theDirTrain,D(i).name,'/*.jpg'));
    
    for j=1:numel(F)
        name=strcat(theDirTrain,D(i).name,'/',F(j).name)
        img=imread(name)/255;
        tmap=textonRepresentation(fb,textons.textons,img);
        
        save(strcat('/home/jcleon/storage/disk0/Other/textures/RepresetationGaussianFilter/50/train/',D(i).name,num2str(j)),'tmap','-v7.3')
    end
end


DTest=dir(theDirTest);
for i=3:numel(DTest)    
    DTest(i).name
    F=dir(strcat(theDirTest,DTest(i).name,'/*.jpg'));
    
    for j=1:numel(F)
        name=strcat(theDirTest,DTest(i).name,'/',F(j).name)
        img=imread(name)/255;
        tmap=textonRepresentation(fb,textons.textons,img);
        
        save(strcat('/home/jcleon/storage/disk0/Other/textures/RepresetationGaussianFilter/50/test/',DTest(i).name,num2str(j)),'tmap','-v7.3')
    end
end
