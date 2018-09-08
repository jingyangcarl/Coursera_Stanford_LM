function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    % Carl: 
    theta_0 = theta(1) - alpha*sum(X*theta-y)/length(X);
    theta_1 = theta(2) - alpha*(X*theta-y)'*(X(:,2))/length(X);
    theta(1) = theta_0;
    theta(2) = theta_1;    
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
J_history
% Carl: visualiza the J_history using imagesc()
##figure();
##imagesc(J_history);
##colorbar;
##colormap gray;
% Carl: visualize the J_history using bar()
figure(); clf;
J_history_norm = (J_history-min(J_history))/(max(J_history)-min(J_history))*256;
bar(J_history_norm);
end
