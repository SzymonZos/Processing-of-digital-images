function PSNR = my_psnr(to_compare, ref)
    RMSE = sqrt(mean(reshape((double(to_compare) - double(ref)).^2, 1, numel(ref))));
    PSNR = 20*log10(255/RMSE);
end