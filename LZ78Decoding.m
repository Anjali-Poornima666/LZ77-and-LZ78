clc
clear
close all
%%%%%%%%%%%%%%%%

encode1 = input('Encoding that is to be decoded: ', 's'); %% Formate of input : (0,1) (0,0) (2,1) (2,0)
encode = [];
encode =strsplit(encode1," ");
phrases={};

decode = "";
count = 1;
for i = 1:length(encode)
    spilt =strsplit(string(encode(i)),",");
    spilt1 = strsplit(spilt(1),"(");
    pos = double(spilt1(2));
    spilt2 = strsplit(spilt(2),")");
    if(pos == 0)
        decode = decode + spilt2(1);
        phrases = [phrases,spilt2(1)];
        
       
    else
    decode = decode + phrases(pos) + spilt2(1);
    phrases = [phrases,phrases(pos) + spilt2(1)];
    
    end
end

disp("Decoding of the encodings: ")
disp(decode)