function [x,mu,lambda,output]=multphr2(f,hf,gf,df,dhf,dgf,x0,t,y,C,kernel,kerneloption,csigma,nu)
maxk=10;  
sigma=2.0;   
eta=2.0;  theta=0.8;  
k=0; ink=0;   
epsilon=1e-5;  
x=x0;  he=feval(hf,x,t); gi=feval(gf,x,t,csigma,C,nu);
n=length(x); l=length(he); m=length(gi);
mu=0.1*ones(l,1);  lambda=0.1*ones(m,1);
btak=10;  btaold=10; 
while(btak>epsilon & k<maxk)
    %function [alpha,val,k]=NM(fun,gfun,alpha0,varargin)
    [x,v,ik]=NM('mpsi2','dmpsi2',x0,f,hf,gf,df,dhf,dgf,mu,lambda,sigma,t,y,C,kernel,kerneloption,csigma,nu);
    ink=ink+ik;
    he=feval(hf,x,t); gi=feval(gf,x,t,csigma,C,nu);
    btak=0.0;
    for (i=1:l), btak=btak+he(i)^2;   end
    for i=1:m
        temp=min(gi(i),lambda(i)/sigma);
        btak=btak+temp^2;
    end
    btak=sqrt(btak);   
    if btak>epsilon
        if(k>=2 & btak > theta*btaold)
            sigma=eta*sigma;
        end
        for (i=1:l),  mu(i)=mu(i)-sigma*he(i);  end
        for (i=1:m)
            lambda(i)=max(0.0,lambda(i)-sigma*gi(i));
        end
    end
    k=k+1;
    btaold=btak;
    x0=x;
end
f=feval(f,x,t,y,C,kernel,kerneloption,csigma);
output.fval=f;
output.iter=k;
output.inner_iter=ink;
output.bta=btak;