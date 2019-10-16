function filteredPixel = filterVMF(imgSubMatrix, p)
    [imgSubMatrix_X, imgSubMatrix_Y, ~] = size(imgSubMatrix); 
    R = zeros([imgSubMatrix_X, imgSubMatrix_Y]);
    for i = 1 : max(size(imgSubMatrix))
        for j = 1 : max(size(imgSubMatrix))
            if i~=j
                %R(i) = R(i) + max(abs(imgSubMatrix(1,i,:) - imgSubMatrix(1,j,:)));
                R(i) = R(i) + sum(abs(imgSubMatrix(1,i,:) - imgSubMatrix(1,j,:)).^ p)^(1/p);
            end
        end
    end
    
   % medianIndex = ceil(imgSubMatrix_X * imgSubMatrix_Y / 2);
   % [~, previousIndex] = sort(R);
   % filteredPixel = imgSubMatrix(1,previousIndex(medianIndex),:);
   [~, index] = min(R);
   filteredPixel = imgSubMatrix(1,index,:);
end
