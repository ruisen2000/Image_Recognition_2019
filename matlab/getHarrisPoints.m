function [points] = getHarrisPoints(I, alpha, k)
% Returns [row, col] of Harris points
    I = rgb2gray(I);
    h_sobel_y = fspecial('sobel'); %vertical gradient
    h_sobel_x = h_sobel_y';
    imgx = imfilter(I, h_sobel_x, 'conv');
    imgy = imfilter(I, h_sobel_y, 'conv');
    
    [r,c] = size(imgx);
    gradx_sqr = imgx.^2;
    grady_sqr = imgy.^2;
    grad_xy = imgx.*imgy;
    
    window = ones(5,5);
    
    gradx_sqr_sum = conv2(gradx_sqr, window);
    grady_sqr_sum = conv2(grady_sqr, window);
    grad_xy_sum = conv2(grad_xy, window);
    
    [r2, c2] = size(gradx_sqr_sum);
    ncol = (r2-r)/2;  % number of cols to remove result of conv on each side
    nrow = (c2-c)/2;  % number of rows to remove from result of conv on each side
    
    % sum each M matrix element around the window
    gradx_sqr_sum = gradx_sqr_sum(nrow+1:r2-nrow, ncol+1:c2-ncol); 
    grady_sqr_sum = grady_sqr_sum(nrow+1:r2-nrow, ncol+1:c2-ncol); 
    grad_xy_sum = grad_xy_sum(nrow+1:r2-nrow, ncol+1:c2-ncol); 
    
    % convert to vector
    gradx_sqr_sum = gradx_sqr_sum';
    grady_sqr_sum = grady_sqr_sum';
    grad_xy_sum = grad_xy_sum';    
    gradx_sqr_sum = gradx_sqr_sum(:);
    grady_sqr_sum = grady_sqr_sum(:);
    grad_xy_sum = grad_xy_sum(:);
    
    % Each column of H is the H matrix for a point
    H = [gradx_sqr_sum';
        grad_xy_sum';
        grad_xy_sum'; 
        grady_sqr_sum'];
    
   
    R = zeros(1,length(grad_xy_sum));
    
    for i = 1:length(grad_xy_sum)
        Mi = vec2mat(H(:,i),2);
        R(i) = det(Mi) - k*trace(Mi)^2;
    end

    R = vec2mat(R, c);
    
    [B,I] = maxk(R(:), alpha);
    [row, col] = ind2sub(size(imgx), I);
    
    points = [row, col];
    
end