%% 2 next

imgs_2{1} = imgs{12};
masks{1} = [...
     1 1  1;
    1  1 1;
     1 1  1];
denominators = get_denominator(masks);
for i = 2 : 4
    imgs_2{i} = conv2(im2double(imgs_2{i-1})/denominators{1}, masks{1}, 'same');
end
spectralDensityImgs = cellfun(@spectralDensity, imgs_2, 'UniformOutput', 0);
%phaseDensityImgs = cellfun(@phaseDensity, imgs_2, 'UniformOutput', 0);

titles = cell(1,8);
show_results([imgs_2, spectralDensityImgs], titles);

%% 2 next up

imgs_2{1} = imgs{12};
masks{1} = [...
    0  -1  0;
    -1  5  -1;
    0  -1  0];
denominators = get_denominator(masks);
for i = 2 : 4
    imgs_2{i} = conv2(im2double(imgs_2{i-1})/denominators{1}, masks{1}, 'same');
end
spectralDensityImgs = cellfun(@spectralDensity, imgs_2, 'UniformOutput', 0);
phaseDensityImgs = cellfun(@phaseDensity, imgs_2, 'UniformOutput', 0);

titles = cell(1,8);
show_results([imgs_2, spectralDensityImgs], titles);