function intervals = generate_intervals(img, spaces, bins)
    for i=1:size(img, 3)
        sum_colors = histcounts(img(:,:,i), bins);
        sum_interval = 0;
        intervals{1, i}(1) = bins(1);
        k = 2;
        no_pixels = numel(img(:,:,i));
        index = 1;
        for j=1:length(sum_colors)
            sum_interval = sum_interval + sum_colors(j);
            if sum_interval > no_pixels/spaces(i) || j == length(sum_colors)
                intervals{1, i}(k) = bins(j);
                interval = intervals{1, i}(k-1):bins(2)-bins(1):bins(j);
                intervals{2, i}(k-1) = sum_colors(index:j)*interval'/sum(sum_colors(index:j));
                intervals{3, i}(k-1) = std(sum_colors(index:j));
                %[~,idx]=max(sum_colors(index:j));
                %intervals{2, i}(k-1) = interval(idx);
                index = j;
                k = k + 1;
                sum_interval = 0;
            end
        end      
    end
end