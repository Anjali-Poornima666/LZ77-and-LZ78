function [String,new_i] = parsing(x,i,j)
str='';
while(x(j)==x(i))
    str = strcat(str,x(i));
    i = i+1;
    j = j+1;
    if(i>strlength(x) || j>strlength(x)) 
        break
    end
end
String = str;
new_i= i;

