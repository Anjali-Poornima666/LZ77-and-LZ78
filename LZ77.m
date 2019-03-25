clc
clear
close all
%%%%%%%%%%%%%%%%

x = input('String to be encoded: ', 's');
w = input('Window size: ');
phrases = {};
encode = [];
str = '';
i=1;
while(i<=strlength(x))
    indicies = [];
    pointer = [];
    if(isempty(phrases))
        phrases = [phrases, x(i)];
        str_encode = '';
        str_encode = strcat("(0,",x(i),")");
        encode = [encode,str_encode];
        i = i+1;
        continue
    end
    k = i-w;
    if (k <1)
        k = 1;
    end
    count = 0;
    for j= i-1 : -1 : k
        count = count+1;
       if(x(i)==x(j))
           indicies = [indicies, j];
           pointer = [pointer , count];
       end
    end
    if(isempty(indicies))
        phrases = [phrases, x(i)];
        str_encode = '';
        str_encode = strcat("(0,",x(i),")");
        encode = [encode,str_encode];       
        i = i+1;
        continue
    end
    str='';
    p=i;
    for e = 1:length(indicies)
           [str1,new] = parsing(x,p,indicies(e));  % Parsing is a function written in another file
           if (strlength(str1)>strlength(str))
                str = str1;
                i=new;
                point = pointer(e);
           end
    end
    str_encode = '';
    str_encode = strcat("(1,",string(point),",",string(strlength(str)),")");
    encode = [encode,str_encode];
    phrases = [phrases, str];
  
end
disp("String Parsing : ")
disp(phrases)

disp('Encoding of the given string:')
disp(encode)