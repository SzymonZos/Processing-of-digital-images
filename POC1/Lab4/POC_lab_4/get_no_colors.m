function no_colors = get_no_colors(img)
    tic
    [no_rows, no_cols, channels] = size(img);
    no_colors = length(unique(reshape(img, [no_rows*no_cols, channels]), 'rows'));
    display(strcat(strrep(inputname(1), '_', ' '), {': '}, num2str(no_colors)));
    toc
end