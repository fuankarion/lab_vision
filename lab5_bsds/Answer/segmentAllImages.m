function [ ] = egmentAllImages( sorceDir,targetDir )
    addpath '/home/fuanka/Dokumente/CV/lab_vision/lab4_segmentation/Methods'
    
    colorSpace='lab+xy';
    
    sDir = dir(strcat(sorceDir,'/*.jpg'));
    for k=2:10
        for imageIdx = 1:length(sDir)
           if(imageIdx>30)
               break
           end
           sDir(imageIdx).name
           img = imread(strcat(sorceDir,'/',sDir(imageIdx).name));
           segmentedKmeans=segment_by_clustering(img,'lab+xy','k-means',k);
           segmentedGMM=segment_by_clustering(img,'lab+xy','gmm',k);
           segmentedHierach=segment_by_clustering(img,'lab+xy','hierarchicals',k);
           segmentedWatershed=segment_by_clustering(img,'lab+xy','watershed',k);
           
           imgToWrite=horzcat(mat2gray(rgb2gray(img)),mat2gray(segmentedKmeans),mat2gray(segmentedGMM),mat2gray(segmentedHierach),mat2gray(segmentedWatershed));
           imwrite(mat2gray(imgToWrite),strcat(targetDir,'/',int2str(k),colorSpace,sDir(imageIdx).name));
        end
    end
      
end

