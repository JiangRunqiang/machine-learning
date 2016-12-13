%==============================
%
% ��������sharp_jump
% �������ܣ�����״ͼ�Ļ������ͻ����Ӧ�ķ���Ȩ��ֵ��
% ���������area_midpoint�Ǻ���������е㡣
%          high�Ǹ߶ȣ��������еĻ��������
%          fenshu��[a,b]����ȷֵķ�����fenshuȡ�������������ĸ�����r1,r2���г���Ĺ�ʽ��
%          wide�������ȡ�
% ���������alfa����ͼ��ͻ�����Ӧ�ķ���Ȩ��ֵ��
%
%=====================================================================
function [alfa] = sharp_jump ( area_midpoint, high, fenshu, wide )
different = zeros ( 1, fenshu - 1 );

for i = 1 : fenshu - 1
    different ( i ) = abs ( high ( i ) - high ( i + 1 ) );
end

[B, IX] = sort( different );
m = IX ( fenshu - 1 );
alfa = area_midpoint ( m ) + wide / 2;
% end
