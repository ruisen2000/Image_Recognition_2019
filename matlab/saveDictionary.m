clear;
clc;

datadir = '../data';
data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
imagePaths = data.train_imagenames;
alpha = 50;
K = 100;
filterBank = createFilterBank();

dictionary = getDictionary(imagePaths, alpha, K, 'harris');
save('../data/dictionaryHarris.mat', 'filterBank', 'dictionary');