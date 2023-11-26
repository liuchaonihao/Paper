figID = figure('Color',[1 1 1]);
hold on; 
plot(ytest,'-K.');
plot(TSVRwin30,'-m');
plot(TLSSVR30,'-b');
plot(TPSVR30,'-c');
plot(TSVRGNwin30,'-g');
plot(Pre,'-r.');
h.FontSize=12;

xlim([0 length(Pre)]);
ylim([8 20]);
%set(gca,'ytick',-5:0.5:13);
box on;
xlabel('Time');
ylabel('Windspeed');
grid on;

axes('Position',[0.34,0.65,0.35,0.25]); 
hold on;
plot(ytest,'-K.');
plot(TSVRwin30,'-m');
plot(TLSSVR30,'-b');
plot(TPSVR30,'-c');
plot(TSVRGNwin30,'-g');
plot(Pre,'-r.');
box on;

% set(h2,'xlim',[0.5 1.5]);
xlim([200 250]);
annotation('rectangle',[0.49,0.15,0.09,0.23],'LineStyle','-','Color',[0.2,0.5,0.2],'LineWidth',0.7)
annotation('arrow',[0.55,0.5],[0.38,0.6],'Color',[0.2,0.5,0.2])
