function submit()
  addpath('/Users/songwang/Documents/MATLAB/Machine_learning_exercises/machine-learning-ex7/ex7/lib');

  conf.assignmentSlug = 'k-means-clustering-and-pca';
  conf.itemName = 'K-Means Clustering and PCA';
  conf.partArrays = { ...
    { ...
      '1', ...
      { 'findClosestCentroids.m' }, ...
      'Find Closest Centroids (k-Means)', ...
    }, ...
    { ...
      '2', ...
      { 'computeCentroids.m' }, ...
      'Compute Centroid Means (k-Means)', ...
    }, ...
    { ...
      '3', ...
      { 'pca.m' }, ...
      'PCA', ...
    }, ...
    { ...
      '4', ...
      { 'projectData.m' }, ...
      'Project Data (PCA)', ...
    }, ...
    { ...
      '5', ...
      { 'recoverData.m' }, ...
      'Recover Data (PCA)', ...
    }, ...
  };
  conf.output = @output;

  submitWithConfiguration(conf);
end

function out = output(partId, auxstring)
  % Random Test Cases
  X = reshape(sin(1:165), 15, 11);
  Z = reshape(cos(1:121), 11, 11);
  C = Z(1:5, :);
  idx = (1 + mod(1:15, 3))';
  if partId == '1'
    idx = findClosestCentroids(X, C);
    out = sprintf('%0.5f ', idx(:));
  elseif partId == '2'
    centroids = computeCentroids(X, idx, 3);
    out = sprintf('%0.5f ', centroids(:));
  elseif partId == '3'
    [U, S] = pca(X);
    out = sprintf('%0.5f ', abs([U(:); S(:)]));
  elseif partId == '4'
    X_proj = projectData(X, Z, 5);
    out = sprintf('%0.5f ', X_proj(:));
  elseif partId == '5'
    X_rec = recoverData(X(:,1:5), Z, 5);
    out = sprintf('%0.5f ', X_rec(:));
  end 
end
