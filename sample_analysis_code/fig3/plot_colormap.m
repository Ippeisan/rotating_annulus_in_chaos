%Plot color map of Fig. 3

T1_ini = readtable("T2.dat");
T0 = table2array(T1_ini);

time_interval = 0.04;

count_max = numel(T0(1:end,1));
time = T0(1:end,1);
T(1:count_max,1:32)  = T0(1:count_max,2:33);

x = linspace(1,360,32);
y = linspace(time_interval,count_max*time_interval,count_max);%table2array(probeT(:,1))
[X,Y] = meshgrid(x,y);

Tmean = mean(T,"All");

T1 = zeros(count_max,32);
T1(1:count_max,1:32)  = T(1:count_max,1:32) - Tmean;

clf
contourf(X,Y,T1)
xlim([0 360])
xticks([0:90:360])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
colormap(jet)
caxis([-0.5 0.6])
colorbar
xlabel('Azimuth [rad]', 'Interpreter', 'latex') 
ylabel('Time [s]', 'Interpreter', 'latex') 
print(gcf,'-depsc','fig3.eps')