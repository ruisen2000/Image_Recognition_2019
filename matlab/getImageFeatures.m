function [h] = getImageFeatures(wordMap, dictionarySize)
    h = zeros(length(dictionarySize));
    for i = 1:dictionarySize
        h(i) = sum(wordMap==i, 'all');
    end
    
    % L1 normaliztion
    h = h / sum(h);
end