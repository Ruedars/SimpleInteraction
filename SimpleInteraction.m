% Simple user interaction
% ... just trying to add a comment
%
function Simple()

    hf1 = figure(1); 
    hf1.Color = [1 1 1];
    hf1.WindowButtonUpFcn = @stopdrag;
    clf;

    xv = 2*pi*(0:0.01:1);
    yv = sin(xv);
    
    hpl = plot(xv,yv,'LineWidth',2); hold on;
    hln = plot([pi pi],[-1.2,+1.2],'LineWidth',2);
    hpt = plot(pi,0,'o','MarkerSize',7,'LineWidth',2);
    xlabel('$x$','interpreter','latex');
    ylabel('$\sin(x)$','interpreter','latex');
    axis([0 2*pi -1.2 1.2]);
    title('Click& drag the vertical line');
    
    hln.ButtonDownFcn = @startdrag;
    
    % -----------------------------------------------
    % event handling
    function startdrag(src,event)
        hf1.WindowButtonMotionFcn = @move;     
    end
    function move(src,event)
        pt = get(gca, 'CurrentPoint');
        hln.XData = [1 1]*pt(1,1);
        hpt.XData = pt(1,1);
        hpt.YData = sin(pt(1,1));
    end
    function stopdrag(src,event)
        hf1.WindowButtonMotionFcn = [];  
    end
end