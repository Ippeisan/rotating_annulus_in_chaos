%Plot temperature oscillation (Fig. 4)

T1_ini = readtable("T1.dat");
T0 = table2array(T1_ini);
time = T0(1:end,1);

count_max = numel(T0(1:end,1));
T = zeros(count_max,32);
T(1:count_max,2:33)  = T0(1:count_max,2:33);

y = zeros(count_max,32);
for count = 1: count_max
  y(count,1:32) = fft(T(count,2:33));
end

clf
ax = gca;
ax.TickLabelInterpreter = 'latex';
plot(ax,time,abs(y(:,4))/32,'k','LineWidth',1);

xlabel('Time [s]', 'Interpreter', 'latex') 
ylabel('Temperature [K]', 'Interpreter', 'latex') 

xticks([0:3000:9000])
xlim([0 9000])
ylim([0 0.4])

grid on
legend('off')
print(gcf,'-depsc','fig4.eps')