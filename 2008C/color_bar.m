%% main_element
Z=r';n=16
bar(Z);
% �򵥵���ͼ
% ���ͼ������������ֵ�Ĵ�С��ɫ��ÿ���е�
% ֵԽ����ɫԽͻ��
figure
h=bar(Z);
colormap(autumn(64));
ch = get(h,'Children');
fvd = get(ch,'Faces');
fvcd = get(ch,'FaceVertexCData');
[~, izs] = sortrows(Z,1);
for i = 1:11
    row = izs(i);
    fvcd(fvd(row,:)) = i;
end
set(ch,'FaceVertexCData',fvcd)

title('Evaluation of 7 Country''s Health Care System','Fontsize',15)
%text(0,0,'Healthy')text(0,0,'Poor')text(0,0,'China')text(0,0,'USA')
%text(0,0,'Congo')text(0,0,'Germany')text(0,0,'Norway')text(0,0,'Japan')
%% gray_relation
