clear;
%% 1. Matryca Bayera
tic
orig_img_CFA = imread('./Bayer/CFA_sRGB/IMG_0016_srgb_CFA.png');
orig_img_GT = imread('./Bayer/GT_sRGB/IMG_0016_srgb.png');

orig_img_CFA_2 = imread('./Bayer/CFA_sRGB/IMG_0440_srgb_CFA.png');
orig_img_GT_2 = imread('./Bayer/GT_sRGB/IMG_0440_srgb.png');

[gbrg_img, grbg_img, bggr_img, rggb_img] = demosaic_options(orig_img_CFA);
[gbrg_img_2, grbg_img_2, bggr_img_2, rggb_img_2] = demosaic_options(orig_img_CFA_2);

figure
subplot(2,3,1), imshow(orig_img_CFA), title('Original image CFA');
subplot(2,3,2), imshow(orig_img_GT), title('Original image GT');
subplot(2,3,3), imshow(gbrg_img), title('Demosaiced GBRG');
subplot(2,3,4), imshow(grbg_img), title('Demosaiced GRBG');
subplot(2,3,5), imshow(bggr_img), title('Demosaiced BGGR');
subplot(2,3,6), imshow(rggb_img), title('Demosaiced RGGB');

figure
subplot(2,3,1), imshow(orig_img_CFA_2), title('Original image CFA 2');
subplot(2,3,2), imshow(orig_img_GT_2), title('Original image GT 2');
subplot(2,3,3), imshow(gbrg_img_2), title('Demosaiced GBRG 2');
subplot(2,3,4), imshow(grbg_img_2), title('Demosaiced GRBG 2');
subplot(2,3,5), imshow(bggr_img_2), title('Demosaiced BGGR 2');
subplot(2,3,6), imshow(rggb_img_2), title('Demosaiced RGGB 2');


[red_channel, green_channel, blue_channel] = bayer_channels(orig_img_CFA);
[red_channel_2, green_channel_2, blue_channel_2] = bayer_channels(orig_img_CFA_2);
%{
figure
subplot(1, 3, 1); imshow(red_channel); title('Red channel CFA');
subplot(1, 3, 2); imshow(green_channel); title('Green channel CFA');
subplot(1, 3, 3); imshow(blue_channel); title('Blue channel CFA');
%}
toc
%% 2. Interpolacja - najblizszy sasiad
tic
nn_red_channel = nearest_neighbor(red_channel, 'r');
nn_green_channel = nearest_neighbor(green_channel, 'g');
nn_blue_channel = nearest_neighbor(blue_channel, 'b');

nn_red_channel_2 = nearest_neighbor(red_channel_2, 'r');
nn_green_channel_2 = nearest_neighbor(green_channel_2, 'g');
nn_blue_channel_2 = nearest_neighbor(blue_channel_2, 'b');

%{
figure
subplot(1, 3, 1); imshow(nn_red_channel); title('Red channel nearest neighbor');
subplot(1, 3, 2); imshow(nn_green_channel); title('Green channel nearest neighbor');
subplot(1, 3, 3); imshow(nn_blue_channel); title('Blue channel nearest neighbor');
%}

nn_img(:,:,3) = nn_red_channel;
nn_img(:,:,2) = nn_green_channel;
nn_img(:,:,1) = nn_blue_channel;

nn_img_2(:,:,3) = nn_red_channel_2;
nn_img_2(:,:,2) = nn_green_channel_2;
nn_img_2(:,:,1) = nn_blue_channel_2;

figure
subplot(2,3,1), imshow(imcrop(orig_img_CFA, [300, 100, 150, 70])), title('Original image CFA 2');
subplot(2,3,2), imshow(imcrop(nn_img, [300, 100, 150, 70])), title('NN 1');
subplot(2,3,3), imshow(imcrop(orig_img_GT, [300, 100, 150, 70])), title('Original image GT 2');
subplot(2,3,4), imshow(imcrop(orig_img_CFA_2, [300, 100, 150, 70])), title('Original image CFA 2');
subplot(2,3,5), imshow(imcrop(nn_img_2, [300, 100, 150, 70])), title('NN 2');
subplot(2,3,6), imshow(imcrop(orig_img_GT_2, [300, 100, 150, 70])), title('Original image GT 2');

toc
%% 3. Interpolacja biliniowa
tic
b_red_channel = bilinear(red_channel, 'r');
b_green_channel = bilinear(green_channel, 'g');
b_blue_channel = bilinear(blue_channel, 'b');

