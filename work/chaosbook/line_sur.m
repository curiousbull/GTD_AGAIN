
%%%%%%%%%%%%% LE System %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LE1
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [-1,0,0,0,0,0,-15,-1,0,0,0];
%b = [-1,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [0,0.5,0.5];
%LE2
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,-1,0,0,0,0,-17,-1,0,0,0];
%b = [-1,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [0,0.4,0];
%LE3
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,1,0,0,-18,-1,0,0,0];
%b = [-1,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [0,-0.4,0.5];
%LE4
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,0,0,0,-4,-0.6,-1,0];
%b = [-1,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [0.2,0.7,0];
%LE5
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,-1,-1,0,0,-5,0,0];
%b = [-1.5,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [0.7,1,0];
%LE6
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,0,-0.04,0,-1,-0.1,0,0];
%b = [-1,0,0,0,0,1];
%c = [0,1,0];
%ini_value = [12,2,0];
%LE7
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,-1.85,0,0,-1,0,-0.3,0];
%b = [1,0,0,0,0,1];
%c = [0,0,1];
%ini_value = [5.1,7,0];
%LE8
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
%a = [0,0,0,3,0,0,-1,-1,0,0];
%b = [-1,0,0,0,0,-1];
%c = [0,0,1];
%ini_value = [0,-0.3,-1];
%LE9
%dot{x} = c*[x,y,z]
%dot{y} = b*[x,y,z,xy,xz,yz]
%dot{z} = a*[x,y,z,x2,y2,z2,xy,xz,yz,1]
a = [0,0,1,0,0,-0.2,1,0,0,0];
b = [0,-1.62,0,0,1,0];
c = [0,0,1];
ini_value = [0,1,0.8];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wang = @(t,y)[c(1)*y(1)+c(2)*y(2)+c(3)*y(3);...
b(1)*y(1)+b(2)*y(2)+b(3)*y(3)+...
b(4)*y(1)*y(2)+b(5)*y(1)*y(3)+b(6)*y(2)*y(3);...
a(1)*y(1)+a(2)*y(2)+a(3)*y(3)+a(4)*y(1)^2+a(5)*y(2)^2+...
a(6)*y(3)^2+a(7)*y(1)*y(2)+a(8)*y(1)*y(3)+a(9)*y(2)*y(3)+a(10)]; 
options = odeset('RelTol',1e-5,'Stats','on','OutputFcn',@odeplot);
[t,y] = ode45(wang,[0 250], ini_value);

y=y(500:length(y),:)
plot(y(:,1),y(:,2),'b-'); 
xlabel('X'); ylabel('Y');
title('XY ')
saveas(gcf,'XY.jpg')
saveas(gcf,'XY.bmp')

plot(y(:,2),y(:,3),'b-'); xlabel('Y'); ylabel('Z');
title('YZ ')
saveas(gcf,'YZ.jpg')
saveas(gcf,'YZ.bmp')

plot(y(:,1),y(:,3),'b-'); xlabel('X'); ylabel('Z');
title('XZ ')
saveas(gcf,'XZ.jpg')
saveas(gcf,'XZ.bmp')

% plot(y(:,1),y(:,2),'b-'); xlabel('X'); ylabel('Y');
% title('Chen Attractor XZ ')
% saveas(gcf,'ChenXY.jpg')
% saveas(gcf,'ChenXY.bmp')

plot3(y(:,1),y(:,2),y(:,3),'b-');
grid on
axis tight
view(220,20)
title('LE1')
xlabel('X')
ylabel('Y')
zlabel('Z')

saveas(gcf,'LE1.jpg')
saveas(gcf,'LE1.bmp')