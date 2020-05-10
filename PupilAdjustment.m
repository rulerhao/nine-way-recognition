function [PA] = PupilAdjustment(im, PX, PY, PR, IX, IY, IR, ang_res, TR , IA)
%im = �Ϥ�, 
%PX = ����X�y��, PY = ����Y�y��, PR = ���եb�|
%IX = �i��X�y��, IY = �i��Y�y��, IR = �i���b�|
%ang_res = �ѭ�Ϩ��I�����׼ơA�V�j�ѪR�V���A��ĳ�ܤֳ]�w��360
%TR = ��X�Ϥ����i���b�|�A�̫�Ϥ��j�p�|��TR * 2 x TR * 2
%TA = �i����ҥe��

PointX = TR; %��X�Ϥ������X�y��
PointY = TR; %��X�Ϥ������Y�y��

rad_res = round(TR * IA); %�N�i���b�|�M���եb�|����Ҥ��t
%rad_res = �i�����q����

%�N���ɰ�interpolation
norm = Newnormalize(im, [PX PY PR IX IY IR], ang_res, rad_res);
% [����X�y�� ����Y�y�� ����b�| �~��X�y�� �~��Y�y�� �~��b�|] ��L�ݭn����ʪ��u��imread�������ɴN�n

%% �N���ճ����ɤW
for i = rad_res:TR
    for j = 1 : ang_res
        norm(i,j) = 0;
    end
end

%% �}�l�ⰵ�� interpolation �θɤW���ի᪺�������ର��߿�X��
% �@�k���N2 * TR + 1 ���ťչϤ�
% �̷ӨC���I���ߪ����פΥb�|��^�W�谵��interpolation���Ϥ�
for i = 1:(TR * 2)
    for j = 1:(TR * 2)
        if sqrt((i - PointX) ^ 2 + (j - PointY) ^ 2) > TR
            A(i,j) = 0;
        else
            r = round(sqrt((i - PointX) ^ 2 + (j - PointY) ^ 2)); %���I�Z����ߪ��Z��
            if i == PointX && j == PointY %������ߪ����p
                A(i,j) = 0;
            else
                if i - PointX >= 0 && j - PointY < 0                            %��ߥk�W����
                    angle = abs(atan((i - PointX)/(j - PointY))*180/pi);
                elseif i - PointX >= 0 && j - PointY >= 0                       %��ߥk�U����
                    angle = 180 - atan((i - PointX)/(j - PointY))*180/pi;
                elseif i - PointX < 0 && j - PointY >= 0                        %��ߥ��U����
                    angle = 180 + abs(atan((i - PointX)/(j - PointY))*180/pi);
                else                                                            %��ߥ��W����
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