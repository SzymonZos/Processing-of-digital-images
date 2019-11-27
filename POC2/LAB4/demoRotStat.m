function demoRotStat(img)
    % Wsp�czynnik malinowskiej przy obrocie od 0 do 360 stopni
    Mrot = ones(361, 1);
    for ang = 0:360
       imgr = imrotate(img, ang);
       [~, ~, Mrot(ang + 1)] = imgStats(imgr);
    end
    figure;
    plot(0:360, Mrot);
    title('Zale�no�� wsp�czynnika malinowskiej od k�ta rotacji obrazu')
end