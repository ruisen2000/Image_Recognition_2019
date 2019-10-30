function [filterResponses] = extractFilterResponses(I, filterBank)
    I = double(I);
    [L,a,b] = RGB2Lab(I(:,:,1),I(:,:,2),I(:,:,3));
    filterResponses = [];

    for i = 1:length(filterBank)
        res = imfilter(L, filterBank{i}, 'conv');
        res2 = imfilter(a, filterBank{i}, 'conv');
        res3 = imfilter(b, filterBank{i}, 'conv');
        filterResponses = cat(3, filterResponses, res, res2, res3);
    end
end