function identyfikacja
close all;
[fn,pn]=uigetfile({'*.png'}, 'Select'); 
I = imread([pn,fn]); 
[fn,pn]=uigetfile({'*.png'}, 'Select'); 
I6 = imread([pn,fn]); 

% filter configurations
I1 = demosaic(I,'gbrg'); 
I2 = demosaic(I,'grbg'); 
I3 = demosaic(I,'bggr'); 
I4 = demosaic(I,'rggb'); 

% show images all at one plot
subplot(2,3,1), imshow(I), title('CFA');
subplot(2,3,2), imshow(I4), title('R G G B');
subplot(2,3,3), imshow(I3), title('B G G R');
subplot(2,3,4), imshow(I6), title('GT');
subplot(2,3,5), imshow(I1), title('G B R G'); 
subplot(2,3,6), imshow(I2), title('G R B G');





 