function filtered_img = apply_filter_mask(img, mask)
    img = double(img);
    filtered_img = img;

    [img_x, img_y] = size(img); 
    [mask_x, mask_y] = size(mask);

    margin_x = floor(mask_x/2);
    margin_y = floor(mask_y/2);
    
    if sum(mask(:))
        denominator = sum(mask(:));
    else
        denominator = 1;
    end
    
    for i = 1 + margin_x : img_x - margin_x
        for j = 1 + margin_y : img_y - margin_y
            img_sub_matrix = img(i-margin_x : i+margin_x, j-margin_x : j+margin_x);
            %filtered_img(i, j) = conv2(img_sub_matrix, mask, 'valid')/denominator;
            img_sub_matrix=double(mask .* img_sub_matrix);
            filtered_img(i,j) = sum(img_sub_matrix(:))/denominator;
        end
    end
    %filtered_img = uint8(filtered_img);
end
