function clustered = HierachicalSegment( lineImage,originalSize,numClusters  )
    warning('Start HierachicalSegment!!')
  
    infoDistance = pdist(lineImage,'minkowski');
    %Z = linkage(infoDistance);
    Z=linkage(lineImage,'ward','euclidean','savememory','on');
    
    clustered = cluster(Z,'maxclust',numClusters);
    size(clustered)
    clustered = reshape(clustered,originalSize(1),originalSize(2));
    
end

