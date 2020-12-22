function print_sim(x,y,param)



%% 
fig = figure;

ax = axes;
ax.Parent = fig;

p = plot(ax, x, y);



%% 

fig.Name='Signal';
fig.Color='white';

fig.Units = param.pictUnit;
fig.PaperUnits = param.pictUnit;

fig.Position=[fig.OuterPosition(1) fig.OuterPosition(2) param.pictSize];

fig.PaperPositionMode='manual';
fig.PaperPosition=[fig.OuterPosition(1) fig.OuterPosition(2) param.pictSize];
fig.PaperSize=param.pictSize;

%% 

ax.XAxisLocation = 'bottom';
ax.YAxisLocation = 'left';

ax.Box = 'on';
ax.XColor = 'black';
ax.YColor = 'black';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridColor='black';

ax.YLim = ax.YLim * 1.1;


ax.XLabel.String = '$t$, c';
ax.YLabel.String = param.Ylabel;

ax.FontName = 'Times';
ax.XLabel.FontName = 'Times';
ax.YLabel.FontName = 'Times';

ax.FontSize = param.tickFontsize;
ax.XLabel.FontSize = param.mainFontsize;
ax.YLabel.FontSize = param.mainFontsize;
set(ax,'TickLabelInterpreter', 'latex')


ax.YLabel.Interpreter = 'latex';
ax.XLabel.Interpreter = 'latex';
ax.FontWeight = 'normal';
ax.Title.String = 'Signal';


%%
for i = 1:size(p,1)
    p(i).LineWidth = param.LineWidth;
end
p(end).LineStyle = '--';

%% 
legend('PID-regulator', 'PD-regulator');
print(fig,param.fileName,'-painters','-r300','-fillpage','-dpdf')
end
