function saveHistogram(dataset, clusters, setname, dictionaryType)

    source = sprintf('%s%s/', '../data/', dictionaryType);
    target = '../data/'; 
    l = length(dataset);
    
    features = zeros(l, clusters);

    for i=1:l
        data = load([source, strrep(dataset{i},'.jpg','.mat')]);
        wordMap = data.wordMap;
        h = getImageFeatures(wordMap, clusters);
        features(i,:) = h;
    end
    
    filename = sprintf('%s%s%s%s', target, setname, 'Features',  dictionaryType, '.mat');
    save(filename,'features');

end