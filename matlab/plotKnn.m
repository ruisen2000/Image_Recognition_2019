numCorrect = zeros(1,40);

for k = 1:40
    [confusion, correct] = evaluateRecognitionSystem_kNN(k, 'Harris', 'euclidean');
    numCorrect(k) = correct;
end

scatter(1:40, numCorrect)
hold on
xlabel('k');
ylabel('Correct')
hold off
