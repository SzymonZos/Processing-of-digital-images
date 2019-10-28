function stretched_img = stretch_histogram_value(img, value)
    temp_img = double(img);
    if length(value) >= 1
        min_color = value(1);
        max_color = value(2);
    else
        min_color = min(reshape(temp_img, 1, []));
        max_color = max(reshape(temp_img, 1, []));
    end
    stretched_img = uint8(255*(temp_img - min_color)./(max_color - min_color));
end