function [ w ] = return_x( y,v )
for n=1:length(y)
    if y(n)==v
        w=n;
    end
end
end

