function img = unsharpen(img, amount)
    mask = fspecial('gaussian', 9, 2);
    img = double(img) + amount * (double(img) - double(apply_filter_mask(img, mask)));
    img = uint8(img);
end