b_red_channel_2 = bilinear(red_channel_2, 'r');
b_green_channel_2 = bilinear(green_channel_2, 'g');
b_blue_channel_2 = bilinear(blue_channel_2, 'b');

%{
figure
subplot(1, 3, 1); imshow(b_red_channel); title('Red channel bilinear');
subplot(1, 3, 2); imshow(b_green_channel); title('Green channel bilinear');
subplot(1, 3, 3); imshow(b_blue_channel); title('Blue channel bilinear');
%}

b_img(:,:,3) = b_red_channel;
b_img(:,:,2) = b_green_channel;
b_img(:,:,1) = b_blue_channel;

b_img_2(:,:,3) = b_red_channel_2;
b_img_2(:,:,2) = b_green_channel_2;
b_img_2(:,:,1) = b_blue_channel_2;

figure
subplot(2,3,1), imshow(imcrop(orig_img_CFA, [300, 100, 150, 70])), title('Original image CFA 2');
subplot(2,3,2), imshow(imcrop(b_img, [300, 100, 150, 70])), title('B 1');
subplot(2,3,3), imshow(imcrop(orig_img_GT, [300, 100, 150, 70])), title('Original image GT 2');
subplot(2,3,4), imshow(imcrop(orig_img_CFA_2, [300, 100, 150, 70])), title('Original image CFA 2');
subplot(2,3,5), imshow(imcrop(b_img_2, [300, 100, 150, 70])), title('B 2');
subplot(2,3,6), imshow(imcrop(orig_img_GT_2, [300, 100, 150, 70])), title('Original image GT 2');
toc
%% 4. Porównanie interpolacji

%{
figure
subplot(1, 2, 1); imshow(nn_img); title('Nearest neighbor')
subplot(1, 2, 2); imshow(b_img), title('Bilinear')
figure
subplot(1, 2, 1); imshow(imcrop(nn_img, [300, 100, 150, 70])), title('Nearest neighbor, enlarged');
subplot(1, 2, 2); imshow(imcrop(b_img, [300, 100, 150, 70])), title('Bilinear, enlarged');
%}

[nn_PSNR, nn_SNR] = psnr(nn_img, orig_img_GT);
[b_PSNR, b_SNR] = psnr(b_img, orig_img_GT);
[mat_PSNR, mat_SNR] = psnr(bggr_img, orig_img_GT);

nn_IMMSE = immse(nn_img, orig_img_GT);
b_IMSE = immse(b_img, orig_img_GT);

[nn_PSNR_2, nn_SNR_2] = psnr(nn_img_2, orig_img_GT_2);
[b_PSNR_2, b_SNR_2] = psnr(b_img_2, orig_img_GT_2);
[mat_PSNR_2, mat_SNR_2] = psnr(bggr_img_2, orig_img_GT_2);

nn_IMMSE_2 = immse(nn_img_2, orig_img_GT_2);
b_IMSE_2 = immse(b_img, orig_img_GT_2);

% Im wiekszy wspolczynnik, tym lepsza jakosc
fprintf('nn_PSNR: %d\n', nn_PSNR);
fprintf('nn_SNR: %d\n', nn_SNR);
fprintf('b_PSNR: %d\n', b_PSNR);
fprintf('b_SNR: %d\n', b_SNR);

% Im mniejszy wspolczynnik, tym lepsza jakosc
fprintf('nn_IMMSE: %d\n', nn_IMMSE);
fprintf('b_IMSE: %d\n', b_IMSE);


figure
subplot(2,4,1), imshow(imcrop(nn_img, [300, 100, 150, 70])), title(['NN 1: ', num2str(nn_PSNR)]);
subplot(2,4,2), imshow(imcrop(b_img, [300, 100, 150, 70])), title(['B 1: ', num2str(b_PSNR)]);
subplot(2,4,3), imshow(imcrop(bggr_img, [300, 100, 150, 70])), title(['MAT 1: ', num2str(mat_PSNR)]);
subplot(2,4,4), imshow(imcrop(orig_img_GT, [300, 100, 150, 70])), title('Original image GT 1');
subplot(2,4,5), imshow(imcrop(nn_img_2, [300, 100, 150, 70])), title(['NN 2: ', num2str(nn_PSNR_2)]);
subplot(2,4,6), imshow(imcrop(b_img_2, [300, 100, 150, 70])), title(['B 2: ', num2str(b_PSNR_2)]);
subplot(2,4,7), imshow(imcrop(bggr_img_2, [300, 100, 150, 70])), title(['MAT 2: ', num2str(mat_PSNR_2)]);
subplot(2,4,8), imshow(imcrop(orig_img_GT_2, [300, 100, 150, 70])), title('Original image GT 2');