
%%%%%%%%%%%%% LE System %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%idx1
ll = fsolve(@(x)[x(2);...
              -x(1)+x(2)*x(3);...
              0.5*x(3)-x(2)^2+5],[0,0,0])
          
ini_value_1 = [-0.9,0,-2];
wang1 = @(t,x)[x(2);...
              -x(1)+x(2)*x(3);...
              0.5*x(3)-x(2)^2+5]; 
ini_value_2 = [0.9,0,-2];
wang2 = @(t,y)[y(2);...
              -y(1)+y(2)*y(3);...
              0.5*y(3)-y(2)^2+5];
          
ini_value_3 = [0.43,2,0.18]; 
wang3 = @(t,z)[z(2);...
              -z(1)+z(2)*z(3);...
              0.5*z(3)-z(2)^2+5];
          
ini_value_4 = [0.4,3,1];
wang4 = @(t,l)[l(2);...
              -l(1)+l(2)*l(3);...
              0.5*l(3)-l(2)^2+5];
          
ini_value_5 = [-0.4,-3,1];
wang5 = @(t,m)[m(2);...
              -m(1)+m(2)*m(3);...
              0.5*m(3)-m(2)^2+5];
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
[t,x] = ode45(wang1,[0 1000], ini_value_1,options);
[t,y] = ode45(wang2,[0 1000], ini_value_2,options);
[t,z] = ode45(wang3,[0 1000], ini_value_3,options);
[t,l] = ode45(wang4,[0 1000], ini_value_4,options);
[t,m] = ode45(wang5,[0 1000], ini_value_5,options);


x=x(1:length(x),:);
y=y(1:length(y),:);
z=z(1:length(z),:);
l=l(1:length(l),:);
m=m(1:length(m),:);

plot3(x(:,1),x(:,2),x(:,3),'y-');
grid on
axis tight
view(220,20)
title('index-1')
xlabel('X')
ylabel('Y')
zlabel('Z')
hold on
plot3(y(:,1),y(:,2),y(:,3),'g-');
hold on
plot3(z(:,1),z(:,2),z(:,3),'b-');
hold on
plot3(l(:,1),l(:,2),l(:,3),'c-');
hold on
plot3(m(:,1),m(:,2),m(:,3),'m-');
hold on
plot3(ll(1), ll(2), ll(3),'r.','MarkerSize', 20);


% plot(y(:,1),y(:,2),'b-'); 
% xlabel('X'); ylabel('Y');
% title('XY ')
% saveas(gcf,'XY.jpg')
% saveas(gcf,'XY.bmp')
% 
% plot(y(:,2),y(:,3),'b-'); xlabel('Y'); ylabel('Z');
% title('YZ ')
% saveas(gcf,'YZ.jpg')
% saveas(gcf,'YZ.bmp')
% 
% plot(y(:,1),y(:,3),'b-'); xlabel('X'); ylabel('Z');
% title('XZ ')
% saveas(gcf,'XZ.jpg')
% saveas(gcf,'XZ.bmp')

% plot(y(:,1),y(:,2),'b-'); xlabel('X'); ylabel('Y');
% title('Chen Attractor XZ ')
% saveas(gcf,'ChenXY.jpg')
% saveas(gcf,'ChenXY.bmp')

% plot3(y(:,1),y(:,2),y(:,3),'b-');
% grid on
% axis tight
% view(220,20)
% title('index-1')
% xlabel('X')
% ylabel('Y')
% zlabel('Z')

saveas(gcf,'index-1.jpg')
saveas(gcf,'index-1.bmp')