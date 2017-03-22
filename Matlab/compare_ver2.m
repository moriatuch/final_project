I = imread('one-exp.png');
imshow(I)
compare
y_max=max(y)
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
x_min - x_max