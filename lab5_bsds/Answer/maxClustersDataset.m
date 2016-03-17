function maxClustersDataset( )
    inputDir='/home/fuanka/Dokumente/CV/LabsCV/Lab05/BSR/BSDS500/data/groundTruth/train';
    sDir = dir(strcat(inputDir,'/*.mat'));
    
    maxSeg=zeros(1)
    for imageIdx = 1:length(sDir)
        sDir(imageIdx).name
        theirs=load(strcat(inputDir,'/',sDir(imageIdx).name));
        for k=1:length(theirs.groundTruth)
           %theirs.groundTruth{k}.Segmentation
            uq=unique(theirs.groundTruth{k}.Segmentation)
            h = [uq,histc(theirs.groundTruth{k}.Segmentation(:),uq)]
            h=double(h)
            h(:,2)=h(:,2)./(481*321);
            h(:,2)=h(:,2)>0.02;
            h= h(:,1).* h(:,2)
            
            maxSeg(end+1) = length(unique(h))-1;
        end        
    end
    
     mean(maxSeg)
     std(maxSeg)
    % plot(maxSeg)
    
end

