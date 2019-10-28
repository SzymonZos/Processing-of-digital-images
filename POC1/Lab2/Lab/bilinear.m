function bilinear_img = bilinear(img, flag)
[dimX, dimY] = size(img);
bilinear_img = img;

for i = 2:1:(dimX-1)
    for j = 2:1:(dimY-1)
        neighborhood = img(i-1:i+1, j-1:j+1);
        switch flag
            case 'r'
                if ~neighborhood(2,2) && ~(mod(i, 2) && mod(j, 2))
                    bilinear_img(i,j) = round(mean(nonzeros(neighborhood)));
                end
            case 'g'
                if ~neighborhood(2,2) && (mod(i, 2) && mod(j, 2) || ~mod(i, 2) && ~mod(j, 2))
                    bilinear_img(i,j) = round(mean(nonzeros(neighborhood)));
                end
            case 'b'
                if ~neighborhood(2,2) && ~(~mod(i, 2) && ~mod(j, 2))
                    bilinear_img(i,j) = round(mean(nonzeros(neighborhood)));
                end
            otherwise
                error ('Invalid type of flag. Try r, g or b.');
        end
    end
    
    bilinear_img(1, :) = bilinear_img(2, :);
    bilinear_img(:, 1) = bilinear_img(:,  2);
    bilinear_img(end, :) = bilinear_img(end - 1, :);
    bilinear_img(:, end) = bilinear_img(:, end - 1);
end
end