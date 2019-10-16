eps = 1/1000;
intervals_1000_hsv = generate_intervals(imgs{2,2}, [12 4 5], 0:eps:1+eps);
dynamic_lena_1000_hsv = quantise_dynamic(imgs{2,2}, intervals_1000_hsv);
figure
imshow(hsv2rgb(dynamic_lena_1000_hsv));

eps = 1/360;
intervals_360_hsv = generate_intervals(imgs{2,2}, [3 2 2], 0:eps:1+eps);
dynamic_lena_360_hsv = quantise_dynamic(imgs{2,2}, intervals_360_hsv);
figure
imshow(hsv2rgb(dynamic_lena_360_hsv));

eps = 1/256;
intervals_256_hsv = generate_intervals(imgs{2,2}, [3 2 2], 0:eps:1+eps);
dynamic_lena_256_hsv = quantise_dynamic(imgs{2,2}, intervals_256_hsv);
figure
imshow(hsv2rgb(dynamic_lena_256_hsv));
%%
ree = zeros(size(imgs_rgb_comp));
for i=1:size(imgs_rgb_comp,1)
ree(i, :) = cellfun(@(img) psnr(img, imgs_rgb_comp{i,1}), imgs_rgb_comp(i,:));
end
%% test, niestabilne
eps1 = 1/360;
eps2 = 1/256;
intervals_mix_hsv = generate_intervals_test(imgs{2,2}, [12 4 5], {0:eps1:1+eps1;0:eps2:1+eps2;0:eps2:1+eps2});
dynamic_lena_mix_hsv = quantise_dynamic(imgs{2,2}, intervals_mix_hsv);
figure
imshow(hsv2rgb(dynamic_lena_mix_hsv));


%%
intervals_256_rgb = generate_intervals(imgs{2,1}, [4 4 1], 0:256);
dynamic_lena_256_rgb = quantise_dynamic(imgs{2,1}, intervals_256_rgb);
figure
imshow(uint8(dynamic_lena_256_rgb));