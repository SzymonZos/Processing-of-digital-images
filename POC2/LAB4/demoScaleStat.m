function [Kscale, Cscale, Mscale] = demoScaleStat(img)
    Mscale = ones(9, 1);
    Cscale = ones(9, 1);
    Kscale = ones(9, 1);
    idx = 1;
    for trans = 0.1:0.1:0.9
       imgr = imresize(img, trans);
       [Kscale(idx), Cscale(idx), Mscale(idx)] = imgStats(imgr);
       idx = idx + 1;
    end
end