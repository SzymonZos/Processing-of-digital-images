function permuted = permute_container(comp)
    for i=1:size(comp, 3)
        permuted(1,1:3,i) = comp(2, [1 2 5], i);
        permuted(1,4:6,i) = comp(3, [1 2 5], i);
        permuted(2,1:3,i) = comp(2, [4 3 6], i);
        permuted(2,4:6,i) = comp(3, [4 3 6], i);
    end
end