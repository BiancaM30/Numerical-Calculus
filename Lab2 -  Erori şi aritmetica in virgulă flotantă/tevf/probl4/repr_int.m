function y = repr_int( x )
if isa(x, 'single')
    precision = 32;
else 
    precision = 64;
end

result = '';
byte_rep = typecast(x, 'uint8');
for i = length(byte_rep):-1:1
    byte = byte_rep(i);
    binary = dec2bin(byte);
    bin_str = num2str(binary);
    
    while length(bin_str) < 8
        bin_str = strcat('0', bin_str);
    end
    result = strcat(result, bin_str);
end


if precision == 32
    y = strcat(result(1), '-', result(2:9), '-', result(10:32));
else
    y = strcat(result(1), '-', result(2:12), '-', result(13:64));
end

end

