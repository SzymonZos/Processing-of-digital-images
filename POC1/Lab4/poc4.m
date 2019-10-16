%% 1
imgs_org{1} = imread('baboon_512x512.bmp');
imgs_org{2} = imread('lena_512x512.bmp');
imgs_org{3} = imread('peppers3_512x512.bmp');

[no_colors, imgs]= get_no_colors_all(imgs_org);

%% 2 bits
spaces_rgb = [8 8 4;
              4 2 2;
              4 4 1];
imgs_2_bits_comp = cell(0);
imgs_2_bits_comp(:, 1) = imgs(:, 1);
imgs_2_bits_comp = cellfun(@rgb2gray, imgs_2_bits_comp, 'UniformOutput', 0);
imgs_2_bits_comp = append_results_static(imgs_2_bits_comp(:, 1), 2, @quantise_2_bits, imgs_2_bits_comp);
%imgs_2_bits_comp(:, end+1) = imgs(:, 1);
%imgs_2_bits_comp = append_results_static(imgs(:,1), spaces_rgb, @quantise_dynamic_all, imgs_2_bits_comp, 0:256);
imgs_2_bits_comp = cellfun(@uint8, imgs_2_bits_comp, 'UniformOutput', 0);
PSNR_2_bits = get_psnr(imgs_2_bits_comp);
no_colors_2_bits_comp = cellfun(@(img) get_no_colors(img), imgs_2_bits_comp);

imshow_all(imgs_2_bits_comp, spaces_rgb, PSNR_2_bits, no_colors_2_bits_comp);

%% HSV
spaces_hsv = [2 1 5;
              3 2 2;
              2 3 2;
              5 3 1];
eps1 = 1/360;   
eps2 = 1/255;

imgs_hsv_comp = cell(0);
imgs_hsv_comp(:, 1) = imgs(:, 2);
imgs_hsv_comp = append_results_static(imgs(:,2), spaces_hsv, @quantise_hsv, imgs_hsv_comp);
imgs_hsv_comp(:, end+1) = imgs(:, 2);
imgs_hsv_comp = append_results_static(imgs(:,2), spaces_hsv, @quantise_dynamic_all, imgs_hsv_comp, 0:eps1:1+eps1);

imgs_hsv_comp = cellfun(@hsv2rgb, imgs_hsv_comp, 'UniformOutput', 0);
imgs_hsv_comp = cellfun(@(img) 255*img, imgs_hsv_comp, 'UniformOutput', 0);
imgs_hsv_comp = cellfun(@uint8, imgs_hsv_comp, 'UniformOutput', 0);
PSNR_hsv = get_psnr(imgs_hsv_comp);
imshow_all(imgs_hsv_comp, spaces_hsv, PSNR_hsv);

%% RGB, HSV
spaces_rgb = [8 8 4;
              4 2 2];
spaces_hsv = [10 5 5;
              12 4 5];

imgs_mix_comp_rgb = cell(0);
imgs_mix_comp_rgb(:, 1) = imgs(:, 1);
imgs_mix_comp_rgb = append_results_static(imgs(:,1), spaces_rgb, @quantise_rgb, imgs_mix_comp_rgb);

imgs_mix_comp_rgb = cellfun(@uint8, imgs_mix_comp_rgb, 'UniformOutput', 0);

imgs_mix_comp_hsv = cell(0);
imgs_mix_comp_hsv = append_results_static(imgs(:,2), spaces_hsv, @quantise_hsv, imgs_mix_comp_hsv);

imgs_mix_comp_hsv = cellfun(@hsv2rgb, imgs_mix_comp_hsv, 'UniformOutput', 0);
imgs_mix_comp_hsv = cellfun(@(img) 255*img, imgs_mix_comp_hsv, 'UniformOutput', 0);
imgs_mix_comp_hsv = cellfun(@uint8, imgs_mix_comp_hsv, 'UniformOutput', 0);

imgs_mix_comp = [imgs_mix_comp_rgb, imgs_mix_comp_hsv];

PSNR_mix = get_psnr(imgs_mix_comp);
imshow_all(imgs_mix_comp, [spaces_rgb; spaces_hsv], PSNR_mix);
