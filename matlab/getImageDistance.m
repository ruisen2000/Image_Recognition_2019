function [dist] = getImageDistance(hist1, histSet, method)
    % returns column vector of distances
    
    if strcmp(method, 'euclidean')
         [r,~] = size(histSet);
         hist1 = repmat(hist1, r,1);
         dist = sqrt(sum((hist1 - histSet) .^ 2, 2));
    elseif strcmp(method, 'chi2')
            n = size(histSet,1);
            D = zeros(1,n);
            for i=1:n
              yi = histSet(i,:);
              yiRep = yi( 1, : );
              denom = yiRep + hist1;
              numerator = yiRep - hist1;
              D(:,i) = sum( numerator.^2 ./ (denom+eps), 2 );
            end
        dist = D/2;
        dist = dist';
    else
        disp('error: method doesnt exist')
    end
end