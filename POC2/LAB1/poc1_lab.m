%% Init
img = imread('lena_cropped.bmp');

%% Median, LUM - gray Noise = 2%
img_gray = rgb2gray(img); titles{1} = 'org';
img_1 = imnoise(img_gray, 'salt & pepper', 0.02); titles{2} = 'Noise 2%';
img_1_median_RGB = abstractFilter(img_1, [3 3], @median); titles{3} = 'Median 3x3';
img_1_VMF_3_RGB = abstractFilter(img_1, [5 5], @median); titles{4} = 'Median 5x5';
img_1_VMF_5_RGB = abstractFilter(img_1, [3 3], @(subImg)filterLUM(subImg, 0)); titles{5} = 'LUM 3x3 k=0';
img_1_LUM_4 = abstractFilter(img_1, [3 3], @(subImg)filterLUM(subImg, 4)); titles{6} = 'LUM 3x3 k=4';
img_1_LUM_2 = abstractFilter(img_1, [3 3], @(subImg)filterLUM(subImg, 2)); titles{7} = 'LUM 3x3 k=2';
img_1_LUM_5x5 = abstractFilter(img_1, [5 5], @(subImg)filterLUM(subImg, 3)); titles{8} = 'LUM 5x5 k=3';

imgs_comp = {img_gray(2:end-2, 2:end-2) img_1(2:end-2, 2:end-2) img_1_median_RGB(2:end-2, 2:end-2) img_1_VMF_3_RGB(2:end-2, 2:end-2) img_1_VMF_5_RGB(2:end-2, 2:end-2) img_1_LUM_4(2:end-2, 2:end-2) img_1_LUM_2(2:end-2, 2:end-2) img_1_LUM_5x5(2:end-2, 2:end-2)};
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);

%% Median, LUM - gray Noise = 10%
img_gray = rgb2gray(img); titles{1} = 'org';
img_2 = imnoise(img_gray, 'salt & pepper', 0.10); titles{2} = 'Noise 10%';
img_2_median_3 = abstractFilter(img_2, [3 3], @median); titles{3} = 'Median 3x3';
img_2_median_5 = abstractFilter(img_2, [5 5], @median); titles{4} = 'Median 5x5';
img_2_LUM_0 = abstractFilter(img_2, [3 3], @(subImg)filterLUM(subImg, 0)); titles{5} = 'LUM 3x3 k=0';
img_2_LUM_4 = abstractFilter(img_2, [3 3], @(subImg)filterLUM(subImg, 4)); titles{6} = 'LUM 3x3 k=4';
img_2_LUM_2 = abstractFilter(img_2, [3 3], @(subImg)filterLUM(subImg, 2)); titles{7} = 'LUM 3x3 k=2';
img_2_LUM_5x5 = abstractFilter(img_2, [5 5], @(subImg)filterLUM(subImg, 3)); titles{8} = 'LUM 5x5 k=3';

imgs_comp = {img_gray(2:end-2, 2:end-2) img_2(2:end-2, 2:end-2) img_2_median_3(2:end-2, 2:end-2) img_2_median_5(2:end-2, 2:end-2) img_2_LUM_0(2:end-2, 2:end-2) img_2_LUM_4(2:end-2, 2:end-2) img_2_LUM_2(2:end-2, 2:end-2) img_2_LUM_5x5(2:end-2, 2:end-2)};
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);

%% Median, VMF - gray Noise = 2%
titles{1} = 'org';
img_1_RGB = imnoise(img, 'salt & pepper', 0.02); titles{2} = 'Noise 2%';
img_1_median_RGB = abstractFilter(img_1_RGB, [3 3], @median); titles{3} = 'Median 3x3';
img_1_VMF_3_RGB = abstractFilter(img_1_RGB, [3 3], @(subImg)filterVMF(subImg, 1), 1); titles{4} = 'VMF 3x3 L1';
img_1_VMF_5_RGB = abstractFilter(img_1_RGB, [3 3], @(subImg)filterVMF(subImg, 2), 1); titles{5} = 'VMF 3x3 L2';

titles{6} = 'org';
img_2_RGB = imnoise(img, 'salt & pepper', 0.10); titles{7} = 'Noise 10%';
img_2_median_RGB = abstractFilter(img_2_RGB, [3 3], @median); titles{8} = 'Median 3x3';
img_2_VMF_3_RGB = abstractFilter(img_2_RGB, [3 3], @(subImg)filterVMF(subImg, 1), 1); titles{9} = 'VMF 3x3 L1';
img_2_VMF_5_RGB = abstractFilter(img_2_RGB, [3 3], @(subImg)filterVMF(subImg, 2), 1); titles{10} = 'VMF 3x3 L2';

imgs_comp = {img(2:end-2, 2:end-2,:) img_1_RGB(2:end-2, 2:end-2,:) img_1_median_RGB(2:end-2, 2:end-2,:) img_1_VMF_3_RGB(2:end-2, 2:end-2,:) img_1_VMF_5_RGB(2:end-2, 2:end-2,:) img(2:end-2, 2:end-2,:) img_2_RGB(2:end-2, 2:end-2,:) img_2_median_RGB(2:end-2, 2:end-2,:) img_2_VMF_3_RGB(2:end-2, 2:end-2,:) img_2_VMF_5_RGB(2:end-2, 2:end-2,:)};
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);

