clf

A = readmatrix("profile2_dat1.dat"); % d, p, F[n], G[n]
B = readmatrix("profile2_dat2.dat"); % d, nmax, nmin, Gmax, Gmin, R

%%%%%%%%%%%%%%%%%%%%%%
%%%% delta-Gamma %%%%%
%%%%%%%%%%%%%%%%%%%%%%
fig = figure( 'Name', 'delta_Gamma' ,'Position',[0 0 210*2 295*2]);
t = tiledlayout("vertical");
t.TileSpacing = "compact"; 
nexttile;
plot(B(:,1),B(:,4),"r") %max
hold on
plot(B(:,1),B(:,5),"b") %min

xlim([0, 100]);
xticks(0:20:100);
ylim([-0.005, 0.005]);
yticks(-0.005:0.0025:0.005);

xlabel( '$\delta$', 'Interpreter', 'latex');
ylabel('$\Gamma$', 'Interpreter', 'latex');
legend({'max','min'},'Location','northoutside','NumColumns',2);

grid on

%%%%%%%%%%%%%%%%%%%%%%
%%%% delta-R %%%%%
%%%%%%%%%%%%%%%%%%%%%%
nexttile;
plot(B(:,1),B(:,6),"k") %max

xlim([0, 100]);
xticks(0:20:100);
ylim([0, 0.01]);
yticks(0:0.0025:0.01);

xlabel( '$\delta$', 'Interpreter', 'latex');
ylabel('$R$', 'Interpreter', 'latex');
grid on
annotation('textbox',[.05, .88, .1, .1],'String','(a)', ...
    'EdgeColor','none','FontSize',16, 'Interpreter', 'latex');
annotation('textbox',[.05, .42, .1, .1],'String','(b)', ...
    'EdgeColor','none','FontSize',16, 'Interpreter', 'latex');
print(gcf,'-depsc','fig10.eps')