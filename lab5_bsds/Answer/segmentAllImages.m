function segmentAllImages( inputDir,outputDir )
    %'/home/fuanka/Dokumente/CV/LabsCV/Lab05/BSR/bench/data/images'
    %'/home/fuanka/Dokumente/CV/LabsCV/Lab05/BSR/bench/data/segs/mine'
    addpath '/home/fuanka/Dokumente/CV/lab_vision/lab4_segmentation/Methods'
    colorSpace='hsv+xy';
    method='gmm';
    k=1;
    
    sDir = dir(strcat(inputDir,'/*.jpg'));
    for imageIdx = 1:length(sDir)
        imageIdx
       
        sDir(imageIdx).name
        nameSplit = strsplit( sDir(imageIdx).name,'.')
        img = imread(strcat(inputDir,'/',sDir(imageIdx).name));
        
        segmented1=segment_by_clustering(img,colorSpace,method,k)
        segmented2=segment_by_clustering(img,colorSpace,method,k+1)
        segmented3=segment_by_clustering(img,colorSpace,method,k+2)
        segmented4=segment_by_clustering(img,colorSpace,method,k+3)
        segmented5=segment_by_clustering(img,colorSpace,method,k+4)
        segmented6=segment_by_clustering(img,colorSpace,method,k+5)
        segmented7=segment_by_clustering(img,colorSpace,method,k+6)
        segmented8=segment_by_clustering(img,colorSpace,method,k+7)
        segmented9=segment_by_clustering(img,colorSpace,method,k+8)
        segmented10=segment_by_clustering(img,colorSpace,method,k+9)
        segmented11=segment_by_clustering(img,colorSpace,method,k+10)
        segmented12=segment_by_clustering(img,colorSpace,method,k+11)
        segmented13=segment_by_clustering(img,colorSpace,method,k+12)
        
        segs=cell(1,13)
        
        segs{1}=uint16(segmented1)
        segs{2}=uint16(segmented2)%Hack
        segs{3}=uint16(segmented3)
        segs{4}=uint16(segmented4)
        segs{5}=uint16(segmented5)
        segs{6}=uint16(segmented6)
        segs{7}=uint16(segmented7)
        segs{8}=uint16(segmented8)
        segs{9}=uint16(segmented9)
        segs{10}=uint16(segmented10)
        segs{11}=uint16(segmented11)
        segs{12}=uint16(segmented12)
        segs{13}=uint16(segmented13)
    
        idxAsString = char(nameSplit(1))
        save(strcat(outputDir,'/', idxAsString),'segs') 
        %imwrite(segmented,strcat(outputDir,'/', idxAsString,'.mat')) 
    end
end

