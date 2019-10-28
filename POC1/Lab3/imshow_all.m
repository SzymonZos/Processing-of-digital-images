function imshow_all (imgs, spaces, PSNR)
    for i=1:size(imgs, 1)
        %figure('units','normalized','outerposition',[0 0 1 1]);
        figure;
        %set(gcf, 'Position', get(0, 'Screensize'));
        
        pause(0.01);
        frame_h = get(handle(gcf),'JavaFrame');
        set(frame_h,'Maximized',1);
        
        suptitle(strrep(inputname(1), '_', ' '));
        imshow_subplot(imgs(i,:), spaces, PSNR(i, :, :));
    end
end