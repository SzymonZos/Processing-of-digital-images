function imshow_subplot (imgs, PSNR, no_colors, k)
    %odd_even = ~mod(length(imgs),2)+1; %%1 odd, 2 even
    for i=1:length(imgs)
        if i <= length(imgs)/2
            subplot(3, length(imgs)/2, i); %1 rz¹d lub dwa w zaleznoœci czy parzyste/nieparzyste
            imshow(imgs{i});
            %title(['original', '  no colors: ', num2str(no_colors(1, i))]);
            title(['original']);
        else
            subplot(3, length(imgs)/2, i);
            imshow(imgs{i});
            idx = i-length(imgs)/2;
            title(['psnr: ', num2str(PSNR(1, idx, 1)), '  my psnr: ', num2str(PSNR(1, idx, 2)), '  no colors: ', num2str(no_colors(1, idx)), char(10), 'k: ', num2str(k(idx,:))]);
            subplot(3, length(imgs)/2, i+length(imgs)/2);
            imhist(imgs{i-length(imgs)/2});
            hold on;
            imhist(imgs{i});
            hold off;
        end
    end
end