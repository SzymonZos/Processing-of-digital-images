function k = find_k(img)
    temp_img = double(img);
    min_color = min(reshape(temp_img, 1, []));
    max_color = max(reshape(temp_img, 1, []));
    mean_color = mean(reshape(temp_img, 1, []));
    k(1) = (max_color - min_color)/255;
    k(2) = (max_color - min_color)/mean_color;
    k(3) = (max_color - min_color)/(max_color + min_color);
    k(4) = 4/255^2*mean(reshape((temp_img - mean_color).^2, 1, []));
end