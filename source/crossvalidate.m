function [cvmse,gam_best,sig2_best] = crossvalidate(Xtrain,Ytrain,gam_min,gam_max,sig2_min,sig2_max,k)
number = size(Xtrain,1);
[X,Y] = meshgrid(gam_min:0.1:gam_max,sig2_min:0.05:sig2_max);
[m,n] = size(X);
cv = zeros(m,n);
eps = 10^(-4);
gam_best = 0;
sig2_best = 0;
mse_sum = 0;
cvmse = Inf;
step = floor(number/k);
for i = 1:m
    for j = 1:n
        gam = 10^X(i,j);
        sig2 = 10^Y(i,j);
        for t = 1:k
            if t~=k
                startpoint = (t-1)*step +1;
                endpoint = t*step;
            else
                startpoint = (t-1)*step+1;
                endpoint = number;
            end
            validate_in = Xtrain(startpoint:endpoint,:);
            validate_out = Ytrain(startpoint:endpoint,:);
            train_in = Xtrain;
            train_in(startpoint:endpoint,:) = '';
            train_out = Ytrain;
            train_out(startpoint:endpoint,:) = '';
%
            [out,mse] = lssvm_regression(train_in,train_out,gam,sig2,validate_in,validate_out);
%[~,mse] = lssvm_regression(train_in,train_out,gam,sig2,validate_in,validate_out);
        end
        mse_sum = sum(mse);
        cv(i,j) = mse_sum/k;
        if cv(i,j) < cvmse
        cvmse = cv(i,j);
        gam_best = gam;
        sig2_best = sig2;
        end

        if abs(cv(i,j)-cvmse)<=eps && gam_best>gam
        cvmse = cv(i,j);
        gam_best = gam;
        sig2_best = sig2;
        end
    end
end