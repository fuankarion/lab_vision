addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;

sizefb=size(fb)
filterSize=size(fb{1,1});


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
    end
    
    %singleTextureFullTestSet=[im im];
    
    % diccionario de textones
%     warning('calculate textons')
%     tic
%     [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
%     toc
%     
%     save(strcat('/home/jcleon/storage/disk0/Other/textures/calculatedTextons50/map',D(i).name,'.mat'),'map') 
%     save(strcat('/home/jcleon/storage/disk0/Other/textures/calculatedTextons50/textons',D(i).name,'.mat'),'textons') 
    
end


