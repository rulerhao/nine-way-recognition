

MainFile = dir();
MainFileDir = MainFile.folder;              %設定資料夾初始路徑

Path1 = [MainFileDir,'\土金\'];     %土金路徑
Path2 = [MainFileDir,'\土水\'];     %土水路徑
Path3 = [MainFileDir,'\土木\'];     %土木路徑
Path4 = [MainFileDir,'\火金\'];     %火金路徑
Path5 = [MainFileDir,'\火水\'];     %火水路徑
Path6 = [MainFileDir,'\火木\'];     %火木路徑
Path7 = [MainFileDir,'\金水\'];     %金水路徑
Path8 = [MainFileDir,'\水木\'];     %水木路徑
Path9 = [MainFileDir,'\木金\'];     %木金路徑

Find1Jpg = [Path1,'*jpg'];                  %路徑+*jpg
Find2Jpg = [Path2,'*jpg'];                  %路徑+*jpg
Find3Jpg = [Path3,'*jpg'];                  %路徑+*jpg
Find4Jpg = [Path4,'*jpg'];                  %路徑+*jpg
Find5Jpg = [Path5,'*jpg'];                  %路徑+*jpg
Find6Jpg = [Path6,'*jpg'];                  %路徑+*jpg
Find7Jpg = [Path7,'*jpg'];                  %路徑+*jpg
Find8Jpg = [Path8,'*jpg'];                  %路徑+*jpg
Find9Jpg = [Path9,'*jpg'];                  %路徑+*jpg

Jpg1 = dir(Find1Jpg);                       %圖片資料
Jpg2 = dir(Find2Jpg);                       %圖片資料
Jpg3 = dir(Find3Jpg);                       %圖片資料
Jpg4 = dir(Find4Jpg);                       %圖片資料
Jpg5 = dir(Find5Jpg);                       %圖片資料
Jpg6 = dir(Find6Jpg);                       %圖片資料
Jpg7 = dir(Find7Jpg);                       %圖片資料
Jpg8 = dir(Find8Jpg);                       %圖片資料
Jpg9 = dir(Find9Jpg);                       %圖片資料

%% 讀取檔名
for i = 1 : size(Jpg1,1)
    Pic1Name{i} = Jpg1(i).name;             %讀取檔名
end
for i = 1 : size(Jpg2,1)
    Pic2Name{i} = Jpg2(i).name;             %讀取檔名
end
for i = 1 : size(Jpg3,1)
    Pic3Name{i} = Jpg3(i).name;             %讀取檔名
end
for i = 1 : size(Jpg4,1)
    Pic4Name{i} = Jpg4(i).name;             %讀取檔名
end
for i = 1 : size(Jpg5,1)
    Pic5Name{i} = Jpg5(i).name;             %讀取檔名
end
for i = 1 : size(Jpg6,1)
    Pic6Name{i} = Jpg6(i).name;             %讀取檔名
end
for i = 1 : size(Jpg7,1)
    Pic7Name{i} = Jpg7(i).name;             %讀取檔名
end
for i = 1 : size(Jpg8,1)
    Pic8Name{i} = Jpg8(i).name;             %讀取檔名
end
for i = 1 : size(Jpg9,1)
    Pic9Name{i} = Jpg9(i).name;             %讀取檔名
end
%% 隨機
random1 = randperm(size(Jpg1,1));
random2 = randperm(size(Jpg2,1));
random3 = randperm(size(Jpg3,1));
random4 = randperm(size(Jpg4,1));
random5 = randperm(size(Jpg5,1));
random6 = randperm(size(Jpg6,1));
random7 = randperm(size(Jpg7,1));
random8 = randperm(size(Jpg8,1));
random9 = randperm(size(Jpg9,1));

%% 訓練讀取
for i = 1 : size(Jpg1,1) - round(size(Jpg1,1) / 5)
    TrainPic1Locate{i} = ['土金\',Pic1Name{random1(i)}];             
end

for i = 1 : size(Jpg2,1) - round(size(Jpg2,1) / 5)
    TrainPic2Locate{i} = ['土水\',Pic2Name{random2(i)}];             
end

for i = 1 : size(Jpg3,1) - round(size(Jpg3,1) / 5)
    TrainPic3Locate{i} = ['土木\',Pic3Name{random3(i)}];             
end

for i = 1 : size(Jpg4,1) - round(size(Jpg4,1) / 5)
    TrainPic4Locate{i} = ['火金\',Pic4Name{random4(i)}];             
end

for i = 1 : size(Jpg5,1) - round(size(Jpg5,1) / 5)
    TrainPic5Locate{i} = ['火水\',Pic5Name{random5(i)}];             
end

for i = 1 : size(Jpg6,1) - round(size(Jpg6,1) / 5)
    TrainPic6Locate{i} = ['火木\',Pic6Name{random6(i)}];             
end

for i = 1 : size(Jpg7,1) - round(size(Jpg7,1) / 5)
    TrainPic7Locate{i} = ['金水\',Pic7Name{random7(i)}];             
end

for i = 1 : size(Jpg8,1) - round(size(Jpg8,1) / 5)
    TrainPic8Locate{i} = ['水木\',Pic8Name{random8(i)}];             
end

for i = 1 : size(Jpg9,1) - round(size(Jpg9,1) / 5)
    TrainPic9Locate{i} = ['木金\',Pic9Name{random9(i)}];             
end


PicTrainLocate = [TrainPic1Locate,TrainPic2Locate,TrainPic3Locate,TrainPic4Locate,TrainPic5Locate,TrainPic6Locate,TrainPic7Locate,TrainPic8Locate,TrainPic9Locate];
%PicTrainLocate = [TrainPic4Locate,TrainPic5Locate,TrainPic6Locate];

TrainIDS = imageDatastore(PicTrainLocate,'LabelSource','foldernames');
%% 預測讀取
for i = size(Jpg1,1) - round(size(Jpg1,1) / 5) + 1 : size(Jpg1,1)
    PredictPic1Locate{i - (size(Jpg1,1) - round(size(Jpg1,1) / 5))} = ['土金\',Pic1Name{random1(i)}];             
end

for i = size(Jpg2,1) - round(size(Jpg2,1) / 5) + 1 : size(Jpg2,1)
    PredictPic2Locate{i - (size(Jpg2,1) - round(size(Jpg2,1) / 5))} = ['土水\',Pic2Name{random2(i)}];             
end

for i = size(Jpg3,1) - round(size(Jpg3,1) / 5) + 1 : size(Jpg3,1)
    PredictPic3Locate{i - (size(Jpg3,1) - round(size(Jpg3,1) / 5))} = ['土木\',Pic3Name{random3(i)}];             
end

for i = size(Jpg4,1) - round(size(Jpg4,1) / 5) + 1 : size(Jpg4,1)
    PredictPic4Locate{i - (size(Jpg4,1) - round(size(Jpg4,1) / 5))} = ['火金\',Pic4Name{random4(i)}];             
end

for i = size(Jpg5,1) - round(size(Jpg5,1) / 5) + 1 : size(Jpg5,1)
    PredictPic5Locate{i - (size(Jpg5,1) - round(size(Jpg5,1) / 5))} = ['火水\',Pic5Name{random5(i)}];             
end

for i = size(Jpg6,1) - round(size(Jpg6,1) / 5) + 1 : size(Jpg6,1)
    PredictPic6Locate{i - (size(Jpg6,1) - round(size(Jpg6,1) / 5))} = ['火木\',Pic6Name{random6(i)}];             
end

for i = size(Jpg7,1) - round(size(Jpg7,1) / 5) + 1 : size(Jpg7,1)
    PredictPic7Locate{i - (size(Jpg7,1) - round(size(Jpg7,1) / 5))} = ['金水\',Pic7Name{random7(i)}];             
end

for i = size(Jpg8,1) - round(size(Jpg8,1) / 5) + 1 : size(Jpg8,1)
    PredictPic8Locate{i - (size(Jpg8,1) - round(size(Jpg8,1) / 5))} = ['水木\',Pic8Name{random8(i)}];             
end

for i = size(Jpg9,1) - round(size(Jpg9,1) / 5) + 1 : size(Jpg9,1)
    PredictPic9Locate{i - (size(Jpg9,1) - round(size(Jpg9,1) / 5))} = ['木金\',Pic9Name{random9(i)}];             
end

PicPredictLocate = [PredictPic1Locate,PredictPic2Locate,PredictPic3Locate,PredictPic4Locate,PredictPic5Locate,PredictPic6Locate,PredictPic7Locate,PredictPic8Locate,PredictPic9Locate];
%PicPredictLocate = [PredictPic4Locate,PredictPic5Locate,PredictPic6Locate];

PredictIDS = imageDatastore(PicPredictLocate,'LabelSource','foldernames');
