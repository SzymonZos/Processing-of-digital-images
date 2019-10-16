function imgs_appended = append_results_static(img_org, spaces, quantise, varargin)
    if length(varargin) >= 1
        offset = size(varargin{1}, 2);
        imgs_appended(:, 1:offset) = varargin{1};
    else
        offset = 0;
    end
    if length(varargin) == 2, bins = varargin{2}; else bins = 0; end
    for i = 1:size(spaces, 1)
    imgs_appended(:, i + offset) = cellfun(@(img) quantise(img, spaces(i,:), bins), img_org, 'UniformOutput', 0);
    end
end