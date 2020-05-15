%% 1
%CallStorage;
TrainIDS = RecordResult{1,1};
PredictIDS = RecordResult{1,4};
index = 7;
%LearnRateDropFactor = 0.1;
LearnRateDropFactor = RecordResult{6,10};
%L2Regularization = 0.0001;
L2Regularization = RecordResult{6,11};
%Momentum = 0.9;
Momentum = RecordResult{6,12};
MaxEpochs = 20;
BestAccuracy = RecordResult{6,8};
%% LearnRateDropFactor

%{
    BestAccuracy = 0;
    BestLearnRateDropFactor = LearnRateDropFactor;
    
    for i = 1:3
        gpuDevice(1);
        accuracy = 0;
        LearnRateDropFactor = 0.25 + 0.25 * (i - 1);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestLearnRateDropFactor = LearnRateDropFactor;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    LearnRateDropFactor = BestLearnRateDropFactor;

    %�ĤG���q
    LearnRateDropFactorTable(1) = LearnRateDropFactor - 0.25 / 2;
    LearnRateDropFactorTable(2) = LearnRateDropFactor + 0.25 / 2;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        LearnRateDropFactor = LearnRateDropFactorTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestLearnRateDropFactor = LearnRateDropFactor;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    LearnRateDropFactor = BestLearnRateDropFactor;
    %�ĤT���q
    LearnRateDropFactorTable(1) = LearnRateDropFactor - 0.25 / 4;
    LearnRateDropFactorTable(2) = LearnRateDropFactor + 0.25 / 4;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        LearnRateDropFactor = LearnRateDropFactorTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestLearnRateDropFactor = LearnRateDropFactor;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    LearnRateDropFactor = BestLearnRateDropFactor;

    %�ĥ|���q
    LearnRateDropFactorTable(1) = LearnRateDropFactor - 0.25 / 8;
    LearnRateDropFactorTable(2) = LearnRateDropFactor + 0.25 / 8;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        LearnRateDropFactor = LearnRateDropFactorTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestLearnRateDropFactor = LearnRateDropFactor;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    LearnRateDropFactor = BestLearnRateDropFactor;
    %�Ĥ����q
    LearnRateDropFactorTable(1) = LearnRateDropFactor - 0.25 / 16;
    LearnRateDropFactorTable(2) = LearnRateDropFactor + 0.25 / 16;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        LearnRateDropFactor = LearnRateDropFactorTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestLearnRateDropFactor = LearnRateDropFactor;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    LearnRateDropFactor = BestLearnRateDropFactor;
%}
    %% Momentum
    
    BestMomentum = Momentum;

    for i = 4:4
        gpuDevice(1);
        accuracy = 0;
        Momentum = 0.6 + 0.1 * (i - 1);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestMomentum = Momentum;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    Momentum = BestMomentum;
%{
    %�ĤG���q
    MomentumTable(1) = Momentum - 0.1 / 2;
    MomentumTable(2) = Momentum + 0.1 / 2;
    
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        Momentum = MomentumTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestMomentum = Momentum;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    Momentum = BestMomentum;
    
    %�ĤT���q
    
    MomentumTable(1) = Momentum - 0.1 / 4;
    MomentumTable(2) = Momentum + 0.1 / 4;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        Momentum = MomentumTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestMomentum = Momentum;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    Momentum = BestMomentum;
%}
%{
    %�ĥ|���q
    MomentumTable(1) = Momentum - 0.1 / 8;
    MomentumTable(2) = Momentum + 0.1 / 8;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        Momentum = MomentumTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestMomentum = Momentum;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    Momentum = BestMomentum;
    %�Ĥ����q
    MomentumTable(1) = Momentum - 0.1 / 16;
    MomentumTable(2) = Momentum + 0.1 / 16;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        Momentum = MomentumTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestMomentum = Momentum;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    Momentum = BestMomentum;
%}
    %% L2Regularization
    BestL2Regularization = L2Regularization;
    
    for i = 1:3
        gpuDevice(1);
        accuracy = 0;
        L2Regularization = 0.00025 + 0.00025 * (i - 1);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestL2Regularization = L2Regularization;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    L2Regularization = BestL2Regularization;
%{
    %�ĤG���q
L2RegularizationTable(1) = L2Regularization - 0.00025 / 2;
L2RegularizationTable(2) = L2Regularization + 0.00025 / 2;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        L2Regularization = L2RegularizationTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestL2Regularization = L2Regularization;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    L2Regularization = BestL2Regularization;
    %�ĤT���q
L2RegularizationTable(1) = L2Regularization - 0.00025 / 4;
L2RegularizationTable(2) = L2Regularization + 0.00025 / 4;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        L2Regularization = L2RegularizationTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestL2Regularization = L2Regularization;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    L2Regularization = BestL2Regularization;
%}
%{
    %�ĥ|���q
L2RegularizationTable(1) = L2Regularization - 0.00025 / 8;
L2RegularizationTable(2) = L2Regularization + 0.00025 / 8;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        L2Regularization = L2RegularizationTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestL2Regularization = L2Regularization;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    L2Regularization = BestL2Regularization;
    
    %�Ĥ����q
L2RegularizationTable(1) = L2Regularization - 0.00025 / 16;
L2RegularizationTable(2) = L2Regularization + 0.00025 / 16;
    for i = 1:2
        gpuDevice(1);
        accuracy = 0;
        L2Regularization = L2RegularizationTable(i);
        
        t0 = clock;			% �O���{�b���ɶ�
        
        AlexNetTransfer;
        SaveData
        if accuracy >= BestAccuracy
            BestL2Regularization = L2Regularization;
            BestAccuracy = accuracy
        end
        index = index + 1;
    end
    L2Regularization = BestL2Regularization;
%}