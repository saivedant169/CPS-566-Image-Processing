function output = Problem1(input1, input2)
    L = 256;
    bins = [0:L-1];
    
    % Compute histograms
    hist1 = hist(reshape(input1, 1, []), bins);
    hist2 = hist(reshape(input2, 1, []), bins);
    
    % Compute cumulative histograms
    cum_hist1 = round(hist1 * triu(ones(L)) / numel(input1));
    cum_hist2 = round(hist2 * triu(ones(L)) / numel(input2));
    
    % Create mapping
    map = zeros(L, 1);
    for i = 1:L
        [~, ind] = min(abs(cum_hist1(i) - cum_hist2));
        map(i) = ind-1;
    end
    
    % Apply mapping
    [m, n] = size(input1);
    output = zeros(m, n);
    for i = 1:L
        if hist1(i) > 0
            output = output + (input1 == i-1) * map(i);
        end
    end
    output = uint8(output);
end