function [ POP ] = initialize_pop(n,c,bu,bd)
%��ʼ����Ⱥ
% ��ڲ�����n-��Ⱥ������c-����������bu-�����Ͻ磬bd-�����½�
% ���ڲ�����POP-��Ⱥ����
%POP1=rand(n,c).*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
%POP2=zeros(n,c);
%POP=[POP1,POP2];
%x=0:1/(n-1):1;
%POP=(x')*(bu-bd)+ones(n,1)*bd;
%POP=[x',rand(n,c-1)].*(ones(n,1)*(bu-bd))+ones(n,1)*bd��
POP=rand(n,c).*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
%POP=[ones(n,1)*rand(1,c-1),rand(n,1)].*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
%POP=[rand(n,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,c-7)].*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
%POP=[rand(n,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,c-3)].*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
%POP=[ones(n,1)*rand(1,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,1),rand(n,1),ones(n,1)*rand(1,c-5)].*(ones(n,1)*(bu-bd))+ones(n,1)*bd;
end