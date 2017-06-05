function answer = Count_Cells(picName)
I = imread(picName);
I3 = imopen(I,strel('disk',15));
I4 = imadjust(I3(:,:,3));
imshow(I4);
level = graythresh(I4);
bw = im2bw(I4,level);
bw = bwareaopen(bw, 50);
imshow(bw)
cc = bwconncomp(bw, 4)
answer = cc.NumObjects
fileID = fopen('count_cell_result.txt','w');

fprintf(fileID,'%d\n',answer);
fclose(fileID);