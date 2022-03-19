% we did not provide the save path so you have to fill in by yourself
clc;close % for restart

% pls import data from mat files
data = '(your data variable in mat file)'; % which time series you want to analyze
t =  '(your time variable in mat file)'; % the x-axis of time

% dimensional statistics in time domain
peak1 = max(data); 
peak2 = min(data);
if abs(peak1) > abs(peak2)
    peak = peak1;
else
    peak = peak2;
end
meanvalue = mean(data);
rmsvalue = rms(data);

peak = zeros(1, length(data)) + peak;
meanvalue = zeros(1, length(data)) + meanvalue;
rmsvalue = zeros(1, length(data)) + rmsvalue;

figure
plot(t, data, 'LineStyle', '-','LineWidth',0.25)
hold on
plot(t, peak, 'LineStyle', '--', 'LineWidth',2)
hold on
plot(t, meanvalue, 'LineStyle', ':', 'LineWidth',2)
hold on
plot(t, rmsvalue, 'LineStyle', '-.', 'LineWidth',2)
legend('raw signal','peak','mean','RMS')
xlabel('t (s)')
ylabel('acceleration (m/s^2)')
