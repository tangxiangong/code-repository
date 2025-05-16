clc
clear
close all

subordinator(0.5,100)
[t, S] = subordinator(0.4,100);
inv_subordinator(0.4, 100, true, false)
% inv_subordinator(0.5, 100, true, false)
% inv_subordinator(0.7, 100, true, true)