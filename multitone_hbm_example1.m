function multitone_hbm_example1
clear all;clc
% Example harmonic balance method results for multitone analysis
% This file can only be used for experimental purposes
% y'+mu*y(2)+c13d*y'*y^2+c11*y+c13*y^3 = u;
% Reference: Akgün, D., I. Çankaya, and JC Peyton Jones. "A symbolic algorithm for the automatic computation of multitone-input harmonic balance equations for nonlinear systems." Nonlinear Dynamics 56.1-2 (2009): 179-191

%1-System parameters-------------------------------------------------------
global mu c11 c13 c13d
mu=0.5; c11=10^2; c13=5; c13d=0.15;
%2-input  parameters ------------------------------------------------------
%   u = au0 + au1*cos(w1*t) + au2*cos(w2*t) ;
global au1 au2 au0  w1 w2
%   input amplitude
%Amplitude increase will cause a difference between the numerical and HBM
%results du to the limited number of harmonics
c=5;
au0=8*c;
au1=10*c;
au2=15*c;
%   input frequency
w1 = 3.2;%rad/s
w2 = 1.8;%rad/s


%3-compute hbe solution ---------------------------------------------------
disp('compute hbe solution: ')
y0= 0.5*rand(25,1)-0.25; %initial conditions
[Xf,Fval,ExitFlag,Iters]=mmfsolve(@multi_hbe,y0 ) ; %alternative solvers can be used
%mmfsolve can be downloaded from  http://www.mathworks.com/matlabcentral


c  = multi_hbe(Xf);
costhbe  = c'*c

%4-compute numerical solution ---------------------------------------------
disp('compute numerical solution: ')
Y=[];T=[];

options = odeset('MaxStep',0.01);
%
TStart  = 0;
TFinal  = 2*pi/0.1;% !
nSample = 3999; %199;
sstep   = TFinal /nSample;
tspan   = [TStart:sstep:TFinal];
maxIter = 100;

TLength=TFinal;
Yp=[0];
y0=rand(1,2);
for s=1:maxIter      
    [T,Y] = ode45(@vdpduf, tspan, y0,options) ;% alternative solvers can be used
    mse_err = sqrt( sum(  (Y(:,1)-Yp(:,1)).^2   ))
    y0= Y(end,:);       
    if mse_err<1e-10, break;end %Check steady-state solution
    TStart = T(end)         ;
    TFinal = TFinal+TLength ;
    tspan  = [TStart:sstep:TFinal];
    Yp=Y;
end

%5-Draw results -----------------------------------------------------------
x0=Xf(:,1);
x=x0;
t=T;
x(1)=x0(1);
x([2:2:end]) = sqrt(x0([2:2:end]).^2+x0([3:2:end]).^2);
x([3:2:end]) = angle(x0([2:2:end])+i*x0([3:2:end]) )   ;

CC=   x(1) ...
    + x(2)*cos( (0*w1+1*w2)*t + x(3)  )...
    + x(4)*cos( (0*w1+2*w2)*t + x(5)  )...
    + x(6)*cos( (1*w1-2*w2)*t + x(7)  )...
    + x(8)*cos( (1*w1-1*w2)*t + x(9)  )...
    + x(10)*cos((1*w1+0*w2)*t + x(11)  )...
    + x(12)*cos((1*w1+1*w2)*t + x(13)  )...
    + x(14)*cos((1*w1+2*w2)*t + x(15)  )...
    + x(16)*cos((2*w1-2*w2)*t + x(17)  )...
    + x(18)*cos((2*w1-1*w2)*t + x(19)  )...
    + x(20)*cos((2*w1+0*w2)*t + x(21)  )...
    + x(22)*cos((2*w1+1*w2)*t + x(23)  )...
    + x(24)*cos((2*w1+2*w2)*t + x(25)  );
figure(1);
plot(t,Y(:,1),'r*');
hold on
plot(t,CC,'b:','linewidth',2)
legend('Numerical Solution','HBM Solution')
xlabel('Time (second)')
ylabel('Amplitude')

display('Amplitudes of components:')
display(['constant   :' num2str(x(1))])
display(['0*w1+1*w2  :' num2str(x(2))])
display(['0*w1+2*w2  :' num2str(x(4))])
display(['1*w1-2*w2  :' num2str(x(6))])
display(['1*w1-1*w2  :' num2str(x(8))])
display(['1*w1+0*w2  :' num2str(x(10))])
display(['1*w1+1*w2  :' num2str(x(12))])
display(['1*w1+2*w2  :' num2str(x(14))])
display(['2*w1-2*w2  :' num2str(x(16))])
display(['2*w1-1*w2  :' num2str(x(18))])
display(['2*w1+0*w2  :' num2str(x(20))])
display(['2*w1+1*w2  :' num2str(x(22))])
display(['2*w1+2*w2  :' num2str(x(24))])



end
%define state-space equations for numerical solution
function dy=vdpduf(t,y)
global w1 w2 au0 au1 au2
global mu c11 c13 c13d
u = au0 + au1*cos(w1*t) + au2*cos(w2*t);
dy = zeros(2,1); % x1=y x2=y',  x1'=y'=x2 , x2'=y''
dy(1)=  y(2);
dy(2)=  -mu*y(2) -c13d*y(2)*y(1)^2 -c11*y(1) -c13*y(1)^3 + u;
end
