function [ resultlabel ] = kNN( i,data,labels,k )
datarow=size(data,1);
deltaM=repmat(i,[datarow,1])-data;
distanceM=sqrt(sum(deltaM.^2,2));
[order,index]=sort(distanceM,'ascend');
len=min(k,length(order));%ȡk�������ܳ��ĸ�С��
%mode���س���Ƶ����ߵı�ǩ
resultlabel=mode(labels(index(1:len)));
end

