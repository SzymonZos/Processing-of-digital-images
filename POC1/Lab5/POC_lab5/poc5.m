%% 1 - init
imgs_org{1} = imread('Ex1.png');
imgs_org{2} = imread('Ex2.png');
imgs_org{3} = imread('Ex3.png');
imgs_org{4} = imread('M92.png');

%% 2 - Histogram

%imgs_hist = cellfun(@imhist, imgs_org, 'UniformOutput', 0);
imgs_hist = cell(0);
for i=1:length(imgs_org)
    [imgs_hist{i, 1}, imgs_hist{i, 2}] = imhist(imgs_org{i});
    figure;
    imhist(imgs_org{i});
end

%% 3 - korekcja gamma
y = @(img, c) uint8(255*(double(img)/255).^c);
imgs_comp_f{1} = imgs_org{4};
imgs_comp_f{2} = y(imgs_org{4}, 0.5);
imgs_comp_f{3} = y(imgs_org{4}, 2);

PSNR_comp_f = get_psnr(imgs_comp_f, imgs_org);
no_colors_comp_f = cellfun(@(img) get_no_colors(img), imgs_comp_f);
k_f = cellfun(@find_k, imgs_comp_f, 'UniformOutput', 0);
k_f = cell2mat(k_f');

imshow_all(imgs_comp_f, PSNR_comp_f, no_colors_comp_f, k_f);

%% 4 - rozciaganie histogramu
imgs_comp_h = cellfun(@stretch_histogram, imgs_org, 'UniformOutput', 0);

PSNR_comp_h = get_psnr(imgs_comp_h, imgs_org);
no_colors_comp_h = cellfun(@(img) get_no_colors(img), imgs_comp_h);
k_h = cellfun(@find_k, imgs_comp_h, 'UniformOutput', 0);
k_h = cell2mat(k_h');

imshow_all([imgs_org, imgs_comp_h], PSNR_comp_h, no_colors_comp_h, k_h);

%% 4 - rozciaganie histogramu - offset
imgs_comp_h_10 = cellfun(@(img) stretch_histogram(img, 10), imgs_org, 'UniformOutput', 0);

PSNR_comp_h_10 = get_psnr(imgs_comp_h_10, imgs_org);
no_colors_comp_h_10 = cellfun(@(img) get_no_colors(img), imgs_comp_h_10);
k_h_10 = cellfun(@find_k, imgs_comp_h_10, 'UniformOutput', 0);
k_h_10 = cell2mat(k_h_10');

imshow_all([imgs_org, imgs_comp_h_10], PSNR_comp_h_10, no_colors_comp_h_10, k_h_10);

%% 4 - histeq
imgs_comp_heq = cellfun(@histeq, imgs_org, 'UniformOutput', 0);

PSNR_comp_heq = get_psnr(imgs_comp_heq, imgs_org);
no_colors_comp_heq = cellfun(@(img) get_no_colors(img), imgs_comp_heq);
k_heq = cellfun(@find_k, imgs_comp_heq, 'UniformOutput', 0);
k_heq = cell2mat(k_heq');

imshow_all([imgs_org, imgs_comp_heq], PSNR_comp_heq, no_colors_comp_heq, k_heq);

%% 5 - rozciaganie histogramu, local
imgs_comp_h_local = cellfun(@(img) stretch_histogram_local(img, 10), imgs_org, 'UniformOutput', 0);

PSNR_comp_h_local = get_psnr(imgs_comp_h_local, imgs_org);
no_colors_comp_h_local = cellfun(@(img) get_no_colors(img), imgs_comp_h_local);
k_h_local = cellfun(@find_k, imgs_comp_h_local, 'UniformOutput', 0);
k_h_local = cell2mat(k_h_local');

imshow_all([imgs_org, imgs_comp_h_local], PSNR_comp_h_local, no_colors_comp_h_local, k_h_local);

%% 5 - rozciaganie histogramu - offset, local
imgs_comp_h_10_local = cellfun(@(img) stretch_histogram_local(img, 10, 10), imgs_org, 'UniformOutput', 0);

PSNR_comp_h_10_local = get_psnr(imgs_comp_h_10_local, imgs_org);
no_colors_comp_h_10_local = cellfun(@(img) get_no_colors(img), imgs_comp_h_10_local);
k_h_10_local = cellfun(@find_k, imgs_comp_h_10_local, 'UniformOutput', 0);
k_h_10_local = cell2mat(k_h_10_local');

imshow_all([imgs_org, imgs_comp_h_10_local], PSNR_comp_h_10_local, no_colors_comp_h_10_local, k_h_10_local);

%% 5 - histeq, local
imgs_comp_heq_local = cellfun(@(img) histeq(img, 10), imgs_org, 'UniformOutput', 0);

PSNR_comp_heq_local = get_psnr(imgs_comp_heq_local, imgs_org);
no_colors_comp_heq_local = cellfun(@(img) get_no_colors(img), imgs_comp_heq_local);
k_heq_local = cellfun(@find_k, imgs_comp_h, 'UniformOutput', 0);
k_heq_local = cell2mat(k_heq_local');

imshow_all([imgs_org, imgs_comp_heq_local], PSNR_comp_heq_local, no_colors_comp_heq_local, k_heq_local);

%% 6 - bin range
imgs_comp_bins = cellfun(@bin_range, imgs_org, 'UniformOutput', 0);

PSNR_comp_bins = get_psnr(imgs_comp_bins, imgs_org);
no_colors_comp_bins = cellfun(@(img) get_no_colors(img), imgs_comp_bins);
k_bins = cellfun(@find_k, imgs_comp_bins, 'UniformOutput', 0);
k_bins = cell2mat(k_bins');

imshow_all([imgs_org, imgs_comp_bins], PSNR_comp_bins, no_colors_comp_bins, k_bins);
