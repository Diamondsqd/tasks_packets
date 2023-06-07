function poverh_normal(func_s, x0, y0)
  #pover_normal_1("20 - x.^2 - y.^2", -2, -2)
  #func_s - функция ввиде строки, x0 y0 - точка, в которой строится нормаль
  x = -pi:0.1:pi;
  y = -pi:0.1:pi;
  [X, Y] = meshgrid(x, y);
  f = str2func(strcat("@(x, y)", func_s));
  Z = f(X, Y);
  surf(X, Y, Z);
  shading interp;
  hold on;
  z0 = f(x0, y0);
  h = 0.000001;
  xx = (f(x0 + h, y0) - f(x0, y0)) / h;
  yy = (f(x0, y0 + h) - f(x0, y0)) / h;
  ed = sqrt(xx * xx + yy * yy + 1);
  x_norm = [x0, x0 - xx / ed];
  y_norm = [y0, y0 - yy / ed];
  z_norm = [z0, z0 + 1 / ed];
  plot3(x_norm, y_norm, z_norm);
endfunction
