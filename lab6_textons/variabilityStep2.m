
k=32;

allHist={5}
for i=1:3
    
    i
    textons=load(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/textonsBark',num2str(i)','.mat'));
    map=load(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/mapBark',num2str(i)','.mat'));

    textons=textons.textons;
    map=map.map;

    im2=double(imread(strcat('/home/fuanka/Dokumente/CV/LabsCV/Lab06/textures/otherTextons/barkImages/T01_12.jpg')))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');

    histc(tmap(:),1:k)'
    allHist{i}=histc(tmap(:),1:k)

end


allHist


pdist2(allHist{1}',allHist{2}','chisq')
pdist2(allHist{2}',allHist{3}','chisq')
pdist2(allHist{1}',allHist{3}','chisq')


