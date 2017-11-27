function [ output_args ] = plot_strouhal( a )
%UNTITLED5 Summary of this function goes here
% a:vector or matrix to be plotted
%  The format of the matrix should be:
%-if it is 1 D, then, no problem.
%-if it is 2 D, then, frequency distribution should be across each column.
% n: number of plots to be on a plot
% o: 1 D or 2D
Fs = input('Input the sampling frequency');
n1 = input('Enter 1 if negative frequencies are also considered. Else enter 0');
D = input('Enter depth of the cavity');
U = input('Enter free stream velocity value');
[N1,N2] = size(a);
if n1 == 1
    N1 = N1/2;
end
f = Fs/(2*N1);
St = f*D/U;
St1 = Fs*D/(2*U);
for i = 1:N2
    if i == 1
        plot(0:St:St1-St,a(1:N1,i),'o-')
    end
    if i == 2
        plot(0:St:St1-St,a(1:N1,i),'s-')
    end
    if i == 3
        plot(0:St:St1-St,a(1:N1,i),'^-')
    end
    if i == 4
        plot(0:St:St1-St,a(1:N1,i),'>-')
    end
    if i == 5
        plot(0:St:St1-St,a(1:N1,i),'<-')
    end
    if i == 6
        plot(0:St:St1-St,a(1:N1,i),'p-')
    end
    
    hold on
end
ymax = input ('Enter the y limit value from graph');
xmax = input ('Enter the x limit value from graph');
plot([0.0598 0.0598],[0 ymax],'--',[0.14 0.14],[0 ymax],'--',[0.219 0.219],[0 ymax],'--')
xlim([0 xmax]), ylim([0 ymax])
end

