function img_stretched = stretch_histogram_local(img, no_subarrays, varargin)
    subarrays = find_subarrays(img, no_subarrays);
    if isempty(varargin), offset = 0; else offset = varargin{1}; end
    img_stretched = cellfun(@(img) stretch_histogram(img, offset), subarrays, 'UniformOutput', 0);
    img_stretched = cell2mat(img_stretched);
end