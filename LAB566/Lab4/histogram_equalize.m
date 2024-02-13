function [equal_img] = histogram_equalize(img, L)
bins = [0:L-1];
[m,n] = size(img);
len = m*n;
x = reshape(img,len,1);
xpdf = hist(x,bins); % pdf, 1 x L
tr = round(xpdf*triu(ones(L))*(L-1)/len); % cdf, range from 0 to L-1
equal_img = zeros(m,n);
for i = 1:L
    if xpdf(i)>0
        equal_img = equal_img + [img==i-1]*tr(i);
    end
end
equal_img = uint8(equal_img);
end