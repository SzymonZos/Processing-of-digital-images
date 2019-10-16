img = imread('lenna_512x512.bmp');

masks = cell(1,5);
masks{1} = ones(5);
masks{2} = fspecial('Gaussian', 9, 2);
masks{3} = [...
     0 -1  0;
    -1  4 -1;
     0 -1  0];
masks{4} = [...
    -1  0  1;
    -2  0  2;
    -1  0  1];
masks{5} = masks{4}';


denominators = get_denominator(masks);
results_matlab_masks = cellfun(@(m, d) conv2(im2double(img)/d, m, 'same'), masks, denominators, 'UniformOutput', 0);
results_matlab_masks = [img, results_matlab_masks];

results_my_masks = cellfun(@(m) apply_filter_mask(img, m), masks, 'UniformOutput', 0);
results_my_masks = [img, results_my_masks];

titles = {'Original'; 'Mean'; '\sigma = 2, 9x9'; 'Laplacian'; 'Vertical'; 'Horizontal'};
show_results(results_matlab_masks, titles);
show_results(results_my_masks, titles);
%%
amounts = {0.7, 4, 9};
titles = {'Original'; 'Smoothed'; 'Edges'; '\lambda = 0.7'; '\lambda = 4'; '\lambda = 9'};

smoothed = apply_filter_mask(img, fspecial('gaussian', 9, 2));
edges = double(img) - double(apply_filter_mask(img, fspecial('gaussian', 9, 2)));
results_unsharpen = cellfun(@(a) unsharpen(img, a), amounts, 'UniformOutput', 0);
results_unsharpen = [img, smoothed, uint8(edges), results_unsharpen];
show_results(results_unsharpen, titles);