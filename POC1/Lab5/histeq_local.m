function img_stretched = histeq_local(img, no_subarrays)
    subarrays = find_subarrays(img, no_subarrays);
    img_stretched = cellfun(@histeq, subarrays, 'UniformOutput', 0);
    img_stretched = cell2mat(img_stretched);
end