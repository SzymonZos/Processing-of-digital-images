%%load
clear all
img = imread('obrazki/coins.bmp');
%% Zadanie 1, 2, 3
figure;
subplot(2, 4, 1);
imshow(img);

subplot(2, 4, 2);
imhist(img);

imgbw = im2bw(img, 76/255);
subplot(2, 4, 3);
imshow(imgbw);

imgl = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 4);
imshow(imglc);

subplot(2, 4, 6);
thr = graythresh(img);
histdata = imhist(img);
s = plot(histdata);
dcm_obj = datacursormode();
createDatatip(dcm_obj, s, [thr * 255, histdata(round(thr * 255))]);

imgbw = im2bw(img, thr);
subplot(2, 4, 7);
imshow(imgbw);

imgl = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 8);
imshow(imglc);
%% Zadanie 4
% Zadanie 4a)
figure;
subplot(2, 4, 1);
imshow(img);
title('Original');

thr = graythresh(img);
imgbw = im2bw(img, thr);
subplot(2, 4, 2);
imshow(imgbw);
title('B&W');

imgm = imgaussfilt(img, 6);
subplot(2, 4, 3);
imshow(imgm);
title('Filtered');

thr = graythresh(imgm);
imgmbw = im2bw(imgm, thr);
subplot(2, 4, 4);
imshow(imgmbw);
title('B&W Filtered');

subplot(2, 4, 5);
imhist(img);
title('Orig');

[imgl, N] = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 6);
imshow(imglc);
title(['Labeled, ', num2str(N)]);

subplot(2, 4, 7);
imhist(imgm);
title('Filtered');

[imgml, N] = bwlabel(imgmbw);
imgmlc = label2rgb(imgml);
subplot(2, 4, 8);
imshow(imgmlc);
title(['Filtered Labeled, ', num2str(N)]);

% Zadanie 4b)
imgn = imnoise(img, 'salt & pepper', 0.02);
figure;
subplot(2, 4, 1);
imshow(imgn);
title('Original Noised S&P');

thr = graythresh(imgn);
imgbw = im2bw(imgn, thr);
subplot(2, 4, 2);
imshow(imgbw);
title('B&W');

imgm = medfilt2(imgn, [5, 5]);
subplot(2, 4, 3);
imshow(imgm);
title('Median');

thr = graythresh(imgm);
imgmbw = im2bw(imgm, thr);
subplot(2, 4, 4);
imshow(imgmbw);
title('B&W Median');

subplot(2, 4, 5);
imhist(imgn);
title('B&W Noised');

[imgl, N] = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 6);
imshow(imglc);
title(['B&W Noise Labeled, ', num2str(N)]);

subplot(2, 4, 7);
imhist(imgm);
title('Median');

[imgml, N] = bwlabel(imgmbw);
imgmlc = label2rgb(imgml);
subplot(2, 4, 8);
imshow(imgmlc);
title(['Median Labeled, ', num2str(N)]);

% Zadanie 4c)
imgn = imnoise(img, 'gaussian', 0.1);
figure;
subplot(2, 4, 1);
imshow(imgn);
title('Original Noised Gauss');

thr = graythresh(imgn);
imgbw = im2bw(imgn, thr);
subplot(2, 4, 2);
imshow(imgbw);
title('B&W');

imgm = imgaussfilt(imgn, 10);
subplot(2, 4, 3);
imshow(imgm);
title('Gauss');

thr = graythresh(imgm);
imgmbw = im2bw(imgm, thr);
subplot(2, 4, 4);
imshow(imgmbw);
title('B&W Gauss');

subplot(2, 4, 5);
imhist(imgn);
title('B&W Noised');

[imgl, N] = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 6);
imshow(imglc);
title(['B&W Noised Labeled, ', num2str(N)]);

subplot(2, 4, 7);
imhist(imgm);
title('Gauss');

[imgml, N] = bwlabel(imgmbw);
imgmlc = label2rgb(imgml);
subplot(2, 4, 8);
imshow(imgmlc);
title(['Gauss Labeled, ', num2str(N)]);
%% Zadanie 5
figure;
subplot(2, 4, 1);
imshow(img);
title('Original');

img = imgaussfilt(img, 5);

thr = graythresh(img);
imgbw = im2bw(img, thr);

subplot(2, 4, 2);
imshow(imgbw);
title('B&W');

se_erode = strel('square', 30);
imge = imerode(imgbw, se_erode);
se_erode = strel('square', 8);
imge = imclose(imge, se_erode);
subplot(2, 4, 3);
imshow(imge);
title('Eroded and closed');

se_dilate = strel('square', 3);
imgd = imdilate(imgbw, se_dilate);
subplot(2, 4, 4);
imshow(imgd);
title('Dilated');

[imgml, N] = bwlabel(imgbw);
imgmlc = label2rgb(imgml);
subplot(2, 4, 6);
imshow(imgmlc);
title(['Labeled, ', num2str(N)]);

[imgml, N] = bwlabel(imge);
imgmlc = label2rgb(imgml);
subplot(2, 4, 7);
imshow(imgmlc);
title(['Eroded adn closed Labeled, ', num2str(N)]);

[imgml, N] = bwlabel(imgd);
imgmlc = label2rgb(imgml);
subplot(2, 4, 8);
imshow(imgmlc);
title(['Dilated Labeled, ', num2str(N)]);
