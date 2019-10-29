function [dictionary] = getDictionary(imgPaths, alpha, K, method)
    filterBank = createFilterBank();
    datadir = '../data';
    pixelResponses = zeros(3*alpha*length(imgPaths), length(filterBank));
    count = 1;
    for i = 1:length(imgPaths)
        img = imread(sprintf('%s/%s', datadir, imgPaths{i}));
        
        % ignore greyscale
        [~,~,channels] = size(img);
        if channels == 1
            continue;
        end
            
        filterResponses = extractFilterResponses(img, filterBank);

        if method == 'harris'
            points = getHarrisPoints(img, alpha, k);
        else
            points = getRandomPoints(img, alpha);
        end
        
        % For each point, take the pixel value from each of the 60 filter
        % results
        % each filtered image has 3 channels so split vector into 3 rows, the first row
        % for the first channel from each of the 20 filtered image
        for j = 1:length(points(:,1))
            p = points(j,:);
            vec = filterResponses(p(1), p(2), :);
            vec = vec(:);
            vec = vec2mat(vec,3)';  % each row of vec is a 20 dimensional pixel for one color channel
            pixelResponses(count:count+2,:) = vec;
            count = count + 3;
        end
    end
    
    [~, dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop', 'MaxIter',1000);
    
    
end