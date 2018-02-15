
for ii = 1:2:r
    if abs(dmd_evals1(ii,1))>1.0004
        string_table =sprintf('%6.4f     %5.2f     %3.3f',abs(dmd_evals1(ii,1)),abs(mode_frequencies(ii,1)),mode_growthrate(ii,1));
        disp(string_table);
        disp(ii);
        clearvars string_table;
    end
end

for ii = 1:2:r
    if abs(dmd_evals1(ii,1))<0.972
        string_table =sprintf('%6.3f     %5.2f     %3.3f',abs(dmd_evals1(ii,1)),abs(mode_frequencies(ii,1)),mode_growthrate(ii,1));
        disp(string_table);
        clearvars string_table;
    end
end
