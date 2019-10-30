%%
clear all
close all
iterations=5;
%mask = [-1 -1 -1; -1 9 -1;-1 -1 -1];
mask = [0 -1 0; -1 5 -1;0 -1 0];
img = imread('C:\Users\michal\Desktop\POC\POC_@\obrazki\lena.bmp');
img = rgb2gray(img);
img = im2double(img);
imgs{1} = img;
titles{1} = 'orginal';

frameSize=300;
[squareOuput,elipseOutput]=lowFrequencyFiltr(img,frameSize);
obraz_do_fazy=elipseOutput;
elipseOutput = ifft2(ifftshift(elipseOutput));
%% Wyswietlanie

set(figure,'Visible','On');
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
X=fftshift(fft2(img));
subplot(3,3,1); imshow(img,[]); title('Obraz Oryginalny');
subplot(3,3,2); imshow(log(abs(X)+1),[]); title('Widmo Amplitudy');
obraz_we2 = ifft2(ifftshift(X));
subplot(3,3,3); imshow(obraz_we2,[]); title('Obraz Oryginalny');

X=fftshift(fft2(elipseOutput));

subplot(3,3,4); imshow(log(abs(X)+1),[]); title('Widmo Amplitudy');
subplot(3,3,5); imshow(angle(obraz_do_fazy),[]); title('Widmo Fazy');
subplot(3,3,6); imshow(elipseOutput,[]); title('Filtracja dolnoprzepustowa freq');


frameSize=150;
[squareOuput,elipseOutput]=lowFrequencyFiltr(img,frameSize);
obraz_do_fazy=elipseOutput;
elipseOutput = ifft2(ifftshift(elipseOutput));

X=fftshift(fft2(elipseOutput));
subplot(3,3,9); imshow(elipseOutput,[]); title('Filtracja dolnoprzepustowa freq');
subplot(3,3,7); imshow(log(abs(X)+1),[]); title('Widmo Amplitudy');
subplot(3,3,8); imshow(angle(obraz_do_fazy),[]); title('Widmo Fazy');

%% Filtracja górnoprzepustowa
frameSize = [10,10];
[squareOuput,elipseOutput]=highFrequencyFiltr(img, frameSize);
obraz_do_fazy=elipseOutput;
elipseOutput = ifft2(ifftshift(elipseOutput));
%% Wyswietlanie
% 
set(figure,'Visible','On');
set(gcf,'units','normalized','outerposition',[0 0 1 1]);
X=fftshift(fft2(img));
subplot(3,3,1); imshow(img,[]); title('Obraz Oryginalny');
subplot(3,3,2); imshow(log(abs(X)+1),[]); title('Widmo Amplitudy');
obraz_we2 = ifft2(ifftshift(X));
subplot(3,3,3); imshow(obraz_we2,[]); title('Obraz Oryginalny');

X=fftshift(fft2(elipseOutput));

subplot(3,3,4); imshow(log(abs(obraz_do_fazy)+1),[]); title('Widmo Amplitudy');
subplot(3,3,5); imshow(angle(obraz_do_fazy),[]); title('Widmo Fazy');
subplot(3,3,6); imshow(elipseOutput,[]); title('Filtracja górnoprzepustowy freq');

frameSize = [50,50];
[squareOuput,elipseOutput]=highFrequencyFiltr(img, frameSize);

obraz_do_fazy=elipseOutput;
elipseOutput = ifft2(ifftshift(elipseOutput));

X=fftshift(fft2(elipseOutput));
subplot(3,3,9); imshow(elipseOutput,[]); title('Filtracja górnoprzepustowy freq');
subplot(3,3,7); imshow(log(abs(obraz_do_fazy)+1),[]); title('Widmo Amplitudy');
subplot(3,3,8); imshow(angle(obraz_do_fazy),[]); title('Widmo Fazy');
% saveas(gcf,['Widma_po_filtracji_gorno_freq\' nazwa '.png']);

