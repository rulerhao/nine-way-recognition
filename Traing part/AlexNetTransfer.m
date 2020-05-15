%%
gpuDevice(1);

% Ū���Ϥ�
CallStorage;

% Ū�� mat ��
load RecordResult1to8;

LearnRateDropFactor = RecordResult{7,10};

L2Regularization = RecordResult{7,11};

Momentum = RecordResult{7,12};

net = alexnet;

layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(TrainIDS.Labels));

%�o��]���̭�bias�O�H�������Y
%�ҥH�A���X�ӷǽT�v���@�w�|��ڤ@��
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

%�o��15�O�̰��ǽT�v�����p
MaxEpochs = 20;

options = trainingOptions('sgdm', ...
    'MiniBatchSize',5, ...
    'MaxEpochs',MaxEpochs, ...
    'InitialLearnRate',1e-4, ...
    'Verbose',false,...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',1,...
    'LearnRateDropFactor',LearnRateDropFactor,...
    'L2Regularization',L2Regularization,...
    'Momentum',Momentum,...
    'ValidationData',PredictIDS,...
    'ValidationFrequency',10000,...
    'ValidationPatience',10,...
    'Plots','training-progress');

netTransfer = trainNetwork(TrainIDS,layers,options);

predictedLabels = classify(netTransfer,PredictIDS);

testLabels = PredictIDS.Labels;

accuracy = sum(predictedLabels==testLabels)/numel(predictedLabels)