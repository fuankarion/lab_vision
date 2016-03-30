function [finalDescriptor, finalLabels] = createTrainigSet( trainDir )
     D=dir(strcat(trainDir,'/*.mat'));
     
     
     %sample for size calc
     textonsResponses=load(strcat(trainDir,'/',D(1).name));
     textonsResponses=textonsResponses.tFeats32;
     testSize=size(textonsResponses);
         
     finalDescriptor=zeros(numel(D),testSize(1)*testSize(2));
     finalLabels={numel(D)};
     warning('final descriptor memory created');
     
     for i=1:numel(D)
         i
         D(i).name
         
         textonsResponses=load(strcat(trainDir,'/',D(i).name));
         textonsResponses=textonsResponses.tFeats32;
         initSize=size(textonsResponses);
         
         textonsResponses=reshape(textonsResponses,[1,initSize(1)*initSize(2)]);
         finalSize=size(textonsResponses);
         
         finalDescriptor(i,:)=textonsResponses;    
                  
         D(i).name(1:3);
         labelClass=cellstr(labelToClass(D(i).name(1:3)));
         finalLabels(i)=labelClass;
     end

     
end

