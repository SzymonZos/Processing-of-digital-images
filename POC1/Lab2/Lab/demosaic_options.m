function [gbrg_img, grbg_img, bggr_img, rggb_img] = demosaic_options(img)
gbrg_img = demosaic(img,'gbrg');
grbg_img = demosaic(img,'grbg');
bggr_img = demosaic(img,'bggr');
rggb_img = demosaic(img,'rggb');
end