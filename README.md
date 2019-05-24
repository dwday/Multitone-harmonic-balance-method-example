# Example application of multitone harmonic balance method on Duffing Van Der Pol equation
An example about the application of multitone harmonic balance method to Duffing Van Der Pol equation
<br />

<br />
Example:
<br />
Test System
<br />
![alt text](/img/sys.png)
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
<br />c=5; % change amplitude
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

<br />
Reference study:
<br />
Akgün, Devrim & Cankaya, I & C. Peyton Jones, J. (2009). A symbolic algorithm for the automatic computation of multitone-input harmonic balance equations for nonlinear systems. Nonlinear Dynamics. 56. 179-191. 10.1007/s11071-008-9390-y. 
<br />
https://www.researchgate.net/publication/227197407_A_symbolic_algorithm_for_the_automatic_computation_of_multitone-input_harmonic_balance_equations_for_nonlinear_systems
<br />
https://link.springer.com/article/10.1007/s11071-008-9390-y
<br />
<br />
