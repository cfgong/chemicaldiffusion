% replace path with your current folder path 
currPath = "C:\Users\cfg9740\Documents\Northwestern\EA3\Demo2\images\";

v = VideoReader(path + "IMG_4242.MOV");
frames = v.NumberOfFrames;
v = VideoReader(path + "IMG_4242.MOV");
% start step end
frameNum = 0;
step = floor(frames / 10); % take 10 frames
for f = 1 : step : frames  
    v.CurrentTime = v.Duration/frames*f;
    currFrame = readFrame(v);
    % write image frame to output file 
    outputFile = frameNum + ".png";
    imwrite(currFrame, fullfile(currPath, outputFile));
    % incremenet frame number
    frameNum = frameNum + 1;
end

% crop all the images 

for frame = 1 : frameNum -1
    I = imread(currPath + frame + ".png");
    % imcrop rect [xmin ymin width height]
    % set crop
    I2 = imcrop(I,[250 525 550 550]);
    outputFile = currPath + "cropped_" +frame + ".png";
    imwrite(I2, outputFile);
end
