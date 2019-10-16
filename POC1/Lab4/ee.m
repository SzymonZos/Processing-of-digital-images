spaces_gray = [5;10];
imgs_gray_comp = cell(0);
imgs_gray_comp(:, 1) = imgs(:, 1);
imgs_gray_comp = cellfun(@rgb2gray, imgs_gray_comp, 'UniformOutput', 0);
imgs_gray_comp = append_results_static(imgs(:,1), spaces_gray, @quantise_rgb, imgs_gray_comp);
imgs_gray_comp(:, end+1) = imgs(:, 1);
imgs_gray_comp = append_results_static(imgs(:,1), spaces_gray, @floyd, imgs_gray_comp);

imgs_gray_comp = cellfun(@uint8, imgs_gray_comp, 'UniformOutput', 0);
PSNR_gray = get_psnr(imgs_gray_comp);
no_colors_gray_comp = cellfun(@(img) get_no_colors(img), imgs_gray_comp);

imshow_all(imgs_gray_comp, spaces_gray, PSNR_gray, no_colors_gray_comp);