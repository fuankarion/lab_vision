function [ output_args ] = calculateFullSetOfTextons( mainDir,targetDir32,targetDir64,targetDir96)

    addpath('/home/fuanka/Dokumente/CV/lab_vision/lab6_textons/lib')

    textons32=load('/home/fuanka/Malik/storage/disk0/Other/textures/calculatedTextons32/textons.mat');
    %textons64=load('/home/fuanka/Malik/storage/disk0/Other/textures/calculatedTextons64/textons.mat');
    textons96=load('/home/fuanka/Malik/storage/disk0/Other/textures/calculatedTextons96/textons.mat');
        
    warning('Done loading textons')
        
    D=dir(mainDir);
    
    [fb] = fbCreate;
    
    for i=3:numel(D)% skip .. and . which are files in linux
        D(i).name
        F=dir(strcat(mainDir,D(i).name,'/*.jpg'));
        for j=1:numel(F)
            name=strcat(mainDir,D(i).name,'/',F(j).name)
            nameSize=size(F(j).name)
            img=imread(name);
           
            tFeats32=calculateTextonsFromDict(textons32.textons,fb,img, 32);
            save(strcat(targetDir32,'/',F(j).name(1:nameSize(2)-3),'mat'),'tFeats32') 
            
            %tFeats64=calculateTextonsFromDict(textons64.textons,fb,img, 64)
            %save(strcat(targetDir64,'/',F(j).name(1:nameSize(2)-3),'mat'),'tFeats64') 
            
            tFeats96=calculateTextonsFromDict(textons96.textons,fb,img, 96);
            save(strcat(targetDir96,'/',F(j).name(1:nameSize(2)-3),'mat'),'tFeats96') 
            
        end
    end

end

