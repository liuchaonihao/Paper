%scatter(x',y);
%scatter(x',regression');
%plot(regression,'-rs');
%plot(y,'-bd');
%plot(y-regression,'-gx')
%subplot(1,2,1);
figID = figure('Color',[1 1 1]);
e=temp4-Pre;
hist(e);
%subplot(1,2,2);hist(e)

% save figure
%xlim([0 length(Pre)]);
%box on;
%xlabel('Time[min]');
%ylabel('Wind power');
xlabel('Time (min)');
ylabel('histogram');
%grid on;
% filename = 'sample_plot.eps';
% saveas(figID,filename);