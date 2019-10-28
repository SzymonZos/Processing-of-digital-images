function img_quant = quantise_dynamic_2(img, spaces)
tic;
    img_quant = zeros(size(img));
    for i=1:size(img, 3)
        [img_sorted, index]=sort(reshape(double(img(:,:,i)), numel(img(:,:,i)), 1));
        img_grouped = vec2mat(img_sorted, ceil(numel(img_sorted)/spaces(i)), nan);
        %index_grouped = vec2mat(index, ceil(numel(index)/spaces(i)));
        img_grouped = img_grouped';
        %index_grouped = index_grouped';
        quant_values = mean(img_grouped, 'omitnan');
        %{
        for j=abs1:spaces(i)
            img_quant((i-1)*numel(img_sorted)+nonzeros(index_grouped(:,j)))=quant_values(j);
        end
        %}
        img_quant(:,:, i)=find_approx(img(:,:,i), quant_values);
    end
    toc;
end