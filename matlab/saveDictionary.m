clear;
clc;

datadir = '../data';
data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
imagePaths = data.train_imagenames;
alpha = 650;
K = 400;
filterBank = createFilterBank();

dictionary = getDictionary(imagePaths, alpha, K, 'harris');
save('../data/dictionaryHarris.mat', 'filterBank', 'dictionary');

dictionary = getDictionary(imagePaths, alpha, K, 'random');
save('../data/dictionaryRandom.mat', 'filterBank', 'dictionary');