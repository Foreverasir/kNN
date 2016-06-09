function [ errorpercent ] = testKNN( data,k )
%将kNN应用于数据集，返回错误率
[datarow,datacol]=size(data);
ep=zeros(5,1);
indices=crossvalind('Kfold',data(1:datarow,datacol),5);
for i=1:5
    error=0;
    test = (indices == i);%获得test集元素在数据集中对应的单元编号
    train = ~test;%train集元素的编号为非test元素的编号
    trainData=data(train,:);%从数据集中划分出train样本的数据
    trainLabel=trainData(:,datacol);%获得样本集的实际分类情况
    testData=data(test,:);%test样本集
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