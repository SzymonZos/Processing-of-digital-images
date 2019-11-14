%img_2 = imread('mouse.jpg');
%img_2 = rgb2gray(img);
img = imread('coins_512x512.bmp');
%% 1, 2, 3
exercise_1(img);
exercise_1_neg(img_2);
%% 4a

figure;
subplot(2, 4, 1);
imshow(img);
title('Original');

threshHold = graythresh(img);
img_bw = im2bw(img, threshHold);
subplot(2, 4, 2);
imshow(img_bw);
title('B & W');

img_gauss = imgaussfilt(img, 3);
subplot(2, 4, 3);
imshow(img_gauss);
title('Filtered');

threshHold = graythresh(img_gauss);
img_gauss_bw = im2bw(img_gauss, threshHold);
subplot(2, 4, 4);
imshow(img_gauss_bw);
title('B & W Filtered');

subplot(2, 4, 5);
imhist(img);
title('Original histogram');

[img_l, N] = bwlabel(img_bw);
img_labeled = label2rgb(img_l);
subplot(2, 4, 6);
imshow(img_labeled);
title(['IND, N = ', num2str(N)]);

subplot(2, 4, 7);
imhist(img_gauss);
title('Filtered histogram');

[img_gauss_l, N] = bwlabel(img_gauss_bw);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 8);
imshow(img_gauss_labeled);
title(['Filtered IND, N = ', num2str(N)]);
%% 4b

img_noised = imnoise(img, 'salt & pepper', 0.02);
figure;
subplot(2, 4, 1);
imshow(img_noised);
title('Original Noised S & P');

threshHold = graythresh(img_noised);
img_bw = im2bw(img_noised, threshHold);
subplot(2, 4, 2);
imshow(img_bw);
title('B & W');

img_gauss = medfilt2(img_noised, [5, 5]);
subplot(2, 4, 3);
imshow(img_gauss);
title('Median');

threshHold = graythresh(img_gauss);
img_gauss_bw = im2bw(img_gauss, threshHold);
subplot(2, 4, 4);
imshow(img_gauss_bw);
title('B & W Median');

subplot(2, 4, 5);
imhist(img_noised);
title('B & W noised histogram');

[img_l, N] = bwlabel(img_bw);
img_labeled = label2rgb(img_l);
subplot(2, 4, 6);
imshow(img_labeled);
title(['B & W noised IND, N = ', num2str(N)]);

subplot(2, 4, 7);
imhist(img_gauss);
title('Median histogram');

[img_gauss_l, N] = bwlabel(img_gauss_bw);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 8);
imshow(img_gauss_labeled);
title(['Median IND, N = ', num2str(N)]);
%% 4c

img_noised = imnoise(img, 'gaussian', 0.2);
figure;
subplot(2, 4, 1);
imshow(img_noised);
title('Original Noised Gauss');

threshHold = graythresh(img_noised);
img_bw = im2bw(img_noised, threshHold);
subplot(2, 4, 2);
imshow(img_bw);
title('B & W');

img_gauss = imgaussfilt(img_noised, 2);
subplot(2, 4, 3);
imshow(img_gauss);
title('Gauss');

threshHold = graythresh(img_gauss);
img_gauss_bw = im2bw(img_gauss, threshHold);
subplot(2, 4, 4);
imshow(img_gauss_bw);
title('B & W Gauss');

subplot(2, 4, 5);
imhist(img_noised);
title('B & W Noised histogram');

[img_l, N] = bwlabel(img_bw);
img_labeled = label2rgb(img_l);
subplot(2, 4, 6);
imshow(img_labeled);
title(['B&W Noised IND, N = ', num2str(N)]);

subplot(2, 4, 7);
imhist(img_gauss);
title('Gauss histogramm');

[img_gauss_l, N] = bwlabel(img_gauss_bw);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 8);
imshow(img_gauss_labeled);
title(['Gauss Labeled, N = ', num2str(N)]);
%% Zadanie 5
img = imread('mouse.jpg');
img = rgb2gray(img);

figure;
subplot(2, 4, 1);
imshow(img);
title('Original');

threshHold = graythresh(img);
img_gauss_bw = ~im2bw(img, threshHold);
subplot(2, 4, 2);
imshow(img_gauss_bw);
title('B & W');

se_erode = strel('disk', 5);
img_e = imerode(img_gauss_bw, se_erode);

se_erode = strel('diamond', 20);
img_e = imclose(img_e, se_erode);
subplot(2, 4, 3);
imshow(img_e);
title('Eroded and closed');

se_dilate = strel('disk', 25);
img_d = imdilate(img_e, se_dilate);

se_dilate = strel('disk', 25);
img_d = imerode(img_d, se_dilate);


subplot(2, 4, 4);
imshow(img_d);
title('Dilated');

subplot(2, 4, 5);
imhist(img);
title('Original histogram');

[img_gauss_l, N] = bwlabel(img_gauss_bw);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 6);
imshow(img_gauss_labeled);
title(['IND, N = ', num2str(N)]);

[img_gauss_l, N] = bwlabel(img_e);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 7);
imshow(img_gauss_labeled);
title(['Eroded adn closed IND, N = ', num2str(N)]);

[img_gauss_l, N] = bwlabel(img_d);
img_gauss_labeled = label2rgb(img_gauss_l);
subplot(2, 4, 8);
imshow(img_gauss_labeled);
title(['Dilated IND, N = ', num2str(N)]);
