% picADir is the directory of picture you want to display in white background
% picBDir is the directory of picture you want to display in black background
% picA and picB should have a same size
% outDir is the directory of output picture
% outDir's format should be .png
% return value suc indicates operation successful or not

function suc = mirageTank(picADir, picBDir, outDir) 
    A = rgb2gray(imread(picADir));
    B = rgb2gray(imread(picBDir));
    if (size(A) ~= size(B))
        msg = 'Picture size mismatch'
        suc = false;
        return
    endif
    [ax, ay] = size(A);
    for i = 1:ax
        for j = 1:ay
            if (mod(i + j, 2) == 1)
                outValue(i, j) = 1;
                outAlpha(i, j) = B(i, j);
            else
                outValue(i, j) = 0;
                outAlpha(i, j) = 255 - A(i, j);
            endif
        endfor
    endfor
    outAlpha = double(outAlpha) / 255;
    imwrite(outValue, outDir, 'Alpha', outAlpha);
    msg = ['Successful output to ', outDir]
    suc = true;
end