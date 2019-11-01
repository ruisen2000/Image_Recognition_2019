load('../data/traintest.mat','all_imagenames','mapping');
load('../data/dictionaryHarris.mat','filterBank','dictionary');

source = '../data/';
target = '../data/'; 
l = length(all_imagenames);
trainFeatures = zeros(l, clusters);
[clusters,c] = size(dictionary);

for i=1:l
    data = load([target, strrep(all_imagenames{i},'.jpg','.mat')]);
    wordMap = data.wordMap;
    h = getImageFeatures(wordMap, clusters);
    trainFeatures(i,:) = h;
end
save('../data/trainFeaturesHarris.mat','trainFeatures');