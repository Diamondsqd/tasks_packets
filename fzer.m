clear
a = -10;
b = 10;
m = 100;
x = linspace(a, b, m);
plot(x, 1 + (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2);
hold on
plot(x, x * 0);
x = ginput(1);
ans = fzero(@(x) 1 + (1 + sin(x) - cos(x)).^2 - (sin(2*x) - cos(2*x) - 0.2).^2, x)
a_true = -5;
b_true = 5;
ans1 = [];
k = 0;
tec_time = time()
for kk = -5:0.1:5
  a = kk;
  b = b_true;
  x0 = a;
  x1 = b;
  while (abs(x1 - x0) /2 > 0.001)
    x = (x1 + x0) / 2;
    if (func(x) * func(x0) < 0)
      x1 = x;
    else
      x0 = x;
    endif
  endwhile
  x1 = (x0 + x1) / 2;
  f1 = 1;
  for i = 1:1:k
    if (abs(x1 - ans1(i)) < 0.001 | abs(func(x1)) > 0.001)
      f1 = 0;
    endif
  endfor
  if (f1 == 1)
    ans1(end + 1) = x1;
    k += 1;
  endif
endfor;
time_del = time() - tec_time;
ans2 = [];
k = 0;
tec_time = time()
for kk = -5:0.1:5
a = kk;
b = b_true;
x0 = a;
x1 = b;
while (abs(x1 - x0) > 0.001)
  x1 = x0;
  x0 = x0 - func(x0) / diff(x0);
  if (x0 >= a && x0 <= b)
    if (func(a) * func(x0) < 0)
      b = x0;
    else
      a = x0;
    endif
  else
    while (x0 < a | x0 > b)
      x0 = (a + b) / 2;
    endwhile
    if (func(a) * func(x0) < 0)
      b = x0;
    else
      a = x0;
    endif
  endif
endwhile
  f1 = 1;
  for i = 1:1:k
    if (abs(x1 - ans2(i)) < 0.001 | abs(func(x1)) > 0.001)
      f1 = 0;
    endif
  endfor
  if (f1 == 1)
    ans2(end + 1) = x1;
    k += 1;
  endif
endfor
time_newthon = time() - tec_time;
for i = 1:1:k
  plot(ans2(i), 0, 'kx');
endfor
