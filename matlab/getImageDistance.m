function [dist] = getImageDistance(hist1, hist2, method)
    if strcmp(method, 'euclidean')
         dist = sqrt(sum((G - G2) .^ 2));
    elseif strcmp(method, 'chi2')
        numer = (hist1 - hist2).^2;
        denom = hist1 + hist2;
        dist = 0.5* sum(numer ./ denom);
    else
        disp('error: method doesnt exist')
    end
end