% replace with your own current path
currPath = "C:\Users\cfg9740\Documents\Northwestern\EA3\Demo2\images\";
img = "cropped_";
% iterate over 10 cropped images
imgCount = 10;
stdevs = zeros(1, imgCount);
variances = zeros(1, imgCount);
for i = 1 : imgCount
    image = imread(currPath + img + i + '.png');
    image = double(image);
    % convert to double and normalize
    image = image/max(image(:)); 

    R = image(:,:,1);
    G = image(:,:,2);
    B = image(:,:,3);

    grayImage = 0.2989*R + 0.5870*G +0.1140*B;

    % display gray image
    % imagesc(grayImage)
    % colormap gray
    
    row = grayImage(250,:);
    % stdev is the square root of variance
    stdev = std(row, 1);
    stdevs(i) = stdev;
    variances(i) = stdev.^2;
end

% plotting
fig = plot(variances);
title('Row intensity variances');
xlabel('frame');
ylabel('variance');

% save plot as a png
saveas(fig, currPath + 'variancesplot.png')

% plotting
fig = plot(stdevs);
title('Row intensity stdevs');
xlabel('frame');
ylabel('stdev');

% save plot as a png
saveas(fig, currPath + 'stdevsplot.png')