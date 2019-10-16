function titlesPSNR = appendPSNR(imgs, titles)
    imgsPSNR = cellfun(@(img)psnr(img, imgs{1}), imgs, 'UniformOutput', 0);
    for i = 1 : max(size(titles))
        titles{i}(regexp(titles{i}, '\n'):end) = [];
    end
    titlesPSNR = cellfun(@(title, imgPSNR)sprintf('%s\nPSNR = %f', title, imgPSNR), titles, imgsPSNR, 'UniformOutput', 0);
end