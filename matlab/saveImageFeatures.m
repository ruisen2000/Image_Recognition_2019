load('../data/traintest.mat','test_imagenames','mapping');
load('../data/traintest.mat','train_imagenames','mapping');
load('../data/dictionaryRandom.mat','filterBank','dictionary');

% convert the wordmap for training and testing images (computed in batchToVisualWords) into a histogram
[clusters,~] = size(dictionary);
saveHistogram(train_imagenames, clusters, 'train', 'Random')
saveHistogram(test_imagenames, clusters, 'test', 'Random')