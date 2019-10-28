function PSNR = get_psnr(imgs, imgs_org)
    PSNR = zeros(size(imgs, 1), size(imgs, 2), 2);
    for i=1:size(imgs,1)
        PSNR(i, :, 1) = cellfun(@(img, img_org) psnr(img, img_org), imgs(i,:), imgs_org(i,:));
        PSNR(i, :, 2) = cellfun(@(img, img_org) my_psnr(img, img_org), imgs(i,:), imgs_org(i,:));
    end
end