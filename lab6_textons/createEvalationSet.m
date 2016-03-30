function [gt,predicted]= createEvalationSet( ensemble,testDir )

    D=dir(strcat(testDir,'/*.mat'));
    
    gt=zeros(numel(D),1)
    predicted=zeros(numel(D),1)
    for i=1:numel(D)
        i
        D(i).name
        aTestCase=load(strcat(testDir,'/',D(i).name));
        tFeats=aTestCase.tFeats32;
        initSize=size(tFeats);

        tFeats=reshape(tFeats,[1,initSize(1)*initSize(2)]);
        tic;
        [Yfit] = predict(ensemble,tFeats)
        toc;
                
        predicted(i)=classToNumber(Yfit{1});
        D(i).name(1:3);
        gt(i)=classToNumber(labelToClass(D(i).name(1:3)));
        
    end
end