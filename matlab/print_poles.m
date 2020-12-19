function print_poles(G, param)

A = G.A;

poles = complex(eig(A)); 
%% 
fig = figure;
ax = axes;
ax.Parent = fig;

p = plot(ax, poles); 
%% 
fig.Name  = 'Ïîëþñà';
fig.Color = 'white';

fig.Units = param.pictUnit;
fig.PaperUnits = param.pictUnit;

fig.Position=[fig.OuterPosition(1) fig.OuterPosition(2) param.pictSize];
fig.PaperPositionMode='manual';
fig.PaperPosition=[fig.OuterPosition(1) fig.OuterPosition(2) param.pictSize];
fig.PaperSize=param.pictSize;
%% 
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

ax.Box = 'on'; 
ax.XColor = 'black';
ax.YColor = 'black';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.XMinorGrid = 'on';
ax.YMinorGrid = 'on';
ax.GridColor='black';


ax.XLabel.String = 'Re(s)';
ax.YLabel.String = 'Im(s)';

ax.FontName = 'Times New Roman';
ax.XLabel.FontName = 'Times New Roman';
ax.YLabel.FontName = 'Times New Roman';

ax.FontSize = param.tickFontsize;
ax.XLabel.FontSize = param.mainFontsize;
ax.YLabel.FontSize = param.mainFontsize;
set(ax,'TickLabelInterpreter', 'latex')

ax.YLabel.Interpreter = 'latex';
ax.XLabel.Interpreter = 'latex';
ax.FontWeight = 'normal';

ax.Title.String = 'Ïîëþñà ñèñòåìû';
ax.Title.FontSize = param.mainFontsize;

%% 

p.LineStyle= 'none'; 
p.Marker = '.';
p.MarkerSize = param.MarkerSize;
%%
switch param.fileFormat
    case "png"
            param.fileFormatKey = '-dpng';
    case "eps"
            param.fileFormatKey = '-deps';
    case "pdf"
            param.fileFormatKey = '-dpdf';
    otherwise
        param.fileFormatKey = '-dpdf';
            
end
print(fig,param.fileName,'-painters','-r300','-fillpage',param.fileFormatKey);

end