

MainFile = dir();
MainFileDir = MainFile.folder;              %�]�w��Ƨ���l���|

Path1 = [MainFileDir,'\�g��\'];     %�g�����|
Path2 = [MainFileDir,'\�g��\'];     %�g�����|
Path3 = [MainFileDir,'\�g��\'];     %�g����|
Path4 = [MainFileDir,'\����\'];     %�������|
Path5 = [MainFileDir,'\����\'];     %�������|
Path6 = [MainFileDir,'\����\'];     %������|
Path7 = [MainFileDir,'\����\'];     %�������|
Path8 = [MainFileDir,'\����\'];     %������|
Path9 = [MainFileDir,'\���\'];     %������|

Find1Jpg = [Path1,'*jpg'];                  %���|+*jpg
Find2Jpg = [Path2,'*jpg'];                  %���|+*jpg
Find3Jpg = [Path3,'*jpg'];                  %���|+*jpg
Find4Jpg = [Path4,'*jpg'];                  %���|+*jpg
Find5Jpg = [Path5,'*jpg'];                  %���|+*jpg
Find6Jpg = [Path6,'*jpg'];                  %���|+*jpg
Find7Jpg = [Path7,'*jpg'];                  %���|+*jpg
Find8Jpg = [Path8,'*jpg'];                  %���|+*jpg
Find9Jpg = [Path9,'*jpg'];                  %���|+*jpg

Jpg1 = dir(Find1Jpg);                       %�Ϥ����
Jpg2 = dir(Find2Jpg);                       %�Ϥ����
Jpg3 = dir(Find3Jpg);                       %�Ϥ����
Jpg4 = dir(Find4Jpg);                       %�Ϥ����
Jpg5 = dir(Find5Jpg);                       %�Ϥ����
Jpg6 = dir(Find6Jpg);                       %�Ϥ����
Jpg7 = dir(Find7Jpg);                       %�Ϥ����
Jpg8 = dir(Find8Jpg);                       %�Ϥ����
Jpg9 = dir(Find9Jpg);                       %�Ϥ����

%% Ū���ɦW
for i = 1 : size(Jpg1,1)
    Pic1Name{i} = Jpg1(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg2,1)
    Pic2Name{i} = Jpg2(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg3,1)
    Pic3Name{i} = Jpg3(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg4,1)
    Pic4Name{i} = Jpg4(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg5,1)
    Pic5Name{i} = Jpg5(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg6,1)
    Pic6Name{i} = Jpg6(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg7,1)
    Pic7Name{i} = Jpg7(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg8,1)
    Pic8Name{i} = Jpg8(i).name;             %Ū���ɦW
end
for i = 1 : size(Jpg9,1)
    Pic9Name{i} = Jpg9(i).name;             %Ū���ɦW
end
%% �H��
random1 = randperm(size(Jpg1,1));
random2 = randperm(size(Jpg2,1));
random3 = randperm(size(Jpg3,1));
random4 = randperm(size(Jpg4,1));
random5 = randperm(size(Jpg5,1));
random6 = randperm(size(Jpg6,1));
random7 = randperm(size(Jpg7,1));
random8 = randperm(size(Jpg8,1));
random9 = randperm(size(Jpg9,1));

%% �V�mŪ��
for i = 1 : size(Jpg1,1) - round(size(Jpg1,1) / 5)
    TrainPic1Locate{i} = ['�g��\',Pic1Name{random1(i)}];             
end

for i = 1 : size(Jpg2,1) - round(size(Jpg2,1) / 5)
    TrainPic2Locate{i} = ['�g��\',Pic2Name{random2(i)}];             
end

for i = 1 : size(Jpg3,1) - round(size(Jpg3,1) / 5)
    TrainPic3Locate{i} = ['�g��\',Pic3Name{random3(i)}];             
end

for i = 1 : size(Jpg4,1) - round(size(Jpg4,1) / 5)
    TrainPic4Locate{i} = ['����\',Pic4Name{random4(i)}];             
end

for i = 1 : size(Jpg5,1) - round(size(Jpg5,1) / 5)
    TrainPic5Locate{i} = ['����\',Pic5Name{random5(i)}];             
end

for i = 1 : size(Jpg6,1) - round(size(Jpg6,1) / 5)
    TrainPic6Locate{i} = ['����\',Pic6Name{random6(i)}];             
end

for i = 1 : size(Jpg7,1) - round(size(Jpg7,1) / 5)
    TrainPic7Locate{i} = ['����\',Pic7Name{random7(i)}];             
end

for i = 1 : size(Jpg8,1) - round(size(Jpg8,1) / 5)
    TrainPic8Locate{i} = ['����\',Pic8Name{random8(i)}];             
end

for i = 1 : size(Jpg9,1) - round(size(Jpg9,1) / 5)
    TrainPic9Locate{i} = ['���\',Pic9Name{random9(i)}];             
end


PicTrainLocate = [TrainPic1Locate,TrainPic2Locate,TrainPic3Locate,TrainPic4Locate,TrainPic5Locate,TrainPic6Locate,TrainPic7Locate,TrainPic8Locate,TrainPic9Locate];
%PicTrainLocate = [TrainPic4Locate,TrainPic5Locate,TrainPic6Locate];

TrainIDS = imageDatastore(PicTrainLocate,'LabelSource','foldernames');
%% �w��Ū��
for i = size(Jpg1,1) - round(size(Jpg1,1) / 5) + 1 : size(Jpg1,1)
    PredictPic1Locate{i - (size(Jpg1,1) - round(size(Jpg1,1) / 5))} = ['�g��\',Pic1Name{random1(i)}];             
end

for i = size(Jpg2,1) - round(size(Jpg2,1) / 5) + 1 : size(Jpg2,1)
    PredictPic2Locate{i - (size(Jpg2,1) - round(size(Jpg2,1) / 5))} = ['�g��\',Pic2Name{random2(i)}];             
end

for i = size(Jpg3,1) - round(size(Jpg3,1) / 5) + 1 : size(Jpg3,1)
    PredictPic3Locate{i - (size(Jpg3,1) - round(size(Jpg3,1) / 5))} = ['�g��\',Pic3Name{random3(i)}];             
end

for i = size(Jpg4,1) - round(size(Jpg4,1) / 5) + 1 : size(Jpg4,1)
    PredictPic4Locate{i - (size(Jpg4,1) - round(size(Jpg4,1) / 5))} = ['����\',Pic4Name{random4(i)}];             
end

for i = size(Jpg5,1) - round(size(Jpg5,1) / 5) + 1 : size(Jpg5,1)
    PredictPic5Locate{i - (size(Jpg5,1) - round(size(Jpg5,1) / 5))} = ['����\',Pic5Name{random5(i)}];             
end

for i = size(Jpg6,1) - round(size(Jpg6,1) / 5) + 1 : size(Jpg6,1)
    PredictPic6Locate{i - (size(Jpg6,1) - round(size(Jpg6,1) / 5))} = ['����\',Pic6Name{random6(i)}];             
end

for i = size(Jpg7,1) - round(size(Jpg7,1) / 5) + 1 : size(Jpg7,1)
    PredictPic7Locate{i - (size(Jpg7,1) - round(size(Jpg7,1) / 5))} = ['����\',Pic7Name{random7(i)}];             
end

for i = size(Jpg8,1) - round(size(Jpg8,1) / 5) + 1 : size(Jpg8,1)
    PredictPic8Locate{i - (size(Jpg8,1) - round(size(Jpg8,1) / 5))} = ['����\',Pic8Name{random8(i)}];             
end

for i = size(Jpg9,1) - round(size(Jpg9,1) / 5) + 1 : size(Jpg9,1)
    PredictPic9Locate{i - (size(Jpg9,1) - round(size(Jpg9,1) / 5))} = ['���\',Pic9Name{random9(i)}];             
end

PicPredictLocate = [PredictPic1Locate,PredictPic2Locate,PredictPic3Locate,PredictPic4Locate,PredictPic5Locate,PredictPic6Locate,PredictPic7Locate,PredictPic8Locate,PredictPic9Locate];
%PicPredictLocate = [PredictPic4Locate,PredictPic5Locate,PredictPic6Locate];

PredictIDS = imageDatastore(PicPredictLocate,'LabelSource','foldernames');
