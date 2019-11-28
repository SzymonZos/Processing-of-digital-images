function [Ktrans, Ctrans, Mtrans] = demoTransStat(img)
    Mtrans = ones(101, 1);
    Ctrans = ones(101, 1);
    Ktrans = ones(101, 1);
    for trans = 1:100
       imgr = imtranslate(img, [trans 1]);
       [Ktrans(trans + 1), Ctrans(trans + 1), Mtrans(trans + 1)] = imgStats(imgr);
    end
end