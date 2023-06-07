function retval = maytnik(l, ugol_st, speed, iter)
  #maytnik(5, 1, 1, 10)
  #l - длина маятница
  #ugol_st - начальный угол
  #speed - скорость
  #iter - время анимации
  g = 9.81;
  time = 0:0.01:iter;
  [t, ugol] = ode45(@(time, y) [y(2); -g/l * sin(y(1))], time, [ugol_st, speed]);
  x = l * sin(ugol);
  y = -l * cos(ugol);
  figure;
  axis([-l - 2, l + 2, -l - 2, l + 2]);
  hold on;
  lin = line('XData', [0, x(1)], 'YData', [0, y(1)]);
  ball = line('XData', x(1),'YData', y(1), 'Marker', 'o');
  for i = 2:iter * 100;
    set(lin, 'XData', [0, x(i)], 'YData', [0, y(i)]);
    set(ball, 'XData', x(i), 'YData', y(i));
    drawnow;
  endfor
endfunction
