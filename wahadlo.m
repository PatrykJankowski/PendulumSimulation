clear;
clc;

% Symulacja wahadla
dt = 0.01;   % krok symulacji
Tk = 50;     % czas symulacji
l = 1;

% Wektor czasu i wektor warunkow poczatkowych
T = 0:dt:Tk;
X0 = [(pi/180)*179 0 0 0];

% Symulacja za pomoca funkcji ode45
[T1,Y1] = ode45('fun',T,X0);
% Trajektoria konca wahadla
X = (l+Y1(:,3)).*sin(Y1(:,1));
Y = -(l+Y1(:,3)).*cos(Y1(:,1));
% Przeliczenie wyjscia (kata) na stopnie
Y1 = (180/pi)*Y1;

% Wizualizacja ruchu wahadla
skok = 5;
counter = 10;
N = size(T1,1);
% Zamkniecie wszystkich wykresow
close all;
axis([-5 5 -5 5]);
set(gca,'box','on');
grid on;

% Narysowanie osi obrotu
ii=0:0.5:(2*pi);
xx1 = 0.025*sin(ii);
yy1 = 0.025*cos(ii);
idl = line(xx1,yy1,'erasemode','xor');
id2 = line([0 X(1)],[0 Y(1)],'erasemode','xor');
xx3 = 0.05*sin(ii);
yy3 = 0.05*cos(ii);
id3 = line(xx3+X(1),yy3+Y(1),'erasemode','xor');

for i=1:N,
    counter = counter-1;
    if counter<=0,
        set(id2,'xdata',[0 X(i)],'ydata',[0 Y(i)]);
        set(id3,'xdata',xx3+X(i),'ydata',yy3+Y(i));
        drawnow;
        pause(0.05);
        counter = skok;
    end
end