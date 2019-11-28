function [Krot, Crot, Mrot] = demoRotStat(img)
    Mrot = ones(361, 1);
    Crot = ones(361, 1);
    Krot = ones(361, 1);
    for ang = 0:360
       imgr = imrotate(img, ang, 'bilinear','crop');
       [Krot(ang + 1), Crot(ang + 1), Mrot(ang + 1)] = imgStats(imgr);
    end
end