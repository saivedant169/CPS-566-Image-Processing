% Function file: myFilters.m
% Median Filter
function output = myMedianFilter(input, windowSize)
    padSize = floor(windowSize/2);
    paddedInput = padarray(input, [padSize padSize]);
    output = zeros(size(input));
    for i = 1:size(input,1)
        for j = 1:size(input,2)
            window = paddedInput(i+padSize:i+windowSize-1+padSize, j+padSize:j+windowSize-1+padSize);
            sortedValues = sort(window(:));
            output(i,j) = sortedValues(floor(end/2) + 1);
        end
    end
end

% Adaptive Filter
function output = myAdaptiveFilter(input, windowSize)
    padSize = floor(windowSize/2);
    paddedInput = padarray(input, [padSize padSize]);
    output = zeros(size(input));
    for i = 1:size(input,1)
        for j = 1:size(input,2)
            window = double(paddedInput(i+padSize:i+windowSize-1+padSize, j+padSize:j+windowSize-1+padSize));
            meanFilter = mean(window(:));
            varFilter = var(window(:));
            output(i,j) = input(i,j) - (varFilter/(varFilter + meanFilter))*(input(i,j) - meanFilter);
        end
    end
end