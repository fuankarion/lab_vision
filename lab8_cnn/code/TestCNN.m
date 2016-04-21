function  res = TestCNN(net,data)

    originalSize=size(data)
    dataStandarized=single(zeros(64,64,originalSize(3)));  
    res=zeros(1,originalSize(3));
    tic;
    for idx = 1:originalSize(3)
        tempResized= imresize(data(:,:,idx),[64,64]);
        tempSingle=single(tempResized);
        dataStandarized(:,:,idx)=tempSingle;
    end
    toc;
    
    tic;
    dataStandarized = dataStandarized- net.imageMean ;
    toc;
   

    for idx = 1:originalSize(3)
        resNet = vl_simplenn(net,dataStandarized(:,:,idx));

        scores = squeeze(gather(resNet(end).x)) ;
        [bestScore, best] = max(scores) ;
        class(best)
        res(idx)=best;
%     figure(1) ; clf ; imagesc(im_) ; axis image ;
%     title(sprintf('%s (%d), score %.3f',...
%     db.meta.classes{best}, best, bestScore)) ;

        sprintf('Predicted class: (%d), score %.3f ', best, bestScore)
    end


end

