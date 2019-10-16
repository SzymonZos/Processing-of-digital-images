function nearest_neighbor_img = nearest_neighbor(img, flag)

[dim_X, dim_Y] = size(img);
nearest_neighbor_img = img;

for i = 1:2:(dim_X-1)
    for j = 1:2:(dim_Y-1)
        switch flag
            case 'r'
                nearest_neighbor_img(i:i+1, j:j+1) = img(i, j);
            case 'g'
                nearest_neighbor_img(i, j) = img(i+1, j);
                nearest_neighbor_img(i+1, j+1) = img(i, j+1);
            case 'b'
                nearest_neighbor_img(i:i+1, j:j+1) = img(i+1, j+1);
            otherwise
                error ('Invalid type of flag. Try r, g or b.');
        end
    end
    nearest_neighbor_img(end, :) = nearest_neighbor_img(end - 1, :);
    nearest_neighbor_img(:, end) = nearest_neighbor_img(:, end - 1);
end
end