% this m-file to evaluate the repeating element in y array, to find the 
% structure of array 
a=zeros(10,1);
b=[1:10];
for i=1:length(b)
    posi=find(p==b(i));
    a(i)=length(posi);
end
c=zeros(10,1);
for i=1:length(c)
    c(i)=p(500*i);
end
%%
X = [ones(m, 1) X];
h_theta=sigmoid(X*all_theta');
[p,posi]=max(h_theta');
%%
m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
X = [ones(m, 1) X];
h_theta=sigmoid(X*all_theta');
[p,posi]=max(h_theta');
for i=1:length(p)
    if p(i)>=0.5
        p(i)=posi(i);
    else
        p(i)=0;
    end
end
p=p';
%%
m = size(X, 1);
num_labels = size(Theta2, 1);
X=[ones(m,1),X]; 
p = zeros(size(X, 1), 1);
state2=sigmoid(X*Theta1');
state2=[ones(m,1),state2];
hp=sigmoid(state2*Theta2');
hp=sigmoid(state2*Theta2');
[p,posi]=max(hp,[],2);
for i=1:length(p)
    p(i)=posi(i);
end
