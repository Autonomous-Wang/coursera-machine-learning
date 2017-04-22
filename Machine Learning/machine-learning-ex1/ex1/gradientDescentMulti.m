function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    temp0=0;
    temp1=0;
    temp2=0;
for iter = 1:num_iters
    temp0=sum(X*theta-y)/m;
    temp1=sum((X*theta-y).*X(:,2))/m;
    temp2=sum((X*theta-y).*X(:,3))/m
    theta(1)=theta(1)-alpha*temp0;
    theta(2)=theta(2)-alpha*temp1;
    theta(3)=theta(3)-alpha*temp2;
    J_history(iter) = computeCost(X, y, theta);
end











    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end


