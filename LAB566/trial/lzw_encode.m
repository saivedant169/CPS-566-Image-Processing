function compressedData = lzw_encode(input)
    dictSize = 256;  % Initial dictionary size for single bytes
    maxDictSize = 4096;  % Maximum dictionary size
    dict = cell(1, maxDictSize);  % Initialize dictionary
    for i = 1:dictSize
        dict{i} = char(i-1);  % Initialize dictionary with single bytes
    end
    
    nextCode = dictSize + 1;  % Next available code for sequences
    p = '';  % Initialize prefix as empty
    compressedData = [];  % Initialize compressed data
    
    for i = 1:length(input)
        c = input(i);  % Get the current input
        
        pc = [p, c];  % Concatenate prefix and current input
        
        % Check if pc is in the dictionary
        if ismember(pc, dict)
            p = pc;  % Update prefix to pc if it's in the dictionary
        else
            % Encode the prefix and add pc to the dictionary
            compressedData = [compressedData, find(ismember(dict, p))];
            if nextCode <= maxDictSize
                dict{nextCode} = pc;  % Add pc to the dictionary
                nextCode = nextCode + 1;
            end
            p = num2str(c);  % Reset prefix to the current input
        end
    end
    
    % Encode the last prefix
    if ~isempty(p)
        compressedData = [compressedData, find(ismember(dict, p))];
    end
end