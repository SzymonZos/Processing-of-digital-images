function exercise_1(img)
figure;
subplot(2, 4, 1);
imshow(img);
title('Original');

subplot(2, 4, 2);
imhist(img);
title('Original histogram');

imgbw = im2bw(img, 70/255);
subplot(2, 4, 3);
imshow(imgbw);
title('B & W');

[imgl, N] = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 4);
imshow(imglc);
title(['IND, N = ' ,num2str(N)]);

subplot(2, 4, 6);
thr = graythresh(img);
histdata = imhist(img);
s = plot(histdata);
dcm_obj = datacursormode();
createDatatip(dcm_obj, s, [thr * 255, histdata(round(thr * 255))]);
title('OTSU hist');

imgbw = im2bw(img, thr);
subplot(2, 4, 7);
imshow(imgbw);
title('B & W');

[imgl, N] = bwlabel(imgbw);
imglc = label2rgb(imgl);
subplot(2, 4, 8);
imshow(imglc);
title(['IND, N = ' ,num2str(N)]);
end