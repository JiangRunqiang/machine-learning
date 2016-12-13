%==========================================================================
%
% ��������redundance
% �������ܣ������������������
%          �Ի��������������Է����������ǿ��һ�Ի����з���Ȩ��С�ı�ȥ������ı�������
%          ��������Ļ�������б����µĻ���ļ��Ͼ�����������
%          ���иú�����Ҫ�趨���ϵ����ֵ��
% ��������� original_data��ԭʼ�����������ݡ���������������С�
%           order�Ƿ���Ȩ�ؽϴ�����˳��š�
%           d�Ƿ���Ȩ�ؽϴ�����Ȩ��ֵ��
%           stand_data�Ƿ���Ȩ�ؽϴ����Ĺ�һ���������
%           g_numbertotal��ԭʼ�������������е��ܵĻ��������
% ���������feature_gene����������Ĺ�һ���������
%          feature_order�����������˳��š�
%
%=========================================================================
function [ feature_gene, feature_order ] = redundance ( original_data, order, d , stand_data, g_numbertotal)

%�趨���ϵ����ֵ
correlative_threshold = input (' ���������ϵ����ֵ��');
%�������ϵ������r 
r = abs(  corrcoef ( transpose ( stand_data ) )  );

[row, column ] = size ( stand_data );
%�ȵõ�������򼯺�f��t���ɴ�С���С�
[ a, index] = sort ( d, 'descend');
f = stand_data ( index, : );%��һ�����������
order_temp = order ( index );

fset = f ( 1, : );%��һ������Ĺ�һ���������
orderset = order_temp ( 1 );
p = 1;        %��־fset�Ļ��������

for i = 2 : row
    g (i, :) = f (i, :);
    corr = 0;
    
    for j = 1 : p
        g (j, :) = fset (j, :);
        
        if r (i, j) > correlative_threshold
            corr = 1;
        end
        
        if corr == 0
            p = p + 1;
            fset ( p, : ) = g(i, :);
            orderset ( p ) = i;
        end
        
        p = p - 1;
    end
    
    p = p + 1;
end

feature_order = orderset;

%������������ԭʼ�������
gene_data = original_data ( 2 : g_numbertotal + 1 , :);
[ m , n ] = size ( feature_order );
for i = 1 : n
    feature_gene( i , :) = gene_data ( feature_order ( i ) , : );
end

% end
