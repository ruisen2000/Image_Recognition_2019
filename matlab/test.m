clear;
clc;
filterBank = createFilterBank();

datadir = '../data';

img1 = imread(sprintf('%s/%s', datadir, '/campus/sun_abslhphpiejdjmpz.jpg'));
%[filterResponses] = extractFilterResponses(img1, filterBank);
% 
% for i = 0:19
%     figure;
%     imshow(lab2rgb(filterResponses(:,:,3*i+1:3*i+3)));
% end

% pts = getHarrisPoints(img1, 500, 0.04);
% 
% imshow(img1);
% axis on
% hold on;
% scatter(pts(:,2), pts(:,1), 'Marker', '.');



