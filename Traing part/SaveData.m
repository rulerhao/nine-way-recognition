        RecordResult{index,1} = TrainIDS;
        RecordResult{index,4} = PredictIDS;
        RecordResult{index,7} = etime(clock, t0);
        RecordResult{index,8} = accuracy;
        RecordResult{index,9} = netTransfer;
        RecordResult{index,10} = LearnRateDropFactor;
        RecordResult{index,11} = L2Regularization;
        RecordResult{index,12} = Momentum;