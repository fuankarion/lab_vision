
### CNN architecture
The base idea for the first attempts at the network initialization was to explicitly include the textons filters (Leung & Malik) into a network with similar structure  to the character CNN provided with the code base.  This proved to be inefficient and ineffective regardless of the orientation and scale of the texton filters.

A follow up work tried to use the very same Digit network to classify the textons, again with very poor results. A deeper version (1, 2 and 3 convolutional layers deeper) of the Digit network was also implemented, again with very poor results. 

The final approach was then to build a very somewhat deep network (6 convolutional layers) with a very different architecture to those mentioned before i.e smaller random filters. This network performed surprisingly better than the initial approaches. The final CNN is as follows:

Type Layer| Filter Size | Stride 
-----|--------------|-----------
Conv |64x64 (original Image)|NA
Conv |3x3x32|1
Relu||
Conv |3x3x32|1
Max Pool |2x2|2
Conv |3x3x64|1
Relu||
Conv |3x3x64|1
Max Pool |2x2|2
Max Pool |2x2|2
Conv |3x3x128|1
Relu||
Conv |3x3x128|1
Max Pool |2x2|2
Conv |1x1x25|1


### Results
Figure 1 shows the error and  Top5 error during a training process limited to 1 hour in a Nvidia Tesla K40 

Best results are achieve for the following parameters

Batch Size:180

Learning Rate:0.001

####Why It works (Ablation Tests)
It is hard to formally explain why this network performs well on the texture recognition problem, however, ablation tests can shed some light on the more relevant elements of the network.

Al test contain the same basic experimental setup:
Initial Network: as described above
Learning Rate: 0.001
Dataset: As provided from the instructors, 12500 images for train, 12500 images for validation
Max 10 epoch for training.
All images were rescaled to 64x64.


Convolutional Layer ablation (Notice the final layer,conv 7, is never removed, as it is allways required to have a final layer to transform the ouput of the network into a 1x25 array)

Layers Removed| Error | Error Top5
-----|--------------|-----------|-------
Conv 2,3,4,5,6|%|%
Conv 3,4,5,6|%|%
Conv 4,5,6|%|%
Conv 5,6|19.7%|1.6%
Conv 6| 32.5 |4.6%
Full| 36.4%|5.0%



