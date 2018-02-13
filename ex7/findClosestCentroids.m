function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = size(X,1);
for x = 1:m
  %Iteraring examples
  closestDistance = 1000;
  for c = 1:K 
    %Iteraring centroids
    thisDistance = (X(x,:)-centroids(c,:)) * (X(x,:)-centroids(c,:))';
    %fprintf('Distance %d-%d:%f\n', x, c, thisDistance);
    if thisDistance < closestDistance 
      closestDistance = thisDistance;
      idx(x) = c;
    end
  end
  %fprintf('Closest centroid to %d is %d with :%f\n', x, idx(x), closestDistance);
end
  

% =============================================================

end

