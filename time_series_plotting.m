% save the combined mat to divided mat and to plot fig
clc;clear;
% to load directory of the combined mat format files for your group
path_1='(your root directory)'; 
file_name=dir(path_1);

 for i_1=3:length(file_name) % to load all combined mat files
    
    name1 = file_name(i_1).name ;
    path_2=[path_1,'\',name1];  
    name2 = name1((end-12):(end-4));
    path_3 = load(path_2);
    path_4 = struct2cell(path_3);
    path_5 = fieldnames(path_3);
    % directory for saving time-series files 
    mkdir('(your root directory)\time_series\',name2); 
    % directory for saving divided mat format files 
    mkdir('(your root directory)\dmat\',name2); 
    
  for i_2= [6 8] % to load the channels
    % noted that if you analyze the rail step, pls fill i_2 = [6 10]
    % if you analyze the lateral dislocation, pls fill i_2 = [6 8]
    
    data = path_4{i_2,1};
    x_axl = path_4{i_2+1,1};
    name3 = path_5{i_2,1};
    figure(1)    
    plot(x_axl,data);
    xlabel('Time(s)');
    ylabel('Acceleration (m/s^2)');
    % directory for saving time-series files 
    s1=['(your root directory)\time_series\',name2,'\',name3]; 
    % directory for saving divided mat format files 
    s2=['(your root directory)\dmat\',name2,'\',name3]; 
    saveas(gcf,[s1,'.fig']); 
    save(s2,'data');
    close all
  end  
 end