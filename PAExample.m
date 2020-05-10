function [After_im] = PAExample(im, cp)
%% 這部分是範例 以Cartesian2 的右眼第一張圖為例
PX = cp(1);
PY = cp(2);
PR = cp(3);
IX = cp(4);
IY = cp(5);
IR = cp(6);
ang_res = 720;
TR = 120;
IA = 2/3;

After_im = PupilAdjustment(im, PX, PY, PR, IX, IY, IR, ang_res, TR , IA);
%im = 圖片, 
%PX = 瞳孔X座標, PY = 瞳孔Y座標, PR = 瞳孔半徑
%IX = 虹膜X座標, IY = 虹膜Y座標, IR = 虹膜半徑
%ang_res = 由原圖取點的角度數，越大解析越高，建議至少設定為360
%TR = 輸出圖片的虹膜半徑，最後圖片大小會為TR * 2 x TR * 2
%TA = 虹膜比例占比

imshow(After_im,[0 255]); %輸出圖片
end