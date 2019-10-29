function [points] = getRandomPoints(I, alpha)
% returns rnadom pixel locations in [row col]
    [r,c,~] = size(I);
    r_col = randi([1 c],1,alpha);
    r_row = randi([1 r],1,alpha);
    points = [r_row', r_col'];

end