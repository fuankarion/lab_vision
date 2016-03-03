###Original images
These are original images selected for this laboratory
<table>
<tr>
<td>
	<img src="wes.jpg" alt="Wes Original" width="345" height="460">
</td>
<td>
	<img src="zeus.jpg" alt="Zeus Original" width="460" height="345">
</td>
</tr>
</table>

The selected images are of two puppies: a west highland terrier (left) and a German Shepperd (right). The first picture was taken by the author, while the second was taken by a relative. The hardware used to make the pictures is very different. The picture of the terrier was made with a low resolution ccd sensor on an Asus note 7 tablet and the second was made with a nikon L820 camera. Hence the resolution is very different; the original terrier picture has a resolution of 960x1280 pixels (2 mp), the  shepherd picture has an original resolution of 4608x3456 (16 mp). It is also worth noticing that the orientation of the original images is different portrait (terrier) and landscape (shepperd)

###Image Transformation
While the position and orientation of the dogs faces is very close, some simple operations had to be made to better align the images. 
First, as the image of the german shepherd is at much higher resolution, it is rescaled to smaller resolution so that both images have the same height.
Second, images are cropped to 600x680 size. The main goal for this cropping operation is to keep the eyes of the dogs close to the center of the image.
Third, the  image of the shepherd is rotated 12 degrees to the left to better align the eyes and noses of the dogs
These are the resulting images

<table>
<tr>
<td>
	<img src="wesFinal.jpg" alt="Wes Final" width="345" height="460">
</td>
<td>
	<img src="zeusFinal.jpg" alt="Zeus Final" width="460" height="345">
</td>
</tr>
</table>
Its is worth noticing that the shapes of the heads of the dogs are slightly different. The sheppard has a thinner face, while the broader face of the terriers looks much more wide thanks to the long hair. No preprocessing is applied to correct for this feature as this will highly distort other elements in the image, and the eyes and the ears already have a fair correspondence

###Hybrid Image
The obtained image is the following
<img src="Weus.jpg" alt="Weus :)" width="600" height="680" style="display: block; margin-left: auto; margin-right: auto">

###Pyramid Image
When a pyramid is built clearly the larger images resemble the picture of the shepper, while the smaller resemble the original picture of the terrier.  It is interesting that, while the alignment of the body of the dogs is completely different, the body of the shepherd is almost completely contained in the long hair of the terrier, thus it almost completely disappears at low resolutions
<img src="pyr.jpg" alt="Pyramid" width="897" height="523">


