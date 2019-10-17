%% Init
img = imread('lena_cropped.bmp');

%% Median filter - gray
img_gray = rgb2gray(img); titles{1} = 'org'; titles{5} = 'org';
imgs{1} = imnoise(img_gray, 'salt & pepper', 0.02); titles{2} = 'Noise 2%'; titles{6} = 'Noise 2% - median';
imgs{2} = imnoise(img_gray, 'salt & pepper', 0.05); titles{3} = 'Noise 5%'; titles{7} = 'Noise 5% - median';
imgs{3} = imnoise(img_gray, 'salt & pepper', 0.20); titles{4} = 'Noise 20%'; titles{8} = 'Noise 20% - median';

imgs_filtered_median = cellfun(@(img)abstractFilter(img, [3 3], @median), imgs, 'UniformOutput', 0);
imgs_comp = [img_gray imgs img_gray imgs_filtered_median];
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);
%% LUM filter - gray
titles = cellfun(@(str)strrep(str, 'median', 'LUM'), titles, 'UniformOutput', 0);
imgs_filtered_LUM = cellfun(@(img)abstractFilter(img, [3 3], @(subImg)filterLUM(subImg, 2)), imgs, 'UniformOutput', 0);
imgs_comp = [img_gray imgs img_gray imgs_filtered_LUM];
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);
%% Median && LUM comparison - gray
imgs_comp = [img_gray imgs_filtered_median img_gray imgs_filtered_LUM];
titles = appendPSNR(imgs_comp, titles);
titles(2:4) = cellfun(@(str)strcat(str, ' - median'), titles(2:4), 'UniformOutput', 0);
show_results(imgs_comp, titles);


%% Median filter - RGB
imgs{1} = imnoise(img, 'salt & pepper', 0.02); titles{2} = 'Noise 2%'; titles{6} = 'Noise 2% - median';
imgs{2} = imnoise(img, 'salt & pepper', 0.05); titles{3} = 'Noise 5%'; titles{7} = 'Noise 5% - median';
imgs{3} = imnoise(img, 'salt & pepper', 0.20); titles{4} = 'Noise 20%'; titles{8} = 'Noise 20% - median';

imgs_filtered_median = cellfun(@(img)abstractFilter(img, [3 3], @median), imgs, 'UniformOutput', 0);
imgs_comp = [img imgs img imgs_filtered_median];
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);
%% LUM filter - RGB
titles = cellfun(@(str)strrep(str, 'median', 'LUM'), titles, 'UniformOutput', 0);
imgs_filtered_LUM = cellfun(@(img)abstractFilter(img, [3 3], @(subImg)filterLUM(subImg, 2)), imgs, 'UniformOutput', 0);
imgs_comp = [img imgs img imgs_filtered_LUM];
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);
%% Median && LUM comparison - RGB
imgs_comp = [img imgs_filtered_median img imgs_filtered_LUM];
titles = appendPSNR(imgs_comp, titles);
titles(2:4) = cellfun(@(str)strcat(str, ' - median'), titles(2:4), 'UniformOutput', 0);
show_results(imgs_comp, titles);


%% VMF filter - VMF
titles{2} = 'Noise 2%'; titles{6} = 'Noise 2% - VMF';
titles{3} = 'Noise 5%'; titles{7} = 'Noise 5% - VMF';
titles{4} = 'Noise 20%'; titles{8} = 'Noise 20% - VMF';

imgs_filtered_VMF = cellfun(@(img)uint8(abstractFilter(img, [3 3], @(subImg)filterVMF(subImg, 2), 1)), imgs, 'UniformOutput', 0);
imgs_comp = [img imgs img imgs_filtered_VMF];
titles = appendPSNR(imgs_comp, titles);
show_results(imgs_comp, titles);