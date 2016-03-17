function [ ] = testSegment( sorceDir,targetDir )
    addpath '/home/fuanka/Dokumente/CV/lab_vision/lab4_segmentation/Methods'
    
    colorSpace='rgb+xy';
    
    sDir = dir(strcat(sorceDir,'/*.jpg'));
    k=6
    for imageIdx = 1:length(sDir)
       imageIdx
       if(imageIdx>30)
           break
       end
       sDir(imageIdx).name
       img = imread(strcat(sorceDir,'/',sDir(imageIdx).name));

       segmentedKmeans=segment_by_clustering(img,colorSpace,'k-means',k);
       segmentedGMM=segment_by_clustering(img,colorSpace,'gmm',k);
       segmentedHierach=segment_by_clustering(img,colorSpace,'hierarchical',k);
       segmentedWatershed=segment_by_clustering(img,colorSpace,'watershed',k);

       imgToWrite=horzcat(mat2gray(rgb2gray(img)),mat2gray(segmentedKmeans),mat2gray(segmentedGMM),mat2gray(segmentedHierach),mat2gray(segmentedWatershed));
       imwrite(imgToWrite,strcat(targetDir,'/',int2str(k),colorSpace,sDir(imageIdx).name));
    end
    
      
end

