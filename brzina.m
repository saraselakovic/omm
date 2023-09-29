function [v] = brzina(tt,tdmax,tumin)
  m = 90;
  k1 = 0.35316;
  k2 = 35.316;
  g = 9.81;
  a1 = (m*g)/k1;
  b1 = (g*k1)/m;
  a2 = m*g/k2;
  b2 = g*k2/m;
  c2 = k2/(m*g);
  
  v1 = @(t) (sqrt(a1))*tanh((sqrt(b1))*t);
  v2 = @(td,t) sqrt(a2)*coth(sqrt(b2)*t+acoth(sqrt(c2)*v1(td)));
  v22 = @(t) (sqrt(a2))*tanh((sqrt(b2))*t);
  
  if (tdmax<0.511 && tt>tdmax)
    v = v22(tt-tdmax);
  elseif (tt<=tdmax)
    v = v1(tt);
  else
    v = v2(tdmax,tt-tdmax);
  endif

endfunction