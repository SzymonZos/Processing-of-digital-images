function img_quant = quantise_dynamic_all (img, spaces, bins)
    intervals = generate_intervals(img, spaces, bins);
    %intervals = generate_intervals_test(img, spaces, bins);
    img_quant = quantise_dynamic (img, intervals);
end