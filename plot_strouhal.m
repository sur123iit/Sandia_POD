function [ output_args ] = plot_strouhal( a )
%UNTITLED5 Summary of this function goes here
% a:vector or matrix to be plotted
%  The format of the matrix should be:
%-if it is 1 D, then, no problem.
%-if it is 2 D, then, frequency distribution should be across each column.
% n: number of rossiter modes you wanna plot
% o: 1 D or 2D
Fs = input('Input the sampling frequency');
n1 = input('Enter 1 if negative frequencies are also considered. Else enter 0');
[L,D,Ma,U,N,~] = load_parameters(1);
[N1,N2] = size(a);
if n1 == 1
    N1 = N1/2;
end
f = Fs/(2*N1);
St = f*D/U;
St1 = Fs*D/(2*U);
for i = 1:N2
    if i == 1
        %plot(0:St:St1-St,a(1:N1,i),'o-')
        plot(0:St:St1-St,a(1:N1,i),'o-','LineWidth',2)
    end
    if i == 2
        %plot(0:St:St1-St,a(1:N1,i),'s-')
        plot(0:St:St1-St,a(1:N1,i),'s-','LineWidth',2)
    end
    if i == 3
        %plot(0:St:St1-St,a(1:N1,i),'^-')
        plot(0:St:St1-St,a(1:N1,i),'^-','LineWidth',2)
    end
    if i == 4
        %plot(0:St:St1-St,a(1:N1,i),'>-')
        plot(0:St:St1-St,a(1:N1,i),'>-','LineWidth',2)
    end
    if i == 5
        %plot(0:St:St1-St,a(1:N1,i),'<-')
        plot(0:St:St1-St,a(1:N1,i),'<-','LineWidth',2)
    end
    if i == 6
        plot(0:St:St1-St,a(1:N1,i),'p-')
    end
    
    hold on
end
ymax = input ('Enter the y limit value from graph: ');
xmax = input ('Enter the x limit value from graph: ');
n = input('How many Rossiter mode frequencies you need to show in the curve: ');
Ma = U/340;
ros_mode = Ros_freq(Ma,n,L);
ros_mode = ros_mode*D/U;
for i = 1:n
    if i == 4
    plot([ros_mode(i,1) ros_mode(i,1)],[0 ymax],'--','LineWidth',2,'Color','b')
    else
    plot([ros_mode(i,1) ros_mode(i,1)],[0 ymax],'--','LineWidth',2)
    end
    hold on
end
xlim([0 xmax]), ylim([0 ymax])
end

