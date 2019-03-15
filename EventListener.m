function EventListener(block,eventdata)

hf = findall(0,'Tag','figure1');
ax = findall(hf,'Tag','axes1');
thisLineHandle = findall(hf,'Tag','line_H');

xdata = get(thisLineHandle,'XData');
ydata = get(thisLineHandle,'YData');
sTime = block.CurrentTime;
data = block.OutputPort(1).Data;
if length(xdata) < 1001
    newXData = [xdata sTime];
    newYData = [ydata data];
else
    newXData = [xdata(2:end) sTime];
    newYData = [ydata(2:end) data];
end

set(thisLineHandle,...
    'XData',newXData,...
    'YData',newYData);
newXLim = [max(0,sTime-10) max(10,sTime)];
set(ax,'Xlim',newXLim);

end
