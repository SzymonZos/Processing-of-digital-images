%% 0
imgs_org{1} = imread('baboon_512x512.bmp');
imgs_org{2} = imread('lena_512x512.bmp');
imgs_org{3} = imread('peppers3_512x512.bmp');

[no_colors, imgs]= get_no_colors_all(imgs_org);

%% 1
imgs_2_bits_comp = cell(0);
imgs_2_bits_comp(:, 1) = imgs(:, 1);
imgs_2_bits_comp = cellfun(@rgb2gray, imgs_2_bits_comp, 'UniformOutput', 0);
imgs_2_bits_comp = append_results_static(imgs_2_bits_comp(:, 1), 2, @quantise_2_bits, imgs_2_bits_comp);
imgs_2_bits_comp = append_results_static(imgs_2_bits_comp(:, 1), 2, @floyd, imgs_2_bits_comp);

imgs_2_bits_comp = cellfun(@uint8, imgs_2_bits_comp, 'UniformOutput', 0);
PSNR_2_bits = get_psnr(imgs_2_bits_comp);
no_colors_2_bits_comp = cellfun(@(img) get_no_colors(img), imgs_2_bits_comp);

imshow_all(imgs_2_bits_comp, 2*ones(2,1), PSNR_2_bits, no_colors_2_bits_comp);

%% 2
tic;
spaces_rgb = [2 4 2;
              2 4 4;
              4 8 4];
imgs_rgb_comp = cell(0);
imgs_rgb_comp(:, 1) = imgs(:, 1);
imgs_rgb_comp = append_results_static(imgs(:,1), spaces_rgb, @quantise_rgb, imgs_rgb_comp);
imgs_rgb_comp(:, end+1) = imgs(:, 1);
imgs_rgb_comp = append_results_static(imgs(:,1), spaces_rgb, @floyd, imgs_rgb_comp);

imgs_rgb_comp = cellfun(@uint8, imgs_rgb_comp, 'UniformOutput', 0);
PSNR_rgb = get_psnr(imgs_rgb_comp);
no_colors_rgb_comp = cellfun(@(img) get_no_colors(img), imgs_rgb_comp);

imshow_all(imgs_rgb_comp, spaces_rgb, PSNR_rgb, no_colors_rgb_comp);
toc;

%% 3

spaces_colormap = [16;
              256;];
imgs_rgb_comp = cell(0);
imgs_rgb_comp(:, 1) = imgs(:, 1);
imgs_rgb_comp = append_results_static(imgs(:,1), spaces_colormap, @quantise_colormap, imgs_rgb_comp);
imgs_rgb_comp(:, end+1) = imgs(:, 1);
imgs_rgb_comp = append_results_static(imgs(:,1), spaces_colormap, @floyd_colormap, imgs_rgb_comp);

imgs_rgb_comp = cellfun(@uint8, imgs_rgb_comp, 'UniformOutput', 0);
PSNR_rgb = get_psnr(imgs_rgb_comp);
no_colors_rgb_comp = cellfun(@(img) get_no_colors(img), imgs_rgb_comp);

imshow_all(imgs_rgb_comp, spaces_colormap, PSNR_rgb, no_colors_rgb_comp);

%% 1 permutacja
imgs_2_comp = [imgs_2_bits_comp(2,:),imgs_2_bits_comp(3,:)];
PSNR_2 = [PSNR_2_bits(2,:,:),PSNR_2_bits(3,:,:)];
no_colors_2_comp = [no_colors_2_bits_comp(2,:),no_colors_2_bits_comp(3,:)];

imshow_all(imgs_2_comp, 2*ones(2,1), PSNR_2, no_colors_2_comp);

%% 3 permutacja
imgs_test_comp = permute_container(imgs_rgb_comp);
PSNR_test = permute_container(PSNR_rgb);
no_colors_test_comp = permute_container(no_colors_rgb_comp);

imshow_all(imgs_test_comp, spaces_colormap, PSNR_test, no_colors_test_comp);

%% odcienie szarosci
spaces_gray = [5;10];
imgs_gray_comp = cell(0);
imgs_gray_comp(:, 1) = imgs(:, 1);
imgs_gray_comp = cellfun(@rgb2gray, imgs_gray_comp, 'UniformOutput', 0);
imgs_gray_comp = append_results_static(imgs_gray_comp(:,1), spaces_gray, @quantise_rgb, imgs_gray_comp);
imgs_gray_comp(:, end+1) = cellfun(@rgb2gray, imgs(:,1), 'UniformOutput', 0);
imgs_gray_comp = append_results_static(imgs_gray_comp(:,1), spaces_gray, @floyd, imgs_gray_comp);

imgs_gray_comp = cellfun(@uint8, imgs_gray_comp, 'UniformOutput', 0);
PSNR_gray = get_psnr(imgs_gray_comp);
no_colors_gray_comp = cellfun(@(img) get_no_colors(img), imgs_gray_comp);

imshow_all(imgs_gray_comp, spaces_gray, PSNR_gray, no_colors_gray_comp);