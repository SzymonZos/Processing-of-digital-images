clear all;
close all;

%% Ex.1 
photo = imread('photo.bmp');
chart = imread('chart.bmp');
blank_p = imread('blank_p.bmp');
blank_c = imread('blank_c.bmp');

%% Ex.2
imwrite(photo, 'photo_jpg_good.jpg', 'jpg', 'quality', 80);
imwrite(chart, 'chart_jpg_good.jpg', 'jpg', 'quality', 80);

imwrite(photo, 'photo_jpg_bad.jpg', 'jpg', 'quality', 10);
imwrite(chart, 'chart_jpg_bad.jpg', 'jpg', 'quality', 10);

imwrite(photo, 'photo_j2k_good.j2k', 'j2k', 'CompressionRatio', 50);
imwrite(chart, 'chart_j2k_good.j2k', 'j2k', 'CompressionRatio', 50);

imwrite(photo, 'photo_j2k_bad.j2k', 'j2k', 'CompressionRatio', 500);
imwrite(chart, 'chart_j2k_bad.j2k', 'j2k', 'CompressionRatio', 500);

imwrite(photo, 'photo_png.png', 'png');
imwrite(chart, 'chart_png.png', 'png');

[imind_p, cm_p] = rgb2ind(photo, 256); 
imwrite(imind_p, cm_p, 'photo_gif.gif', 'gif');

[imind_c, cm_c] = rgb2ind(chart, 256); 
imwrite(imind_c, cm_c, 'chart_gif.gif', 'gif');

photo_jpg_good = imread('photo_jpg_good.jpg');
chart_jpg_good = imread('chart_jpg_good.jpg');

photo_jpg_bad = imread('photo_jpg_bad.jpg');
chart_jpg_bad = imread('chart_jpg_bad.jpg');

photo_j2k_good = imread('photo_j2k_good.j2k');
chart_j2k_good = imread('chart_j2k_good.j2k');

photo_j2k_bad = imread('photo_j2k_bad.j2k');
chart_j2k_bad = imread('chart_j2k_bad.j2k');

photo_png = imread('photo_png.png');
chart_png = imread('chart_png.png');

[photo_gif, cmap] = imread('photo_gif.gif');
photo_gif = ind2rgb(photo_gif, cmap);

[chart_gif, cmap] = imread('chart_gif.gif');
chart_gif = ind2rgb(chart_gif, cmap);

%% Porownanie - przyblizenia

photo_upper_row = cat(2, imcrop(photo,[100 100 300 300]),imcrop(photo_jpg_good,[100 100 300 300]), imcrop(photo_jpg_bad,[100 100 300 300]), imcrop(photo_j2k_good,[100 100 300 300]));
photo_lower_row = cat(2, imcrop(photo_j2k_bad,[100 100 300 300]), imcrop(photo_png,[100 100 300 300]), im2uint8(imcrop(photo_gif,[100 100 300 300])), imcrop(blank_p,[100 100 300 300]));

figure
imshow(cat(1, photo_upper_row, photo_lower_row))
text(910, 320, 'bmp, jpg good, jpg bad, j2k good', 'FontSize', 15);
text(910, 370, 'j2k bad, png, gif', 'FontSize', 15);
title('Porownanie obrazow - przyblizenie');

photo_upper_row = cat(2, imcrop(chart,[400 50 300 300]),imcrop(chart_jpg_good,[400 50 300 300]), imcrop(chart_jpg_bad,[400 50 300 300]), imcrop(chart_j2k_good,[400 50 300 300]));
photo_lower_row = cat(2, imcrop(chart_j2k_bad,[400 50 300 300]), imcrop(chart_png,[400 50 300 300]), im2uint8(imcrop(chart_gif,[400 50 300 300])), imcrop(blank_c,[400 50 300 300]));

figure
imshow(cat(1, photo_upper_row, photo_lower_row))
text(910, 320, 'bmp, jpg good, jpg bad, j2k good', 'FontSize', 15);
text(910, 370, 'j2k bad, png, gif', 'FontSize', 15);
title('Porownanie wykresow - przyblizenie');

%% Ex.4
psnr_sizes = 1 : 5;
psnr_plot = 1 : 5;

for i = 1 : 5
    img_path = strcat('./jpg/photo_', num2str(i), '.jpg');
    imwrite(photo, img_path, 'jpg', 'quality', 2 * i * i);
    photo_conv = imread(img_path);
    file = dir(img_path);
    psnr_sizes(i) = file.bytes;
    psnr_plot(i) = psnr(photo_conv, photo);
end

figure
plot(psnr_sizes, psnr_plot, '-bo');
hold on;
grid on;

for i = 1 : 5
    img_path = strcat('./j2k/photo_', num2str(i), '.j2k');
    imwrite(photo, img_path, 'j2k', 'CompressionRatio', 2 * i * i + 30);
    photo_conv = imread(img_path);
    file = dir(img_path);
    psnr_sizes(i) = file.bytes;
    psnr_plot(i) = psnr(photo_conv, photo);
end

plot(psnr_sizes, psnr_plot, '-ro');
legend ('jpg', 'j2k');