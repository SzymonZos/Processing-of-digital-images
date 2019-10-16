function [no_colors, imgs] = get_no_colors_all(imgs_org)
no_colors = struct('rgb', {}, 'hsv', {}, 'yCbCr', {});
imgs = cell(length(imgs_org), 3);
    for i=1:length(imgs_org)
        fprintf('\nimg %d\n', i);
        img_rgb = imgs_org{i};
        imgs{i, 1}= img_rgb;
        no_colors(i).rgb = get_no_colors(img_rgb);
    
        img_hsv = rgb2hsv(imgs_org{i});
        imgs{i, 2} = img_hsv;
        no_colors(i).hsv = get_no_colors(img_hsv);

        img_yCbCr = rgb2ycbcr(imgs_org{i});
        imgs{i, 3} = img_yCbCr;
        no_colors(i).yCbCr = get_no_colors(img_yCbCr);
    end
end