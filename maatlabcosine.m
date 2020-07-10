clc
clear all;
close all;
t=0:0.001:1;
mt=5*cos(2*pi*5*t);
subplot(2,1,1);
plot(t,mt);
xlabel('time');
ylabel('amplitude');
title('message signal1');

subplot(2,2,1);
plot(t,hilbert(mt));
xlabel('time');
ylabel('amplitude');
title('message signal2');
