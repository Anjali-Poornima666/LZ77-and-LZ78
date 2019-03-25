clc
clear
close all
%%%%%%%%%%%%%%%%

x = input('Decoding of the encodings: ', 's'); %%%  %% Formate of input : (0,1) (0,0) (1,1,1) (1,3,3)
encode = [];
encode = strsplit(x," ");
decode = '';
str = '';


for i = 1:length(encode)
    spilt =strsplit(string(encode(i)),",");
    if(length(spilt) == 2)
        spilt1 = strsplit(spilt(1),"(");
        pos = double(spilt1(2));
        spilt2 = strsplit(spilt(2),")");
        if(pos == 0)
            decode = strcat(decode,char(spilt2(1)));
            continue
        end  
    end
    if (length(spilt) == 3)
        windowIndex = double(spilt(2));
        spilt3 = strsplit(spilt(3),")");
        j = strlength(decode)-windowIndex+1;
        for o = j: (j+double(spilt3(1)))-1
           decode = strcat(decode,decode(o));
        end
    end
end

disp("Decoding of the encodings: ")
disp(decode)