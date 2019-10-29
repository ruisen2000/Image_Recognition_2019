function [wordMap] = getVisualWords(I, filterBank, dictionary)
    [r,c,~] = size(I);
    filterResponses = extractFilterResponses(I, filterBank);
    [r,c,pages] = size(filterResponses);
    
    R = zeros(r,c,pages/3);
    G = zeros(r,c,pages/3);
    B = zeros(r,c,pages/3);
    
    count = 1;
    % each matrix is 1 colour channel from all 20 filtered images
    for i = 1:3:pages
        R(:,:,count) = filterResponses(:,:,i);
        G(:,:,count) = filterResponses(:,:,i+1);
        B(:,:,count) = filterResponses(:,:,i+2);
        count = count + 1;
    end
    
    % take each vector along the third dimension, convert to row vector
    % takes col by col, need to transpose back when recovering pixel
    % locations
    [r,c,pages] = size(R);
    R = reshape(R, r*c, pages);
    G = reshape(G, r*c, pages);
    B = reshape(B, r*c, pages);
    
    pixelResponses = [R; G; B];
    
    D = pdist2(pixelResponses, dictionary, 'euclidean');
    
    % use row number as label
    [~,I] = min(D,[],2);
    wordMap = vec2mat(I, r)'; % each col in image has 240 rows so convert to 240 cols then transpose to recover index
end