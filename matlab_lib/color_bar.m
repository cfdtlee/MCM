% ��ɫ��״ͼ
%% �õ�������
n = 13;
Z = rand(n,1)-0.5;
%% Ĭ��ͼƬ
bar(Z);
%% �򵥵���ͼ
% ���ͼ������������ֵ�Ĵ�С��ɫ��ÿ���е�
% ֵԽ����ɫԽͻ��
figure
h=bar(Z);
colormap(summer(n));
ch = get(h,'Children');
fvd = get(ch,'Faces');
fvcd = get(ch,'FaceVertexCData');
[~, izs] = sortrows(Z,1);
for i = 1:n
    row = izs(i);
    fvcd(fvd(row,:)) = i;
end
set(ch,'FaceVertexCData',fvcd)
%% ����Ư����ͼƬ
% ͼƬ���Խ���ķ�ʽ��ɫ��Ч���ǳ�����
figure
h=bar(Z);
ch = get(h,'Children');
fvd = get(ch,'Faces');
fvcd = get(ch,'FaceVertexCData');
[zs, izs] = sortrows(Z,1);
k = 128; % ׼������128 *3 �е�colormap
colormap(autumn(k)); % ���������һ��128 * 3�ľ��󣬷ֱ����[R G B]��ֵ
% ��������
whos ch fvd fvcd zs izs
%
%   Name       Size            Bytes  Class     Attributes
%
%   ch         1x1                 8  double
%   fvcd      66x1               528  double
%   fvd       13x4               416  double
%   izs       13x1               104  double
%   zs        13x1               104  double
%
shading interp % Needed to graduate colors
for i = 1:n
color = floor(k*i/n); % ������ȡ���������color��colormap����
row = izs(i); % Look up actual row # in data
fvcd(fvd(row,1)) = 1; % Color base vertices 1st index
fvcd(fvd(row,4)) = 1;
fvcd(fvd(row,2)) = color; % Assign top vertices color
fvcd(fvd(row,3)) = color;
end
set(ch,'FaceVertexCData', fvcd); % Apply the vertex coloring
set(ch,'EdgeColor','k')