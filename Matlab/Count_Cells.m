I = imread('counting test.png');
I3 = imopen(I,strel('disk',15));
I4 = imadjust(I3(:,:,3));
imshow(I4);
level = graythresh(I4);
bw = im2bw(I4,level);
bw = bwareaopen(bw, 50);
imshow(bw)
cc = bwconncomp(bw, 4)
cc.NumObjects
