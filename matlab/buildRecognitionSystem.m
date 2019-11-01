function buildRecognitionSystem(method)
    datadir = '../data';
    data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
    trainLabels = data.train_labels;
    data = load(sprintf('%s/%s', datadir, 'trainFeaturesHarris.mat'));
    trainFeatures = data.trainFeatures;
    if strcmp(method, 'Harris')
        dict = load(sprintf('%s/%s', datadir, 'dictionaryHarris.mat'));
    elseif strcmp(method, 'Random')
        dict = load(sprintf('%s/%s', datadir, 'dictionaryRandom.mat'));
    else
        disp("cannot find method");
        return
    end
    
    % todo: get trainFeatures then get their histograms with getImageFeatures
    
    dictionary = dict.dictionary;
    filterBank = dict.filterBank;
    save(sprintf('%s/%s%s%s', datadir, 'vision', method, '.mat'), 'filterBank', 'dictionary', 'trainFeatures', 'trainLabels');


end