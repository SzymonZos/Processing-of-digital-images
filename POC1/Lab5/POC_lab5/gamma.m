%% 2 - korekcja gamma
y = @(img, c) uint8(255*(double(img)/255).^c);
imgs_comp_f{1} = imgs_org{4};
imgs_comp_f{2} = y(imgs_org{4}, 0.5);
imgs_comp_f{3} = y(imgs_org{4}, 2);

imgs_comp_f = cellfun(@(img) stretch_histogram_value(img, [39, 64]), imgs_comp_f, 'UniformOutput', 0);

figure;
subplot(2, 3, 1); imshow(imgs_comp_f{1});
subplot(2, 3, 2); imshow(imgs_comp_f{2});
subplot(2, 3, 3); imshow(imgs_comp_f{3});
subplot(2, 3, 4); 
            imhist(imgs_org{4});
            hold on;
            imhist(imgs_comp_f{1});
            hold off;
subplot(2, 3, 5);
            imhist(imgs_org{4});
            hold on;
            imhist(imgs_comp_f{2});
            hold off;
subplot(2, 3, 6);
            imhist(imgs_org{4});
            hold on;
            imhist(imgs_comp_f{3});
            hold off;
