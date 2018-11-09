currPath = "C:\Users\cfg9740\Documents\Northwestern\EA3\Demo2\images\";
X10 = imread(currPath + 'img0.png');
XX10 = double(X10);
XX10 = XX10/max(XX10(:));

R = XX10(:,:,1);
G = XX10(:,:,2);
B = XX10(:,:,3);

grayImage = 0.2989*R + 0.5870*G +0.1140*B;

imagesc(grayImage)
colormap gray

b10 = grayImage(40,:);
v10 = std(b10,1); 
