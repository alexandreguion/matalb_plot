%--------------------------------------------------------------------------------------
% HEADER FOR ALL FILES
clear all
close all
clc

writerObj = VideoWriter(['film_test_REF2']);
open(writerObj);
% OPEN FIGURE
figure1 = figure('Position',[50 50 2400 1200]);
% INITIALIZE: r_cl, Ca_cl
r_cl=[10];
u_cl=[0];
Ca_cl=[0];
time=[0];
%--------------------------------------------------------------------------------------

%--------------------------------------------------------------------------------------
% FIRST FILE 
%--------------------------------------------------------------------------------------
copyfile('velo-REF2-SPHERE-0.200.dat', 's')
p=load('s');
[mm,idm]=min(abs(p(:,2)));
[mm2,idm2]=max(abs(p(:,3)));
t=0.2;
dt=t-time(end);
rcl=p(idm,3);
ucl=(rcl-r_cl(end))/dt;
cacl=0.073*ucl/4.8;
r_cl=[r_cl;rcl];
u_cl=[u_cl;ucl];   
Ca_cl=[Ca_cl;cacl];
time=[time;t];
p2=[];
k=0;
for ii=1:length(p(:,2))
    if p(ii,2) < p(idm2,2)
    k=k+1;
    p2(k,1)=(p(ii,3)-p(idm,3))/10;
    p2(k,2)=p(ii,2)/10;    
    end
end
p3= sortrows(p2);
%MACRO BUBBLE
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.05 0.05 0.4 0.9]);
xlim(axes1,[0 6]);
ylim(axes1,[0 6]);
box(axes1,'on');
hold(axes1,'on');
set(gca, 'PlotBoxAspectRatio', [1,1,1])
title('Bubble geometry: z / R_b(0) vs. r / R_b(0)');
plot(p(:,3)/10, p(:,2)/10,'MarkerSize',10,'Marker','.','LineStyle','none',...
    'Color',[0 0 0])
%CA_CL
axes2 = axes('Parent',figure1,'YGrid','on','XGrid','on','YScale','log',...
    'FontSize',16,...
    'Position',[0.5 0.675 0.4 0.2]);
xlim(axes2,[0 10]);
ylim(axes2,[0.001 0.1]);
box(axes2,'on');
hold(axes2,'on');
title('Contact line capillary number: Ca_{cl} (t) [-]');
semilogy( time, Ca_cl,'MarkerSize',10,'Marker','none','LineWidth',5,...
    'Color',[0 1 0])
% POSITION OF CL
axes3 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.5 0.4 0.4 0.20]);
xlim(axes3,[0 10]);
ylim(axes3,[1 4]);
box(axes3,'on');
hold(axes3,'on');
title('Contact line position: r_{cl} / R_b(0) (t) [-]');
plot( time, r_cl/10,'MarkerSize',10,'Marker','none','LineWidth',5,...
    'Color',[0 0 1])
% SHAPE OF CONTACT LINE
axes4 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.5 0.125 0.4 0.20]);
xlim(axes4,[0 0.4]);
ylim(axes4,[0 0.1]);
box(axes4,'on');
hold(axes4,'on');
title('Contact line geometry: z / R_b(0) vs. r / R_b(0)');
plot( p3(:,1), p3(:,2),'MarkerSize',10,'Marker','.','LineWidth',1,...
    'Color',[0 0 0])
frame = getframe(gcf);
writeVideo(writerObj, frame);
%--------------------------------------------------------------------------------------



%--------------------------------------------------------------------------------------
% 10us FILE 
%--------------------------------------------------------------------------------------
copyfile('velo-REF2-SPHERE-10.000.dat', 's')
p=load('s');
[mm,idm]=min(abs(p(:,2)));
[mm2,idm2]=max(abs(p(:,3)));
t=10.;
dt=t-time(end);
rcl=p(idm,3);
ucl=(rcl-r_cl(end))/dt;
cacl=0.073*ucl/4.8;
r_cl=[r_cl;rcl];
u_cl=[u_cl;ucl];   
Ca_cl=[Ca_cl;cacl];
time=[time;t];
p2=[];
k=0;
for ii=1:length(p(:,2))
    if p(ii,2) < p(idm2,2)
    k=k+1;
    p2(k,1)=(p(ii,3)-p(idm,3))/10;
    p2(k,2)=p(ii,2)/10;    
    end
end
p3= sortrows(p2);
%MACRO BUBBLE
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.05 0.05 0.4 0.9]);
xlim(axes1,[0 6]);
ylim(axes1,[0 6]);
box(axes1,'on');
hold(axes1,'on');
set(gca, 'PlotBoxAspectRatio', [1,1,1])
title('Bubble geometry: z / R_b(0) vs. r / R_b(0)');
plot(p(:,3)/10, p(:,2)/10,'MarkerSize',10,'Marker','.','LineStyle','none',...
    'Color',[0 0 0])
%CA_CL
axes2 = axes('Parent',figure1,'YGrid','on','XGrid','on','YScale','log',...
    'FontSize',16,...
    'Position',[0.5 0.675 0.4 0.2]);
xlim(axes2,[0 10]);
ylim(axes2,[0.001 0.1]);
box(axes2,'on');
hold(axes2,'on');
title('Contact line capillary number: Ca_{cl} (t) [-]');
semilogy( time, Ca_cl,'MarkerSize',10,'Marker','none','LineWidth',5,...
    'Color',[0 1 0])
% POSITION OF CL
axes3 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.5 0.4 0.4 0.20]);
xlim(axes3,[0 10]);
ylim(axes3,[1 4]);
box(axes3,'on');
hold(axes3,'on');
title('Contact line position: r_{cl} / R_b(0) (t) [-]');
plot( time, r_cl/10,'MarkerSize',10,'Marker','none','LineWidth',5,...
    'Color',[0 0 1])
% SHAPE OF CONTACT LINE
axes4 = axes('Parent',figure1,'YGrid','on','XGrid','on',...
    'FontSize',16,...
    'Position',[0.5 0.125 0.4 0.20]);
xlim(axes4,[0 0.4]);
ylim(axes4,[0 0.1]);
box(axes4,'on');
hold(axes4,'on');
title('Contact line geometry: z / R_b(0) vs. r / R_b(0)');
plot( p3(:,1), p3(:,2),'MarkerSize',10,'Marker','.','LineWidth',1,...
    'Color',[0 0 0])
frame = getframe(gcf);
writeVideo(writerObj, frame);
%--------------------------------------------------------------------------------------


%--------------------------------------------------------------------------------------
% ALL FRAMES DONE: CLOSE VIDEO
close(writerObj);
%--------------------------------------------------------------------------------------




