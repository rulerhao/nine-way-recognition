function [PA] = PupilAdjustment(im, PX, PY, PR, IX, IY, IR, ang_res, TR , IA)
%im = 圖片, 
%PX = 瞳孔X座標, PY = 瞳孔Y座標, PR = 瞳孔半徑
%IX = 虹膜X座標, IY = 虹膜Y座標, IR = 虹膜半徑
%ang_res = 由原圖取點的角度數，越大解析越高，建議至少設定為360
%TR = 輸出圖片的虹膜半徑，最後圖片大小會為TR * 2 x TR * 2
%TA = 虹膜比例占比

PointX = TR; %輸出圖片的圓心X座標
PointY = TR; %輸出圖片的圓心Y座標

rad_res = round(TR * IA); %將虹膜半徑和瞳孔半徑按比例分配
%rad_res = 虹膜片段長度

%將圖檔做interpolation
norm = Newnormalize(im, [PX PY PR IX IY IR], ang_res, rad_res);
% [內圈X座標 內圈Y座標 內圈半徑 外圈X座標 外圈Y座標 外圈半徑] 其他需要做改動的只有imread內的圖檔就好

%% 將瞳孔部分補上
for i = rad_res:TR
    for j = 1 : ang_res
        norm(i,j) = 0;
    end
end

%% 開始把做完 interpolation 及補上瞳孔後的長條圖轉為圓心輸出圖
% 作法為將2 * TR + 1 的空白圖片
% 依照每個點對圓心的角度及半徑對回上方做完interpolation的圖片
for i = 1:(TR * 2)
    for j = 1:(TR * 2)
        if sqrt((i - PointX) ^ 2 + (j - PointY) ^ 2) > TR
            A(i,j) = 0;
        else
            r = round(sqrt((i - PointX) ^ 2 + (j - PointY) ^ 2)); %該點距離圓心的距離
            if i == PointX && j == PointY %當取到圓心的狀況
                A(i,j) = 0;
            else
                if i - PointX >= 0 && j - PointY < 0                            %圓心右上部分
                    angle = abs(atan((i - PointX)/(j - PointY))*180/pi);
                elseif i - PointX >= 0 && j - PointY >= 0                       %圓心右下部分
                    angle = 180 - atan((i - PointX)/(j - PointY))*180/pi;
                elseif i - PointX < 0 && j - PointY >= 0                        %圓心左下部分
                    angle = 180 + abs(atan((i - PointX)/(j - PointY))*180/pi);
                else                                                            %圓心左上部分
                    angle = 360 - atan((i - PointX)/(j - PointY))*180/pi;
                end
                angle = angle * (ang_res/360);
                angle = round(angle);
                if angle == 0
                    angle = ang_res;
                end
                A(i,j) = norm(TR + 1 - r,angle);
            end
        end
    end
end
A = imrotate(A,180);

PA = A;