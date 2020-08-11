function [ W2,B2,Centers,Spreads ] = RBF( SamIn,SamOut,Nc)
SamIn=SamIn';
SamOut=SamOut';
SamNum = size(SamIn,2); % ��������
InDim = size(SamIn,1); % ��������ά��
ClusterNum = Nc; % ���ڵ�����������������
Overlap = 1.0; % ���ڵ��ص�ϵ��

% ����Ŀ�꺯����������������
A=randperm(SamNum);
Centers = SamIn(:,A(1:ClusterNum));

ik=0;
while 1,
NumberInClusters = zeros(ClusterNum,1); % �����е�����������ʼ��Ϊ��
IndexInClusters = zeros(ClusterNum,SamNum); % ��������������������

% ����С����ԭ��������������з���
for i = 1:SamNum
AllDistance = dist(Centers',SamIn(:,i));
[MinDist,Pos] = min(AllDistance);
NumberInClusters(Pos) = NumberInClusters(Pos) + 1;
IndexInClusters(Pos,NumberInClusters(Pos)) = i;
end
% ����ɵľ�������
OldCenters = Centers;

for i = 1:ClusterNum
    if NumberInClusters(i)~=0
        Index = IndexInClusters(i,1:NumberInClusters(i));
        Centers(:,i) = mean(SamIn(:,Index),2);
    else
        A=randperm(SamNum);
        Centers(:,i)=SamIn(:,A(1));
    end
end
% �ж��¾ɾ��������Ƿ�һ�£������������
EqualNum = sum(sum(Centers==OldCenters));
if EqualNum == InDim*ClusterNum|ik>=50,
break,
end
ik=ik+1;
end


% ��������ڵ����չ��������ȣ�
AllDistances = dist(Centers',Centers); % �������ڵ��������ļ�ľ��루����
Maximum = max(max(AllDistances)); % �ҳ���������һ������
for i = 1:ClusterNum % ���Խ����ϵ�0 �滻Ϊ�ϴ��ֵ
AllDistances(i,i) = Maximum+1;
end
I=find(AllDistances==0);
AllDistances(I)=0.000001;
Spreads = Overlap*min(AllDistances)'; % �����ڵ�����С������Ϊ��չ����


% ��������ڵ�����Ȩֵ
Distance = dist(Centers',SamIn); % �����������������������ĵľ���
SpreadsMat = repmat(Spreads,1,SamNum);
HiddenUnitOut = radbas(Distance./SpreadsMat); % �������ڵ������
HiddenUnitOutEx = [HiddenUnitOut' ones(SamNum,1)]'; % ����ƫ��
W2Ex = SamOut*pinv(HiddenUnitOutEx); % ��������Ȩֵ
W2 = W2Ex(:,1:ClusterNum); % ���Ȩֵ
B2 = W2Ex(:,ClusterNum+1); % ƫ��

% ����
% TestDistance = dist(Centers',TestSamIn);
% TestSpreadsMat = repmat(Spreads,1,TestSamNum);
% TestHiddenUnitOut = radbas(TestDistance./TestSpreadsMat);
% TestNNOut = W2*TestHiddenUnitOut+B2;

end

