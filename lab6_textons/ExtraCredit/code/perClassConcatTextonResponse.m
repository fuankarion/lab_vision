function concatResponses=perClassConcatTextonResponse(pathTextonResponseData,class,numTextons)
   
    D=dir(strcat(pathTextonResponseData,'/',class,'*.mat'));
    
    concatResponses=cell([38,2]);
    sizeAvgResponse=size(concatResponses)
    
    pathFile1=strcat(pathTextonResponseData,'/',D(1).name);
    concatResponses=load(pathFile1);    
    concatResponses=concatResponses.aResponse;
    
    
    randomTextonResponseIdx=randi(length(D),[1,numTextons-1])
    numelrandomTextonResponseIdx=numel(randomTextonResponseIdx)
    for matIdx = 1:numel(randomTextonResponseIdx)
        randomIdx=randomTextonResponseIdx(matIdx)
        fullFilePath=strcat(pathTextonResponseData,'/',D(randomTextonResponseIdx(matIdx)).name);
        fullFilePath
        textonReponseData =load(fullFilePath);
        
        for i=1:sizeAvgResponse(1)
            for j=1:sizeAvgResponse(2)
                concatResponses{i,j}=horzcat(concatResponses{i,j},textonReponseData.aResponse{i,j});
            end
        end
        
        verify=size(concatResponses)
        verify2=size(concatResponses{1,1})
        
    end
    
  
end

