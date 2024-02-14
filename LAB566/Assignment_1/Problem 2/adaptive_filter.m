function output = adaptive_filter(input, window_size)
    [rows, cols] = size(input);
    output = zeros(rows, cols);
    half_window = floor(window_size / 2);

    for i = 1 + half_window : rows - half_window
        for j = 1 + half_window : cols - half_window
            window = input(i - half_window : i + half_window, j - half_window : j + half_window);
            threshold = mean(window(:));
            if input(i, j) > threshold
                output(i, j) = max(window(:));
            else
                output(i, j) = min(window(:));
            end
        end
    end
end