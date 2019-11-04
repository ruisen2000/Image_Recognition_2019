function buildRecognitionSystem(method)
    datadir = '../data';
    data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
    trainLabels = data.train_labels;

    if strcmp(method, 'Harris')
        dict = load(sprintf('%s/%s', datadir, 'dictionaryHarris.mat'));
        data = load(sprintf('%s/%s', datadir, 'trainFeaturesHarris.mat'));
        trainFeatures = data.features;
    elseif strcmp(method, 'Random')
        dict = load(sprintf('%s/%s', datadir, 'dictionaryRandom.mat'));
        data = load(sprintf('%s/%s', datadir, 'trainFeaturesRandom.mat'));
        trainFeatures = data.features;
    else
        disp("cannot find method");
        return
    end
    
    % todo: get trainFeatures then get their histograms with getImageFeatures
    
    dictionary = dict.dictionary;
    filterBank = dict.filterBank;
    save(sprintf('%s/%s%s%s', datadir, 'vision', method, '.mat'), 'filterBank', 'dictionary', 'trainFeatures', 'trainLabels');


end