%=============================================================

% ��������hight
% �������ܣ���ֱ��ͼ�ĸߣ������ܶ�)��
% ���������x�Ǻ�������䡣   
%          r��Ҫ����ͼ�����ݡ������ķ�����Ϣָ�������ķ���Ȩ�صȡ�
%          fenshu�Ǻ�������������
%          number�ǻ������������еĻ��������
% ���������y�Ƿֵ�ÿ������Ļ������


%==============================
function [y] = hight (x, r, fenshu, number )
y = zeros (1, fenshu);
for i = 1 : number
    for j = 1 : fenshu
        if j ~= fenshu
            if r ( i ) >= x ( j ) & r ( i ) < x ( j + 1 )
                y ( j ) = y ( j ) + 1;
            end
        else
            if r ( i ) >= x ( j ) & r ( i ) <= x ( j + 1 )
                y ( j ) = y ( j ) + 1;
            end
        end
    end
end
%end of function y=glmd(x,r,fenshu,number,B);%ֱ��ͼ�ĸ�(�����ܶ�)
