datadir = '../data';
data = load(sprintf('%s/%s', datadir, 'dictionaryRandom.mat'));
dictionary = data.dictionary;
filterBank = data.filterBank;

img = imread(sprintf('%s/%s', datadir, '/airport/sun_aesovualhburmfhn.jpg'));
wordMap = getVisualWords(img, filterBank, dictionary);

imshow(label2rgb(wordMap));