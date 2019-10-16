function imgs_quantised = quantise_all (imgs_cell, quantise, space)
    imgs_quantised = cell(1, length(imgs_cell));
    quantise_info = functions(quantise);
    for i=1:length(imgs_cell)
        imgs_quantised{i} = quantise(imgs_cell{i}, space);
        figure;
        subplot(1, 2, 1), imshow(imgs_cell{i}), title('original');
        subplot(1, 2, 2), imshow(imgs_quantised{i}), title(strcat(strrep(quantise_info.function, '_', ' '), {' '}, num2str(space)));
        if strfind(quantise_info.function, 'hsv')
            figure;
            subplot(1, 2, 1), imshow(hsv2rgb(imgs_cell{i})), title('original');
            subplot(1, 2, 2), imshow(hsv2rgb(imgs_quantised{i})), title(strcat(strrep(quantise_info.function, '_', ' '), {' '}, num2str(space)));
        end
    end
end