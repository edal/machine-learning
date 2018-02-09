function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.03;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
values = [ 0.01,0.03,0.1,0.3,1,3,10,30 ];

num_predictions = length(values)^2;
predictions_arr = zeros(num_predictions, 3);
 
cur_pred=1; 
for c = values,
  for s = values,
    %fprintf(['(C:%d-sigma:%d) '], c, s);
    model= svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s)); 

    predictions = svmPredict(model, Xval);
    predictions_arr(cur_pred, 1) = mean(double(predictions ~= yval));
    predictions_arr(cur_pred, 2) = c;
    predictions_arr(cur_pred, 3) = s;
    cur_pred++;
   end 
end;

disp(predictions_arr);
%save predictions_arr.mat predictions_arr;

[minval, row] = min(min(predictions_arr(:,1),[],2))
C = predictions_arr(row, 2);
sigma = predictions_arr(row, 3);
fprintf(['Best prediction is %d with C=%f and sigma=%f'], predictions_arr(row, 1), C, sigma);


% =========================================================================

end
