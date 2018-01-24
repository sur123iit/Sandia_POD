function [x,y,Uphi,Vphi] = cont_plot_uv( Phi )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%   This one is hard coded at the moment. Need to enhance it later
[x,y] = getxy(); % you can add the feature of project number here
for l = 0:3180:6360
        for j = 0:29
            for i = 1:106  
                if l == 0
                    Uphi(i,j+1) = Phi(i+(106*j)+l,1); 
                elseif l == 3180
                    Vphi(i,j+1) = Phi(i+(106*j)+l,1);
                end
            end
        end
end
end

