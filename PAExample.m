function [After_im] = PAExample(im, cp)
%% �o�����O�d�� �HCartesian2 ���k���Ĥ@�i�Ϭ���
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
%im = �Ϥ�, 
%PX = ����X�y��, PY = ����Y�y��, PR = ���եb�|
%IX = �i��X�y��, IY = �i��Y�y��, IR = �i���b�|
%ang_res = �ѭ�Ϩ��I�����׼ơA�V�j�ѪR�V���A��ĳ�ܤֳ]�w��360
%TR = ��X�Ϥ����i���b�|�A�̫�Ϥ��j�p�|��TR * 2 x TR * 2
%TA = �i����ҥe��

imshow(After_im,[0 255]); %��X�Ϥ�
end