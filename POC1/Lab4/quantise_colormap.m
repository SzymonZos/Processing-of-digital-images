function img_quant = quantise_colormap(img, space, varargin)
    tic;
    img_quant = zeros(size(img));
    [~, colors] = rgb2ind(img, space);
    colors = 255*colors;
    for i=1:size(img,1)
        for j=1:size(img,2)
            idx_closest = get_closest_values(double(img(i,j,:)), colors);
            for k=1:size(img,3)
                img_quant(i,j,k) = colors(idx_closest, k);
            end
        end
    end
    toc;
end