clear;
accuracy = double(zeros(1,40));


for k = 1:40
    [confusion, acc] = evaluateRecognitionSystem_kNN(k, 'Random', 'chi2');
    if acc > max(accuracy)
        c = confusion;
    end
    accuracy(k) = acc;
end
c
scatter(1:40, accuracy)
hold on
xlabel('k');
ylabel('accuracy')
hold off
