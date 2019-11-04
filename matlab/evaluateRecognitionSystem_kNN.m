function [confusionMatrix, accuracy] = evaluateRecognitionSystem_kNN(k, method, distance)
    datadir = '../data';
    correct = 0;
        
    % test label
    data = load(sprintf('%s/%s', datadir, 'traintest.mat'));
    testLabels = data.test_labels;
    trainLabels = data.train_labels;
    numLabels = length(data.mapping);
    
    confusionMatrix = zeros(numLabels,numLabels);
    
    % load test feature histograms
    if strcmp(method, 'Harris')
        data = load(sprintf('%s/%s', datadir, 'testFeaturesHarris.mat'));
    elseif strcmp(method, 'Random')
        data = load(sprintf('%s/%s', datadir, 'testFeaturesRandom.mat'));
    else
        disp("cannot find method");
        return
    end    
    testFeatures = data.features;
     
    % train feature histograms
    if strcmp(method, 'Harris')
        data = load(sprintf('%s/%s', datadir, 'trainFeaturesHarris.mat'));
    elseif strcmp(method, 'Random')
        data = load(sprintf('%s/%s', datadir, 'trainFeaturesRandom.mat'));
    else
        disp("cannot find method");
        return
    end    
    trainFeatures = data.features;    
    
    [numFeatures,~] = size(testFeatures);
    
    % For each image histogram
    for i = 1:numFeatures
        dist = getImageDistance(testFeatures(i,:), trainFeatures, distance);
        [~,idx] = mink(dist, k);
        neighbour_labels = trainLabels(idx);
        classification = mode(neighbour_labels);
        
        if classification == testLabels(i)
            correct = correct + 1;
        end
        confusionMatrix(testLabels(i), classification) = confusionMatrix(testLabels(i), classification) + 1;
    end
    
    accuracy = correct / numFeatures;
    
    fprintf('%s%f%s%d\n', 'Accuracy: ', accuracy, ' Correct: ', correct);

    

end