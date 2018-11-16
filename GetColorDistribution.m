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
% times
times = [49.0897, 98.1460, 147.2023, 196.2587, 245.3150, 294.3714, 343.4277, 392.4840, 441.5404, 490.5967];
% least squares line fitting
p = polyfit(times, variances, 1); 
% plotting
fig = plot(times, variances, "o");
title('Row intensity variances');
xlabel('time (s)');
ylabel('variance');

hold on
x1 = linspace(0,500);
y1 = polyval(p,x1);
plot(x1, y1)
% save plot as a png
saveas(fig, currPath + 'variancesplot.png')
hold off

% p2 = polyfit(times, stdevs, 1); 
% 
% % plotting
% fig = plot(times, stdevs, "o");
% title('Row intensity stdevs');
% xlabel('time (s)');
% ylabel('stdev');
% 
% hold on
% x2 = linspace(0,500);
% y2 = polyval(p2,x2);
% plot(x2, y2)

% save plot as a png
saveas(fig, currPath + 'stdevsplot.png')