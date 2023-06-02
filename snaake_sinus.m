clear
x = 0
y = sin(x);
y1 = sin(x + 0.5);
y2 = sin(x + 1);
y3 = sin(x + 1.5);
y4 = sin(x + 2);
h = plot(x + 0.5 * cos(0:0.001:2 * pi), y + 0.5 * sin(0:0.001:2 * pi))
hold on;
h1 = plot(x + 0.5 + 0.5 * cos(0:0.001:2 * pi), y1 + 0.5 * sin(0:0.001:2 * pi))
hold on;
h2 = plot(x + 1 + 0.5 * cos(0:0.001:2 * pi), y2 + 0.5 * sin(0:0.001:2 * pi))
hold on;
h3 = plot(x + 1.5 + 0.5 * cos(0:0.001:2 * pi), y3 + 0.5 * sin(0:0.001:2 * pi))
hold on;
h4 = plot(x + 2 + 0.5 * cos(0:0.001:2 * pi), y4 + 0.5 * sin(0:0.001:2 * pi))
hold on;

axis([0, 20, -2, 20]);
for k = 0:0.1:20
  y = sin(k);
  y1 = sin(k + 0.5);
  y2 = sin(k + 1);
  y3 = sin(k + 1.5);
  y4 = sin(k + 2);
  set(h, 'XData', k + 0.5 * cos(0:0.001:2 * pi), 'YData', y + 0.5 * sin(0:0.001:2 * pi));
  set(h1, 'XData', k + 0.5 + 0.5 * cos(0:0.001:2 * pi), 'YData', y1 + 0.5 * sin(0:0.001:2 * pi));
  set(h2, 'XData', k + 1 + 0.5 * cos(0:0.001:2 * pi), 'YData', y2 + 0.5 * sin(0:0.001:2 * pi));
  set(h3, 'XData', k + 1.5 + 0.5 * cos(0:0.001:2 * pi), 'YData', y3 + 0.5 * sin(0:0.001:2 * pi));
  set(h4, 'XData', k + 2 + 0.5 * cos(0:0.001:2 * pi), 'YData', y4 + 0.5 * sin(0:0.001:2 * pi));
  pause(0.05);
  drawnow
endfor

