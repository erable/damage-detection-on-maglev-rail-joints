% PSD from divided mat format files
% in this case we did not provide the directory path so you have to fill in
% by yourself
clear;clc;
path_1='(your root directory)'; % your divided mat format files directory

% import the data (you may use the for loop to repeat import of data)
file_name = dir(path_1);

for i_1 = 3:length(file_name)
    name_1 = file_name(i_1).name;
    path_2=[path_1,'\',name_1];
    file_name_2 = dir(path_2);
    name_2 = file_name_2(6).name;
    chann_name = [path_2,'\',name_2];
    Test_data = importdata(chann_name);
    N=length(Test_data); % Sample length    

    % Fast Fourier Transform to generate PSD
    nfft = 1024; % number of points for fft
    overlap_rate = 1/2;  % overlap of window function   
    window = hamming(nfft); % Window function
    Fs = 5000;  % Sampling frequency(Hz)
    [pxx,f] = pwelch(Test_data,window,overlap_rate*nfft,nfft,Fs);  
    plot(f(2:end),10*log10(abs(pxx(2:end))),'LineWidth',1);
    title('Welch¡¯s Power Spectral Density Estimate')
    xlabel('f (Hz)')
    ylabel('PSD (dB/Hz)')
end
% (need to be fill your saving psd file directory)
close all