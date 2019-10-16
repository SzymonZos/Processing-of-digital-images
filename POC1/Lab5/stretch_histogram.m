function stretched_img = stretch_histogram(img, varargin)
    temp_img = double(img);
    if length(varargin) >= 1
        no_each_color = imhist(img);
        colors = find(no_each_color>varargin{1});
        min_color = colors(1)-1;
        max_color = colors(end)-1;
    else
        min_color = min(reshape(temp_img, 1, []));
        max_color = max(reshape(temp_img, 1, []));
    end
    stretched_img = uint8(255*(temp_img - min_color)./(max_color - min_color));
end