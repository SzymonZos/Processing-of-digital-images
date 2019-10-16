function imshow_subplot (imgs, spaces, PSNR, no_colors)
    odd_even = ~mod(length(imgs),2)+1; %%1 odd, 2 even
    for i=1:length(imgs)
        if i==1 || (odd_even == 2 && i==length(imgs)/2 + 1)
            subplot(odd_even, length(imgs)/odd_even, i); %1 rz¹d lub dwa w zaleznoœci czy parzyste/nieparzyste
            imshow(imgs{i});
            title(['original', '  no colors: ', num2str(no_colors(1, i))]);
        else
            subplot(odd_even, length(imgs)/odd_even, i);
            imshow(imgs{i});
            index = mod(i-1, length(imgs)/odd_even);
            if index < 1
                index = i-1;
            end
            title(['quantised: ', num2str(spaces(index, :)), char(10), 'psnr: ', num2str(PSNR(1, i, 1)), '  my psnr: ', num2str(PSNR(1, i, 2)), '  no colors: ', num2str(no_colors(1, i))]);
        end
    end
end