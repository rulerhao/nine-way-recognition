
%% 土木
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\土木\','*.jpg'];
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

%% 土水
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\土水\','*.jpg'];
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

%% 木金
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\木金\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;

%% 水木
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\水木\','*.jpg'];
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

%% 火水
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\火水\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;

%% 金水
FindJpg = ['C:\Users\嘉豪\Desktop\虹膜學專題\20180403\inter Interpolation\NewPicture\NewSeg\AfterAdjust1\partenerStorageTwoEyesRunAlexNet\金水\','*.jpg'];
Jpg = dir(FindJpg);
[x,y] = size(Jpg);
for i = 1:x
    A = imread([Jpg(i).folder,'\',Jpg(i).name]);
    
    I = imrotate(A,180);
    imwrite(I,[Jpg(i).folder,'\180_',Jpg(i).name]);
end
clear;