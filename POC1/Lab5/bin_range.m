function img_mod = bin_range(img)
    bin_count = histcounts(img, 0:256);
    temp = cumsum(bin_count);
    temp = 255*(temp./max(temp));
    img_mod = uint8(temp(img+1));
end