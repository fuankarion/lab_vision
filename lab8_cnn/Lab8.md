
### CNN architecture
The base for the first attepts at the network initialization was to explicitely include the texons filters (Leung & Malik) into a network similar to the character CNN provided with the code base. This proved to be inefficient and ineffective. A follow up work tried to use the very same Digit network to classify the textons, again with poor results. A deeper version of the character CNN was also implemented, agian with very poor results. The appoach was then to build a very somwath deep networkd with a very diffrent architecture to those mentioned before.

####Why It works (Ablation Tests)
It is hard to fomaly explain why this network performs well on the texture recognition problem however ablation test  shed some light on the more relevant elements of the network

Convolutional Layer ablation

Final Layer| Error | Error Top5
-----|--------------|-----------|-------
Conv 2|%|%
Conv 3|%|%
Conv 4|%|%
Conv 5|%|%


Relu Layer ablation

Pooling Layer ablation

### Trainig set preprocessing 
The initial division for the traing and test set was 70%-30% (XXX-7500) images each.

### Jittering function
After a review f the provided code..

### Additional Tweaks


### Results

Figure XXX shows the error and  Top5 error during a traing process limited to 1 hour in a Nvidia Tesla K40 

Best results are achieve for the following paramaters
Batch Size:180
Learning Rate:
