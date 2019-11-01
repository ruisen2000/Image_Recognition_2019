function [h] = getImageFeatures(wordMap, dictionarySize)
% return histogram as row vector
    h = zeros(1,dictionarySize);
    for i = 1:dictionarySize
        h(i) = sum(wordMap==i, 'all');
    end
    
    % L1 normaliztion
    h = h / sum(h);
end