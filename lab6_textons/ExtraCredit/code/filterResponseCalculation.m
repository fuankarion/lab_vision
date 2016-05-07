function responses=filterResponseCalculation(fb,pathImages)
    %pathTextures='/home/jcleon/storage/disk0/Other/textures/train/Bark';
    D=dir(strcat(pathImages,'/*.jpg'));
    
    %parpool(20)
    responses={length(D)}
    for imageIdx = 1:length(D)
        imageIdx
        
        fullFilePath=strcat(pathImages,'/',D(imageIdx).name);
        img = imread(fullFilePath);   
        
        fbResult=fbRun(fb,img);
        fbResultSize=size(fbResult)
        
        responses{imageIdx}=fbResult;
    end
    
end


