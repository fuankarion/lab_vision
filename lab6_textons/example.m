%%KM is ke for the k-means algorithm
%%assumes there are n subdir in mainDir, with the images, each subdir is a
%%class
function calculateTextonDictAndMap(km,mainDir,targetDir)
    addpath('/home/jcleon/storage/disk0/Other/code/lab_vision/lab6_textons/lib')
    clear all;close all;clc;

    % create filter bank
    [fb] = fbCreate;

    D=dir(mainDir);

<<<<<<< HEAD

%%%%FILTER DRAWING
% fbCol1=zeros(0,0);
% for i=1:sizefb(1)
%     fbCol1=vertcat(fbCol1,fb{i,1});
% end
% 
% fbCol2=zeros(0,0);
% for i=1:sizefb(1)
%     fbCol2=vertcat(fbCol2,fb{i,2});
% end
% 
% size(fbCol1)
% size(fbCol2)
% imshow(mat2gray(fbCol1));
% imshow(mat2gray(fbCol2/usr/local/matlab/R2015a/bin/matlab –nodisplay
% drawnow;

% numero de textones en diccionario
km = 50;

D=dir('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/');

singleTextureFullTestSet=double(zeros(0,0));
for i=3:numel(D)    
    D(i).name
    F=dir(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/',D(i).name,'/*.jpg'));
    randomImgIdx=round(rand(1,3)*29)
    for j=1:numel(randomImgIdx)
        name=strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/',D(i).name,'/',F(randomImgIdx(j)).name)
        im=double(imread(name))/255;
        singleTextureFullTestSet=[singleTextureFullTestSet im];
        size(singleTextureFullTestSet)
=======
    singleTextureFullTestSet=double(zeros(0,0));
    for i=3:numel(D)% skip .. and . which are files in linux
        D(i).name
        F=dir(strcat(mainDir,D(i).name,'/*.jpg'));
        randomImgIdx=round(rand(1,5)*29)
        for j=1:numel(randomImgIdx)
            name=strcat(mainDir,D(i).name,'/',F(randomImgIdx(j)).name)
            im=double(imread(name))/255;
            singleTextureFullTestSet=[singleTextureFullTestSet im];
            size(singleTextureFullTestSet)
        end
>>>>>>> c3bd1349d1177353ef230b043ef1a0742da7cd21
    end

    % diccionario de textones
<<<<<<< HEAD
%     warning('calculate textons')
%     tic
%     [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
%     toc
%     
%     save(strcat('/home/jcleon/storage/disk0/Other/textures/calculatedTextons50/map',D(i).name,'.mat'),'map') 
%     save(strcat('/home/jcleon/storage/disk0/Other/textures/calculatedTextons50/textons',D(i).name,'.mat'),'textons') 
    
end


=======
    warning('calculate textons')
    tic
    [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
    toc

    save(strcat(targetDir,'/map.mat'),'map') 
    save(strcat(targetDir,'/textons.mat'),'textons') 
end



>>>>>>> c3bd1349d1177353ef230b043ef1a0742da7cd21
