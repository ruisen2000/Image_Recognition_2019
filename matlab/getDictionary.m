function [dictionary] = getDictionary(imgPaths, alpha, K, method)
    filterBank = createFilterBank();
    datadir = '../data';
    pixelResponses = zeros(alpha*length(imgPaths), 3*length(filterBank));
    count = 1;
    for i = 1:length(imgPaths)
        fprintf('%s%d\n', 'Processing image', i); 
        img = imread(sprintf('%s/%s', datadir, imgPaths{i}));
        
        % ignore greyscale
        [~,~,channels] = size(img);
        if channels == 1
            img = cat(3, img, img, img);
        end
 
        filterResponses = extractFilterResponses(img, filterBank);

        if method == 'harris'
            points = getHarrisPoints(img, alpha, 0.04);
        elseif method == 'random'
            points = getRandomPoints(img, alpha);
        else
            disp('error, cannot find method')
            return;
        end
        
        % For each point, take the pixel value from each of the 60 filter
        % results
        % each filtered image has 3 channels so split vector into 3 rows, the first row
        % for the first channel from each of the 20 filtered image
        for j = 1:length(points(:,1))
            p = points(j,:);
            vec = filterResponses(p(1), p(2), :);
            vec = vec(:);            
            pixelResponses(count,:) = vec';
            count = count + 1;
        end
    end
    
    [~, dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop', 'MaxIter',1000);
    
    
end