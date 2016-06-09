function [ resultlabel ] = kNN( i,data,labels,k )
datarow=size(data,1);
deltaM=repmat(i,[datarow,1])-data;
distanceM=sqrt(sum(deltaM.^2,2));
[order,index]=sort(distanceM,'ascend');
len=min(k,length(order));%取k和数据总长的更小者
%mode返回出现频率最高的标签
resultlabel=mode(labels(index(1:len)));
end

