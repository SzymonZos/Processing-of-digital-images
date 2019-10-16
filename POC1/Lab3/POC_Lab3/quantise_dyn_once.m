function img_quant = quantise_dyn_once(img, intervals)
    for index=1:size(img, 3)
        suspected_intervals = find(img<=intervals{1,index});
        right_interval = max(suspected_intervals(1)-1, 1);
        img_quant = uint8(intervals{2,index}(right_interval));
    end
end