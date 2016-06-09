%% 读入数据
fid = fopen('西瓜数据3.0a.txt', 'r', 'n', 'utf-8');
d = textscan(fid, '%n %f %f %f', 'headerlines', 2);
fclose(fid);
T = [d{2}, d{3}, d{4}];
four=csvread('fourclass.csv');
glass=csvread('glass.csv');
%change k here
k=1;
e1=testKNN(T,k);
e2=testKNN(four,k);
e3=testKNN(glass,k);
%plot(T(1:8,1),T(1:8,2),'.',T(9:17,1),T(9:17,2),'*');
%four=sortrows(four,3);
%plot(four(1:555,1),four(1:555,2),'.',four(556:862,1),four(556:862,2),'*');