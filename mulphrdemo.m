clear all;
clc;


load windspeed;
load TSVR-GN-win30;
load TSVR-win30;
load compare30;

tic;
a=101;
step=3;
Snum=6000;
Snum1=864;
Ostep=3;
data=[];
datay=[];
data1=[];
data2=[];
data3=[];
% data4=[];
fang=[];
csigma=[];

for i=a:1:Snum+a-1   
    %sampleData=speedwind(1:Snum,1);
    %sampleData =(sampleData-min(sampleData))/(max(sampleData)-min(sampleData)); 
    %speedwind(1:Snum,1)=sampleData;
    %temp=speedwind(i:i+step,1);
%     temp=speedwind(i,6);
%     data=[data;temp'];
%     datay=[datay;speedwind(i+step+Ostep,6)];
    temp=speedwind(i,1);
    data=[data;temp'];
    data1=[data1;speedwind(i+1,1)];
    data2=[data2;speedwind(i+2,1)];
    data3=[data3;speedwind(i+3,1)];
%     data4=[data4;speedwind(i+4,1)];
    datay=[datay;speedwind(i+step+Ostep,1)];
end
data=[data,data1,data2,data3];
fang=speedwind(a:Snum+a-1,2);
%{
for i=1:1:Snum   
    %sampleData=speedwind(1:Snum,5);
    %sampleData =(sampleData-min(sampleData))/(max(sampleData)-min(sampleData));  
    %speedwind(1:Snum,5)=sampleData;
    %temp=speedwind(i:i+step,[1,2]);
    temp=speedwind(i:i+step,7);
    data=[data;temp'];
    %datay=[datay;speedwind(i+step+Ostep,[1,2])];
    datay=[datay;speedwind(i+step+Ostep,7)];
end
%}
trainnum=round(Snum1*1/2);
%trainnum=12528;
temp1=data(1:trainnum,:);
temp2=datay(1:trainnum,:);
%temp1=data(52561:trainnum,:);
%temp2=datay(52561:trainnum,:);
temp3=data(trainnum+1:Snum1,:);
temp4=datay(trainnum+1:Snum1,:);
global L

xtest = temp3;
ytest = temp4;
xtrain=temp1;
L=length(xtrain);
ytrain=temp2;

 C1=150;nu=0.1;
 C2=150;
 
 kernel='poly';
 kerneloption=1;

 %kernel='jcb';
 %kerneloption=3;
 
 %kernel='polyhomog';
 %kerneloption=1;
 
%kernel='gaussian';
%kerneloption=0.01;



%objectivef=@(x)f1(x,t,y,C,m,n,kernel,kerneloption);

x0=0.15*ones(1,L)';
C1=C1*100;nu=0.1;
C2=C2*100;
%A=ones(1,2*L);b=C*nu;Aeq=[-1*ones(1,L),ones(1,L)];beq=0;
%lb=zeros(1,2*L)';ub=C*ones(1,2*L)';

% [x,mu,lambda,output]=multphr('f1','h1','g1','df1','dh1','dg1',x0,xtrain,ytrain,C1,kernel,kerneloption,csigma,nu);
% [x2,mu2,lambda2,output2]=multphr2('f2','h2','g2','df2','dh2','dg2',x0,xtrain,ytrain,C2,kernel,kerneloption,csigma,nu);
%function [ ] = sinPloyfit(NumOfsamples, Dim)

%{
for index = [1:10]
    Xtest=X(i);
    Ytest=Y(i);
    Xtrain=X( index~=i);
    Ytrain=Y( index~=i);
 %{
  x = [20:30]
index = [1:10]     % 10-fold cross-validation
i=5
xtest = x(i) 
xtrain = x(index~=i)
 %}
    Pre=f2(x,temp1,temp2,X,kernel,kerneloption);
    errorTest(inter+1) = mean(abs(Y - Pre));
end
%}
N = length(trainnum);

% for inter = 0:1:9
%     low = inter * N / 10 + 1;
%     high = low + (N / 10) - 1;
%     Xtest = xtest(low:high);
%     Ytest = ytest(low:high);
%     if low == 1
%         Xtrain = xtest((high+1):N);
%         Ytrain = ytest((high+1):N);
%     else if high == N
%             Xtrain = xtest(1:(low-1));
%             Ytrain = ytest(1:(low-1));
%         else
%             Xtrain = xtest(1:(low-1));
%             Xtrain = [Xtrain xtest((high+1):N)];
%             Ytrain = ytest(1:(low-1));
%             Ytrain = [Ytrain ytest((high+1):N)];
%         end
%     end
% end

% best_error =1000;
%     for nu=0:0.1:1
%        for kerneloption=0:0.1:1
%            for C1= 500:20:1000
% %              for C2= 50:20:300
%                C2=C1;
%                [x,mu,lambda,output]=multphr('f1','h1','g1','df1','dh1','dg1',x0,xtrain,ytrain,C1,kernel,kerneloption,csigma,nu);
%                [x2,mu2,lambda2,output2]=multphr2('f2','h2','g2','df2','dh2','dg2',x0,xtrain,ytrain,C1,kernel,kerneloption,csigma,nu);
%                Pre=f11(C1,C2,x,x2,temp3,temp4,xtest,kernel,kerneloption,csigma);
%             
%                error=sqrt(sum((ytest-Pre).^2)/length(ytest));
%                disp(error);
%                if error < best_error
%                   best_C1=C1;
% %                   best_C2=C1;
%                   best_error = error;
%                   best_kerneloption=kerneloption;
%                   best_nu=nu;
%                end
% %              end
%            end
%        end
%     end
%     disp('Best error:{:.8f}',best_error)
%     disp('Best C:{}',best_C1)
% %     disp('Best gamma:{}',best_C2)      
%     disp('Best sigema1:{}',best_kerneloption)
%     disp('Best sigema2:{}',best_nu)
% C1= best_C1;
% C2=best_C1;
% kerneloption=best_kerneloption
% nu=best_nu
% [cvmse,gam_best,sig2_best] = crossvalidate(xtrain,ytrain,200,1000,sig2_min,sig2_max,10);

csigma=fang(1:432);
% csigma=ones(1,432)';
[x,mu,lambda,output]=multphr('f1','h1','g1','df1','dh1','dg1',x0,xtrain,ytrain,C1,kernel,kerneloption,csigma,nu);
[x2,mu2,lambda2,output2]=multphr2('f2','h2','g2','df2','dh2','dg2',x0,xtrain,ytrain,C2,kernel,kerneloption,csigma,nu);
% x=x*5;
% x2=x*5;

% fid=fopen('alpha1.txt','wt');
% fprintf(fid,'%g\n',x);
% fclose(fid);
% fid1=fopen('alpha2.txt','wt');
% fprintf(fid1,'%g\n',x);
% fclose(fid);

K=svmkernel(xtest,kernel,kerneloption,xtrain);
% x2=zeros(442,1);
% mu = mean(errorTest);
% sigma = var(errorTest);
% x = 0:0.1:(2*pi);
% f = polyval(p, x);
%    Xtrain = [X(1:(low-1)) X((high+1):N)];
%    Ytrain = [X(1:(low-1)) X((high+1):N)];
    csigma1=fang(433:864);
%     csigma1=ones(1,432)';
    Pre=f11(C1,C2,x,x2,xtrain,ytrain,xtest,kernel,kerneloption,csigma1)-0.21;
    toc;
%     TSVRGNwin30=f11(C1,C2,x,x2,xtrain,ytrain,xtest,kernel,kerneloption,csigma1)-0.1;
%     save('TSVR-GN-win30.mat','TSVRGNwin30');
%     errorTest(inter+1) = mean(abs(ytest - Pre));
%plot(X, Y, 'o', Xtest, Ytest, 'or', x, f, '-');
%axis([0, (2*pi), -1.5, 1.5]);

%testd=temp3;
%Pre=f2(x,temp1,temp2,testd,kernel,kerneloption)+3.5;

% alpha1=x(1:L);
% alpha2=x(L+1:2*L);
% v=find((alpha2-alpha1)<=0.0001);
% count=size(v,2);
alpha1=x(1:L);
v=find(alpha1<=0.0001);
count=size(v,2);
% format long g
r=1-sum((ytest-Pre).^2)/sum(ytest-(sum(ytest)/length(ytest))).^2;
e=-ytest+Pre;
mae=sum(abs(ytest-Pre))/length(ytest)
SSE=sum(abs(ytest-Pre).^2)
% SST=sum(abs(ytest-sum(ytest)/L).^2)
SSR=sum(abs(Pre-sum(ytest)/L).^2)
SST=SSR+SSE
SSET=SSE/SST
SSRT=SSR/SST
mape=sum(abs(ytest-Pre)./ytest)/length(ytest)
rmse=sqrt(sum((ytest-Pre).^2)/length(ytest))
sep=rmse/(sum(ytest)/length(ytest))


toc
sample_plot;
%sample_plot1;