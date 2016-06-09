function [ errorpercent ] = testKNN( data,k )
%��kNNӦ�������ݼ������ش�����
[datarow,datacol]=size(data);
ep=zeros(5,1);
indices=crossvalind('Kfold',data(1:datarow,datacol),5);
for i=1:5
    error=0;
    test = (indices == i);%���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
    train = ~test;%train��Ԫ�صı��Ϊ��testԪ�صı��
    trainData=data(train,:);%�����ݼ��л��ֳ�train����������
    trainLabel=trainData(:,datacol);%�����������ʵ�ʷ������
    testData=data(test,:);%test������
    testLabel=testData(:,datacol);
    n=size(testData,1);
    for j=1:n
    result=kNN(testData(j,1:datacol-1),trainData(:,1:datacol-1),trainLabel(:,:),k);
    if(result~=testLabel(j))
        error=error+1;
    end
    end
    ep(i,1)=error/n;
end
errorpercent=mean(ep);
end