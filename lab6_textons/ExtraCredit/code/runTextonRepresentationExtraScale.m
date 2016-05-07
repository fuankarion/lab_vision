setenv('LC_ALL','C') 
%extra scale texton dict
addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')
fb=createBank(16,3);

textons=load('/home/jcleon/storage/disk0/Other/textures/ExtraScale/models/3/full/textonsk50.mat')


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
        
        save(strcat('/home/jcleon/storage/disk0/Other/textures/RepresentationExtraScale/50/train/',D(i).name,num2str(j)),'tmap','-v7.3')
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
        
        save(strcat('/home/jcleon/storage/disk0/Other/textures/RepresentationExtraScale/50/test/',DTest(i).name,num2str(j)),'tmap','-v7.3')
    end
end
