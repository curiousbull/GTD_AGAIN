
%%%%%%%%%%%%% LE System %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ES1
ini_value = [6,0,-1];
wang = @(t,y)[y(1)*y(2);...
              y(1)*y(3);...
              -y(1)^2+1.54*y(1)*y(2)^2-y(1)^2*y(3)]; 
%ES2
% ini_value = [0.15,0,0.8];
% wang = @(t,y)[y(1)*y(2);...
%               -y(1)^2+y(1)*y(3);...
%               3*y(1)*y(2)^2-y(1)^2*y(3)]; 
%ES3
% ini_value = [0.87,0.4,0]
% wang = @(t,y)[y(1)*y(2)^2+2*y(1)^2*y(2);...
%               -y(1)*y(3);...
%               y(1)+y(1)^2*y(2)]; 
%ES4
% ini_value = [0,0.46,0.7];
% wang = @(t,y)[-y(2)*y(3);...
%               y(1)*y(3)+y(3)^2;...
%               2*y(2)^2*y(3)+y(1)*y(3)^2-0.35*y(3)]; 
%ES5
% ini_value = [1,1.44,0]
% wang = @(t,y)[-0.4*y(1)*y(2)*y(3);...
%               y(1)*y(2)+y(1)*y(2)*y(3)^2-y(1)^2*y(2)^2;...
%               y(1)^3*y(2)-y(1)^2*y(2)^2]; 
%ES6
% ini_value = [1,-1.3,-1];
% wang = @(t,y)[y(1)*y(2)^2*y(3)+2*y(1)*y(2)^2*y(3)^2;...
%               8*y(1)*y(2)*y(3)^2+y(1)*y(2)^3*y(3)+7*y(1)*y(2)*y(3)^3;...
%               y(1)^3*y(2)*y(3)-y(1)*y(2)^3*y(3)]; 
%ES7
% ini_value = [0,0.1,0];
% wang = @(t,y)[0.4*(1-y(1)^2-y(2)^2-y(3)^2)*y(2);...
%               (1-y(1)^2-y(2)^2-y(3)^2)*y(1)*y(3);...
%               (1-y(1)^2-y(2)^2-y(3)^2)*(-y(3)-y(1)^2-6*y(2)*y(3))]; 
%ES8
% ini_value = [0.24,0.2,0]
% wang = @(t,y)[(1-y(1)^2-y(2)^2-y(3)^2)*(y(3)+y(2)^2);...
%               (1-y(1)^2-y(2)^2-y(3)^2)*(-y(2)+5*y(1)^2);...
%               (1-y(1)^2-y(2)^2-y(3)^2)*(-y(1)*y(2))]; 
%ES9
% ini_value = [0.06,0,1]
% wang = @(t,y)[(1-y(1)^2-y(2)^2)*(y(2)^2-5*y(1)*y(2));...
%               (1-y(1)^2-y(2)^2)*(y(1)*y(3));...
%               (1-y(1)^2-y(2)^2)*(1-7*y(2)^2)]; 
%ES10
% ini_value = [0,-0.08,0]
% wang = @(t,y)[(1+y(1)^2-y(2)^2)*(0.1-y(3)^2);...
%               (1+y(1)^2-y(2)^2)*(y(1)*y(3));...
%               (1+y(1)^2-y(2)^2)*(y(2)+y(1)*y(3))]; 
%ES11
% ini_value = [0.46,0,0.8]
% wang = @(t,y)[(y(3)+y(1)^2+y(2)^2)*(y(2)*y(3));...
%               (y(3)+y(1)^2+y(2)^2)*(y(1)-y(1)*y(3));...
%               (y(3)+y(1)^2+y(2)^2)*(y(1)-0.6*y(3)^2)]; 
%ES12
% ini_value = [1,0,1]
% wang = @(t,y)[(y(3)+y(1)^2+y(2)^2)*(y(2)*y(3));...
%               (y(3)+y(1)^2+y(2)^2)*(-0.1*y(1));...
%               (y(3)+y(1)^2+y(2)^2)*(-y(3)+6*y(2)^2+y(1)*y(3))]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
options = odeset('RelTol',1e-5,'Stats','on','OutputFcn',@odeplot)
[t,y] = ode45(wang,[0 1000], ini_value,options);

y=y(1:length(y),:)
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
title('ES1')
xlabel('X')
ylabel('Y')
zlabel('Z')

saveas(gcf,'ES1.jpg')
saveas(gcf,'ES1.bmp')