function denominator = get_denominator(masks)
    for i=1:length(masks)
        if sum(masks{i}(:))
            denominator{i} = sum(masks{i}(:));
        else
            denominator{i} = 1;
        end
    end
end    