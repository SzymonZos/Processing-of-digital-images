function przestrzenie
[nz,s]=uigetfile('*.bmp','Wybierz obraz:');
obraz=imread([s,nz]); 
obraz_hsv = rgb2hsv(obraz);
obraz_YCbCR = rgb2ycbcr(obraz);
imwrite(obraz_hsv, ['hsv_', nz ], 'png')
imwrite(obraz_YCbCR, ['YCbCR_', nz ], 'png')