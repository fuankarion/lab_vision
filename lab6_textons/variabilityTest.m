addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')
clear all;close all;clc;

% create filter bank
[fb] = fbCreate;

sizefb=size(fb)
filterSize=size(fb{1,1});

km = 32;

dirName='Bark';

for max=1:6
    singleTextureFullTestSet=zeros(0,0)
    F=dir(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/',dirName,'/*.jpg'));
    for j=1:max%numel(F)
        name=strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/train/',dirName,'/',F(j).name)
        im=double(imread(name))/255;
        singleTextureFullTestSet=[singleTextureFullTestSet im];
        size(singleTextureFullTestSet)
    end

    % diccionario de textones
    warning('calculate textons')
    tic
    [map,textons] = computeTextons(fbRun(fb,singleTextureFullTestSet),km);
    toc

    save(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/map',dirName,num2str(max),'.mat'),'map') 
    save(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/textons',dirName,num2str(max),'.mat'),'textons') 

end

