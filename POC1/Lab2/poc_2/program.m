[fn,pn]=uigetfile({'*.png'}, 'Select an image'); 
I = imread([pn,fn]); 
[fn,pn]=uigetfile({'*.png'}, 'Select'); 
Im1 = imread([pn,fn]);
[Nx,Ny] = size(I); 
Macierz_bil = uint8(zeros(Nx,Ny)); 
Macierz_mns = uint8(zeros(Nx,Ny)); 
%Demosaic 
Dem = demosaic(I,'bggr'); 

%Wydzielanie kana³ow 
R = wydziel(I,'r'); 
G = wydziel(I,'g'); 
B = wydziel(I,'b');   

%Inerpolacja biliniowa
Ra = interpolacja_czerwony_niebieski(R); 
Ga = interpolacja_zielony(G); 
Ba = interpolacja_czerwony_niebieski(B);
 
Macierz_bil(:,:,1) = Ba;
Macierz_bil(:,:,2) = Ga; 
Macierz_bil(:,:,3) = Ra;

%Metoda najblizszego sasiada 
Rs = najblizszego_sasiada(R);
Gs = najblizszego_sasiada(G); 
Bs = najblizszego_sasiada(B); 

Macierz_mns(:,:,3) = Rs;  
Macierz_mns(:,:,2) = Gs;  
Macierz_mns(:,:,1) = Bs;

%porownanie wyników 
figure;
imshow(I); 
title('Obraz oryginalny'); 

figure;
imshow(Macierz_bil); 
title('Metoda bilinowa'); 

figure;
imshow(Macierz_mns); 
title('Metoda s¹siada'); 

figure;
imshow(Dem); 
title('Demosaic'); 

figure;
imshow(Im1); 
title('GT');

% subplot(1,5,1), imshow(I), title('CFA')
% subplot(1,5,2), imshow(Macierz_mns), title('Metoda s¹siada')
% subplot(1,5,3), imshow(Macierz_bil), title('Metoda biliniowa')
% subplot(1,5,4), imshow(Dem), title('Metoda Demosaic')
% subplot(1,5,5), imshow(Im1), title('GT')

% subplot(1,3,1), imshow(I), title('CFA')
% subplot(1,3,2), imshow(Macierz_mns), title('Metoda s¹siada')
% subplot(1,3,3), imshow(Im1), title('GT')


% subplot(1,3,1), imshow(I), title('CFA')
% subplot(1,3,2), imshow(Macierz_mns), title('Metoda biliniowa')
% subplot(1,3,3), imshow(Im1), title('GT')

