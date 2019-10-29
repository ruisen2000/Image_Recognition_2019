 function [pixelResponses] = computeDictionary(points, count, pixelResponses, filterResponses)
    % For each point, take the pixel value from each of the 60 filter
    % results
    % each filtered image has 3 channels so split vector into 3 rows, the first row
    % for the first channel from each of the 20 filtered image
    for j = 1:length(points(:,1))
        p = points(j,:);
        vec = filterResponses(p(1), p(2), :);
        vec = vec(:);
        vec = vec2mat(vec,3)';
        pixelResponses(count:count+2,:) = vec;
    end