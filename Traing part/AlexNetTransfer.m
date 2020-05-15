%%
gpuDevice(1);

% 讀取圖片
CallStorage;

% 讀取 mat 檔
load RecordResult1to8;

LearnRateDropFactor = RecordResult{7,10};

L2Regularization = RecordResult{7,11};

Momentum = RecordResult{7,12};

net = alexnet;

layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(TrainIDS.Labels));

%這邊因為裡面bias是隨機的關係
%所以你做出來準確率不一定會跟我一樣
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

%這邊15是最高準確率的狀況
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