function subarrays = find_subarrays(img, no_subarrays)
    if length(no_subarrays) == 1
        no_subarrays(2) = no_subarrays(1);
    end 
    single_value = floor(size(img)./no_subarrays);
    vec1 = [single_value(1)*ones(1,no_subarrays(1)-1), size(img, 1)-(no_subarrays(1)-1)*single_value(1)];
    vec2 = [single_value(2)*ones(1,no_subarrays(2)-1), size(img, 2)-(no_subarrays(2)-1)*single_value(2)];
    subarrays = mat2cell(img, vec1, vec2);   
end