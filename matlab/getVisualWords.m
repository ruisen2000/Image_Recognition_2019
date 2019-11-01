function [wordMap] = getVisualWords(I, filterBank, dictionary)
    [r,c,channels] = size(I);
    
    if channels == 1
        I = cat(3, I,I,I);
    end
        
    filterResponses = extractFilterResponses(I, filterBank);
    [r,c,pages] = size(filterResponses);
    
%     L = zeros(r,c,pages/3);
%     a = zeros(r,c,pages/3);
%     b = zeros(r,c,pages/3);
%     
%     count = 1;
%     % each matrix is 1 colour channel from all 20 filtered images
%     for i = 1:3:pages
%         L(:,:,count) = filterResponses(:,:,i);
%         a(:,:,count) = filterResponses(:,:,i+1);
%         b(:,:,count) = filterResponses(:,:,i+2);
%         count = count + 1;
%     end
%     

%     [r,c,pages] = size(R);
%     L = reshape(L, r*c, pages);
%     a = reshape(a, r*c, pages);
%     b = reshape(b, r*c, pages);
%     
%     pixelResponses = [R; G; B];
    
     % take each vector along the third dimension, convert to row vector
     % takes col by col, need to transpose back when recovering pixel
     % locations
    pixelResponses = reshape(filterResponses, r*c, pages);
    
    
    D = pdist2(pixelResponses, dictionary, 'euclidean');
    
    % use row number as label
    [~,ind] = min(D,[],2);
    wordMap = vec2mat(ind, r)'; % each col in image has 240 rows so convert to 240 cols then transpose to recover index
end