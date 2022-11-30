clc;
clear;
close all; 

xi = 300;
xf = 2600; 

x = xi:xf;  
y = -0.00000135886688 * x.^3 + 0.005911070929582 * x.^2 - 6.991342702949059 * x + 3902.0958331165075;
dy = -.00000407660064 * x.^2+.011822141 * x-6.991342702949059;

figure(1); 
hold on 

% grid on 
title("Proyecto Integrador, Modelación Computacional de la Conservación de Movimiento.")
box on; 
ylabel("Coordenadas en Y (m)"); 
xlabel("Coordenadas en X (m)"); 

% i(300, 2300) y f(2600, 1800)

hold on 
% axis('on', 'image');
yb_u = y + 100;
yb_d = y - 100; 
xlim([0 3000]);
ylim([1000 3000]);
% plot(x,y, "--", Color="black");
plot(x,y, LineWidth=13, Color="black");

grada1 = rectangle('Position', [827.5 - 100, 1394.43 - 300 80 * 3, 10 * 3]);
grada2 = rectangle('Position', [2072.5 - 100, 2705.58 + 200, 80 * 3 10 * 3]);
flecha1 = quiver(827.5, 1394.43, 0, -200); 

hold on 
plot(x,y,"--", Color="yellow", LineWidth = 2);

% plot(x,yb_u, Color="Yellow"); 
% plot(x,yb_d, Color="Yellow");

% set(gcf,'position',[4000, 4000, 4000, 4000])
set(gcf) 
hold on 
a = 2;
img = imread("carrito.png");
img = rescale(img); 


for i=300:a:2600
    s = -0.00000135886688 * i.^3 + 0.005911070929582 * i.^2 - 6.991342702949059 * i + 3902.0958331165075;
    d_s = -.00000407660064 * i.^2+.011822141 * i-6.991342702949059;
    

    % calc_y = deriv(i);
    % s * abs(d_s)
    % * abs(d_s)
    % calc_x = i;

    % set(car_ax,"Position",[i, s, 20, 20])
    xp = 280 * abs(d_s); 
    yp = (280 * d_s) * abs(d_s);
    pu = quiver(i, s-20, 280 * abs(d_s), yp);
    % image(carrito, xp, yp)
    a = a.^2;
    
    % deg = deriv(i)

    degree = -57.2928 * (atan(yp/xp)); 
    % tex = text(i, s-20, ":D");
    m1 = imresize(img, 0.4, "bilinear");
    m = imrotate(m1, degree);
    mask = double( any(m, 3) );
    dispCar = image(i-100, s-100, m, AlphaData=mask); 

    % rect = rectangle('Position',[i s-20 50 100]);
    % r1 = rotate(rect, degree, [i s-20 50 150], [i s-20 50 150]);
    % rect.FaceColor = "red"; 
    % rect.LineWidth = 2;
    % rect.EdgeColor = "red"; 
    % mp = plot(mm, yy); 
    % disp(calc_y); 
    % drawnow;
    disp(degree)
    pause(0.00000000000000000000000001); 

    % delete(rect); 
    % delete(imgRead); 
    delete(pu); 
    % delete(tex); 
    delete(dispCar); 
    % delete(rotation); 
end 
% imerased(pepe); 

function pp = deriv(x)
    pp = -.00000407660064 * x.^2+.011822141 * x-6.991342702949059;
end 