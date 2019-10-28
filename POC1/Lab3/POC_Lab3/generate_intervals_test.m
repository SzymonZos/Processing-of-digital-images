function img_quant = generate_intervals_test(img, spaces, bins)
    for i=1:size(img, 3)
        sum_colors = histcounts(img(:,:,i), bins{i});
        sum_interval = 0;
        img_quant{1, i}(1) = bins{i}(1);
        k = 2;
        no_pixels = numel(img(:,:,i));
        index = 1;
        for j=1:length(sum_colors)
            sum_interval = sum_interval + sum_colors(j);
            if sum_interval > no_pixels/spaces(i) || j == length(sum_colors)
                img_quant{1, i}(k) = bins{i}(j);
                interval = img_quant{1, i}(k-1):bins{i}(2)-bins{i}(1):bins{i}(j);
                img_quant{2, i}(k-1) = sum_colors(index:j)*interval'/sum(sum_colors(index:j));
                index = j;
                k = k + 1;
                sum_interval = 0;
            end
        end      
    end
end