path = "C:\Users\cfg9740\Documents\Northwestern\EA3\Demo2\";
v = VideoReader(path + "IMG_4242.MOV");
NumberOfFrames = v.CurrentTime;
% 14247

for k = 1 : 20  %fill in the appropriate number
  this_frame = readFrame(v);
  thisfig = figure();
  thisax = axes('Parent', thisfig);
  image(this_frame, 'Parent', thisax);
  title(thisax, sprintf('Frame #%d', k));
end