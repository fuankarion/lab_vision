function clustered = KmeansSegment( lineImage,originalSize ,numClusters)
    warning('Start KmeansSegment!!')
    
    clustered=kmeans(im2double(lineImage),numClusters);
    clustered = reshape(clustered,originalSize(1),originalSize(2));
end

