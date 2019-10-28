function idx_closest = get_closest_values(i mg, colors)
    for channel=1:size(img, 3)
        errors(:,channel) = (img(1,1,channel) - colors(:,channel)).^2;
    end
    [~, idx_closest]=min(sqrt(sum(errors,2)));
end