
%% �g��
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\�g��\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,90);
    imwrite(I,[Jpg(i).folder,'\90_',Jpg(i).name]);
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
    I = imrotate(A,270);
    imwrite(I,[Jpg(i).folder,'\270_',Jpg(i).name]);
end
clear;

%% �g��
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\�g��\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,90);
    imwrite(I,[Jpg(i).folder,'\90_',Jpg(i).name]);
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
    I = imrotate(A,270);
    imwrite(I,[Jpg(i).folder,'\270_',Jpg(i).name]);
end
clear;

%% ���
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\���\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;

%% ����
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\����\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,90);
    imwrite(I,[Jpg(i).folder,'\90_',Jpg(i).name]);
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
    I = imrotate(A,270);
    imwrite(I,[Jpg(i).folder,'\270_',Jpg(i).name]);
end
clear;

%% ����
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\����\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;

%% ����
FindJpg = ['C:\Users\�Ż�\Desktop\�i���ǱM�D\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\����\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;