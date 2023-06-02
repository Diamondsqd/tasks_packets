function retval = diff (x)
  retval = (func(x + 0.000001) - func(x)) / 0.000001
endfunction
