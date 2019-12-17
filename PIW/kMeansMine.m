function [ cluster, centroids ] = kMeansMine( k, P )
sizes = size(P);

%Losowe cendroidy
randomIndeks = randperm(sizes(2),k);
centroids = P(:,randomIndeks);

cluster = zeros(1,sizes(2));

clusterPrev = cluster;
i=0;
work = true;

while work
    % for each data point 
    for x = 1:sizes(2)
        % init distance array dist
        dist = zeros(1,k);
        % compute distance to each centroid
        for y=1:k
            dist(y) = norm(P(:,x)-centroids(:,y));
        end
        % find index of closest centroid (= find the cluster)
        [~, clusterP] = min(dist);
        cluster(x) = clusterP;
    end
    
    % Recompute centroids using current cluster memberships:
        
    % init centroid array centr
    centroids = zeros(sizes(1),k);
    % for every cluster compute new centroid
    for x = 1:k
        % find the points in cluster number idxC and compute row-wise mean
        centroids(:,x) = mean(P(:,cluster==x),2);
    end
    
    % Checking for stopping criterion: Clusters do not chnage anymore
    if clusterPrev==cluster
        work = false;
    end
    % update previous cluster clusterPrev
    clusterPrev = cluster;
    
    i = i + 1;
    
end

% for reference: print number of iterations
fprintf('Kmeans used %d iterations of changing centroids.\n',i);
end