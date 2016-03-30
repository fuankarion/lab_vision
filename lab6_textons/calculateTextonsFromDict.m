function tmap= calculateTextonsFromDict(textonDic, fb, img, k )
    %textons=load('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/textonsbrick1.mat');
    %map=load('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/mapbrick1.mat');

    textons=textonDic;
   
    im2=double(img)/255;
    tmap = assignTextons(fbRun(fb,im2),textons');

    histc(tmap(:),1:k)   
end
