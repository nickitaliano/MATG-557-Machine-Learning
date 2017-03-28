function classifier = row_classifier(bitmap)
length = size(bitmap);
classifier = zeros(length(3),1);
for index = 1:length(3)
    ones = 0;
    greater_than_ones = 0;
    for x = 1:length(1)
        previous_bit_nonzero = false;
        counter = 0;
        for y = 1:length(2)
            if ~previous_bit_nonzero && bitmap(x,y,index) > 0
                previous_bit_nonzero = true;
                counter = counter + 1;
            end
            if previous_bit_nonzero && bitmap(x,y,index) == 0
                previous_bit_nonzero = false;
            end
        end
        if counter == 1
            ones = ones + 1;
        elseif counter > 1
            greater_than_ones = greater_than_ones + 1;
        end
    end
    if (greater_than_ones + ones) ~= 0
        classifier(index) = ones/(greater_than_ones+ones);
    else
        classifier(index) = -1
    end
end
    
            
            
    