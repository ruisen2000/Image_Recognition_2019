datadir = '../data';
data = load(sprintf('%s/%s', datadir, 'dictionaryHarris.mat'));
dictionary = data.dictionary;
filterBank = data.filterBank;

img = imread(sprintf('%s/%s', datadir, '/airport/sun_aifzfhyaxryjpgpf.jpg'));
wordMap = getVisualWords(img, filterBank, dictionary);

imshow(label2rgb(wordMap));