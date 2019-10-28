function PSNR = get_psnr(imgs)
    PSNR = zeros(size(imgs, 1), size(imgs, 2), 2);
    for i=1:size(imgs,1)
        PSNR(i, :, 1) = cellfun(@(img) psnr(img, imgs{i,1}), imgs(i,:));
        PSNR(i, :, 2) = cellfun(@(img) my_psnr(img, imgs{i,1}), imgs(i,:));
    end
end