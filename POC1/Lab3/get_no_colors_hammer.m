function no_colors = get_no_colors_hammer(img, flag)
    tic
    [no_rows, no_cols, ~] = size(img);
    
    if strcmp(flag,'HSV')
    img=img*255;
    img=double(img);
    else
    img=double(img);
    end

    color = 256*256*double(reshape(img(:,:,1), 1, numel(img(:,:,1)))) + 256*double(reshape(img(:,:,2), 1, numel(img(:,:,2)))) + double(reshape(img(:,:,3), 1, numel(img(:,:,3))));
    
    color_sort=sort(color);
    no_colors=1;
    for i=2:size(color_sort,2)
        if color_sort(i) ~= color_sort(i-1)
            no_colors=no_colors+1;
        end
    end

    display(strcat(strrep(inputname(1), '_', ' '), {': '}, num2str(no_colors)));
    toc
end