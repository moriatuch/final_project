function I = my_imread(image, code)
    I=imread(image);
    info=imfinfo(image);
    gray = 'grayscale';
    
    if(code==1)
        if(strcmp(info.ColorType,'truecolor'))
                        I=rgb2gray(I); 
        elseif(strcmp(info.ColorType,gray))
            ;
        elseif(strcmp(info.ColorType,index))
            I=ind2gray(I);
        end  
    I=double(I)./255;    

    elseif(code==2)
        if(strcmp(info.ColorType,'truecolor'))
            return;
        elseif(strcmp(info.ColorType,gray))
            I=cat(3,I,I,I);
        elseif(strcmp(info.ColorType,index))
            I=ind2rgb(I);    
        end;    
    end;    
end
