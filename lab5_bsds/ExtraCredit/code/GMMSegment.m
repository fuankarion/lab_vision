function [ clustered ] = GMMSegment( lineImage,originalSize,numClusters )
    warning('Start GMMSegment!!')
   
    model=fitgmdist(im2double(lineImage),numClusters,'RegularizationValue',0.0001);
    clustered = cluster(model,im2double(lineImage));
    clustered = reshape(clustered,originalSize(1),originalSize(2));
end

