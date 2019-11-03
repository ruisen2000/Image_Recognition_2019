function [dist] = getImageDistance(hist1, histSet, method)
    % returns column vector of distances
    [r,~] = size(histSet);
    hist1 = repmat(hist1, r,1);
    
    if strcmp(method, 'euclidean')
         dist = sqrt(sum((hist1 - histSet) .^ 2, 2));
    elseif strcmp(method, 'chi2')
        numer = (hist1 - histSet).^2;
        denom = hist1 + histSet;
        dist = 0.5* sum(numer./denom, 2);
    else
        disp('error: method doesnt exist')
    end
end