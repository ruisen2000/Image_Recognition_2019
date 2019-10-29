clear;
clc;

datadir = '../data';
data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
imagePaths = data.train_imagenames;
alpha = 50;
K = 100;
filterBank = createFilterBank();

dictionary = getDictionary(imagePaths, alpha, K, 'random');
save('../data/dictionaryRandom.mat', 'filterBank', 'dictionary');