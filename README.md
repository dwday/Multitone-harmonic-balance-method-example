# Example multitone harmonic balance method application on Duffing Van Der Pol equation
An example about the application of multitone harmonic balance method to Duffing Van Der Pol equation
<br />
<br />
Reference study:
Akgün, D., I. Çankaya, and JC Peyton Jones. "A symbolic algorithm for the automatic computation of multitone-input harmonic balance equations for nonlinear systems." Nonlinear Dynamics 56.1-2 (2009): 179-191.
<br />
<br />
Example:
<br />
Test parameters
<br />
mu=0.5; c11=10^2; c13=5; c13d=0.15;
c=1;
au0=8*c;
au1=10*c;
au2=15*c;
<br />
<br />%TEST 1--------------------------------------------------------
<br />
<br />%   input frequency
<br />w1 = 1.3;%rad/s
<br />w2 = 2.7;%rad/s

![alt text](/img/im1.png)

<br />%TEST 2-------------------------------------------------------
<br />%change frequency
%   input frequency
<br />w1 = 10;%rad/s
<br />w2 = 1;%rad/s

![alt text](/img/im2.png)
<br />%TEST 3-------------------------------------------------------
<br />c=5; % chance amplitude
<br />au0=8*c;
<br />au1=10*c;
<br />au2=15*c;
<br />%   input frequency
<br />w1 = 10;%rad/s
<br />w2 = 1;%rad/s

![alt text](/img/im3.png)

<br />%TEST 4-------------------------------------------------------
<br />Command window output
<br />c=5;
<br />au0=8*c;
<br />au1=10*c;
<br />au2=15*c;
<br />%   input frequency
<br />w1 = 3.2;%rad/s
<br />w2 = 1.8;%rad/s

<br />compute hbe solution: 
<br />costhbe =
<br />   2.9173e-26
<br />compute numerical solution: 
<br />mse_err =
 <br />  47.3915
<br />mse_err =
<br />    9.0363
<br />mse_err =
<br />   1.0226e-07
<br />mse_err =
<br />   7.0438e-12
<br />Amplitudes of components:
<br />constant   :0.37613
<br />0*w1+1*w2  :0.73122
<br />0*w1+2*w2  :0.014166
<br />1*w1-2*w2  :0.0083522
<br />1*w1-1*w2  :0.018504
<br />1*w1+0*w2  :0.51892
<br />1*w1+1*w2  :0.023698
<br />1*w1+2*w2  :0.014597
<br />2*w1-2*w2  :0.001303
<br />2*w1-1*w2  :0.0069842
<br />2*w1+0*w2  :0.0088012
<br />2*w1+1*w2  :0.015925
<br />2*w1+2*w2  :0.019746

