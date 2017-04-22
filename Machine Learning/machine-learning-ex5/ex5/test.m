
%VALIDATIONCURVE Generate the train and validation errors needed to
%plot a validation curve that we can use to select lambda
%   [lambda_vec, error_train, error_val] = ...
%       VALIDATIONCURVE(X, y, Xval, yval) returns the train
%       and validation errors (in error_train, error_val)
%       for different values of lambda. You are given the training set (X,
%       y) and validation set (Xval, yval).

Xval=X_poly_val;
X=X_poly;
y=y;

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the validation errors in error_val. The 
%               vector lambda_vec contains the different lambda parameters 
%               to use for each calculation of the errors, i.e, 
%               error_train(i), and error_val(i) should give 
%               you the errors obtained after training with 
%               lambda = lambda_vec(i)
%
% Note: You can loop over lambda_vec with the following:
n=size(Xval,1);
m=size(X,1);
a=zeros(2,12);
b=zeros(2,12);
for i = 1:length(lambda_vec)
    lambda = lambda_vec(i);
    [theta] = trainLinearReg([ones(m, 1),X], y, lambda);
    error_train(i)=linearRegCostFunction([ones(m, 1) X], y, theta, lambda);
    error_val(i)=linearRegCostFunction([ones(n, 1) Xval], yval, theta, lambda)
end
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end
fprintf('Program paused. Press enter to continue.\n');
%%
clear
clc
a=zeros(2,12);
b=zeros(2,12);
lambda = 0;
load ('ex5data1.mat');
m=size(X,1);
X=[ones(m, 1) X];
Xval=[ones(size(Xval, 1), 1) Xval];
% Number of training examples
m = size(X, 1);
% You need to return these values correctly
error_train1 = zeros(m, 1);
error_val1  = zeros(m, 1);
for i=1:m
    theta = trainLinearReg([X(1:i,:)], y(1:i), lambda);
    a(:,i)=theta;
    error_train(i)=sum((X(1:i,:)*theta-y(1:i)).^2)/2/m;
    error_val(i)=sum((Xval*theta-yval).^2)/2/m;
end
for i=1:m
    theta = trainLinearReg([X(1:i,:)], y(1:i), lambda);
    b(:,i)=theta;
    error_train1(i)=linearRegCostFunction(X(1:i,:), y(1:i), theta, lambda);
    error_val1(i)=linearRegCostFunction(Xval, yval, theta, lambda);
end

% compare the two method
inde=[1:m];
plot(inde,error_train'-error_train1)
hold on
plot(inde,error_val'-error_val1)


