function liczba_barw
[nz,s]=uigetfile('*.bmp','Wybierz obraz:');
obraz=imread([s,nz]); 
obraz_hsv = rgb2hsv(obraz);
% obraz_YCbCR = rgb2ycbcr(obraz);
 
%Orginalny obraz
[czas,liczba_kolorow]=licz_kolory(obraz,'RGB');
disp(['Liczba kolorów w obrazie RGB: ', num2str(liczba_kolorow)]);
disp(['Czas wykonywania: ', num2str(czas)]);
 
%Obraz HSV
[czas,liczba_kolorow]=licz_kolory(obraz_hsv,'HSV');
disp(['Liczba kolorów w obrazie HSV: ', num2str(liczba_kolorow)]);
disp(['Czas wykonywania: ', num2str(czas)]);
 
%Obraz YCbCR 
% [czas,liczba_kolorow]=licz_kolory(obraz_YCbCR,'YCbCR');
% disp(['Liczba kolorów w obrazie YCbCr: ', num2str(liczba_kolorow)]);
% disp(['Czas wykonywania: ', num2str(czas)]);
imwrite(obraz, '_RGB.bmp');
imwrite(obraz_hsv, 'HSV(1).bmp');
% imwrite(obraz_YCbCR, 'YCbCR.bmp');
end


