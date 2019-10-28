function new_img = floyd_colormap(img, space, varargin)
tic;
new_img = double(img);
[~, colors] = rgb2ind(img, space);
colors = 255*colors;
%intervals = generate_intervals(img, space, 0:256);

for i=1:size(img,1)
    for j=1:size(img,2)
        idx_closest = get_closest_values(new_img(i,j,:), colors);
        for channel=1:size(img, 3)
            oldpixel = max(min(new_img(i,j,channel), 255), 0);
            if size(img, 3) == 1
                new_img(i,j,channel) = quantise_2_bits_once(oldpixel, space(channel));
            else
                new_img(i,j,channel) = colors(idx_closest, channel);
                %new_img(i,j,channel) = quantise_dynamic_once(max(min(oldpixel, 255), 0), intervals(:,channel));
            end
            quant_error = oldpixel - new_img(i,j,channel);
            if i ~= size(img,1)
                new_img(i+1,j,channel) = new_img(i+1,j,channel) + 5/16 * quant_error;
                if j ~= 1
                    new_img(i+1,j-1,channel) = new_img(i+1,j-1,channel) + 3/16 * quant_error;
                end
                if j ~= size(img, 2)
                    new_img(i+1,j+1,channel) = new_img(i+1,j+1,channel) + 1/16 * quant_error;
                end
           end
            if j ~= size(img, 2)
                new_img(i,j+1,channel) = new_img(i,j+1,channel) + 7/16 * quant_error;
            end
            
        end
    end
    %disp(num2str(channel));
end
toc;
end