function answer = compare_ver2(picName)
I=imread(picName);
imshow(I);
igr=rgb2gray(I);
p = sum(igr)
y = smooth(p, 7)
plot(y)
y = diff(y)
y(1:7) = 0

y_max = max(y)
for n=1:length(y)
    if y(n) == y_max
        x_max = return_x(y,y_max)
    end
end
y_min=min(y)
for n=1:length(y)
    if y(n) == y_min
        x_min = return_x(y,y_min)
    end
end
fileID = fopen('myfile.txt','w');
answer = x_min - x_max

fprintf(fileID,'%d\n',answer);
fclose(fileID);