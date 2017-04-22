function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha
% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
temp0=0;
temp1=0;
for iter = 1:num_iters
    temp0=sum(X*theta-y)/m;
    temp1=sum((X*theta-y).*X(:,2))/m;
    theta(1)=theta(1)-alpha*temp0;
    theta(2)=theta(2)-alpha*temp1;
    J_history(iter) = computeCost(X, y, theta);
end
end