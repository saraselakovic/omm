function [] = visine(H_start, H_step, H_end) %napomena: kod za iscrtavanje grafika nalazi se u komenaru na linijama 99,100,101,102
  v1
  x1
  m = 90;
  k1 = 0.35316;
  k2 = 35.316;
  g = 9.81;
  a = (m*g)/k2;
  b = (g*k2)/m;
  c = k2/(m*g);

  HS = [H_start:H_step:H_end];
  hs = [];

  x22 = @(t) (m/k2)*log(cosh((sqrt(b))*t));
  v22 = @(t) (sqrt(a))*tanh((sqrt(b))*t);

  for H = H_start:H_step:H_end
    tdmaxs = [];
    tumins = [];

    if H < 5.202
      h = 0;
    else
      for td = 0:0.5:300

        v11 = v1(td);
        x11 = x1(td);
        h = H - x11;

        v2 = @(x) (sqrt(a))*coth((sqrt(b))*x + acoth((sqrt(c))*v11));
        x2 = @(x) (m/k2)*log((sinh((sqrt(b))*x + acoth((sqrt(c))*v11)))/(sinh(acoth((sqrt(c))*v11))));

        if v11 < 5
          eq1 = @(t) h-x22(t);
          options = optimset('TolX',1e-3);
          tu = fsolve(eq1,10,options);
          v2_tu = v22(tu);
        else
          eq1 = @(t) h-x2(t);
          options = optimset('TolX',1e-3);
          tu = fsolve(eq1,10,options);
          v2_tu = v2(tu);
        endif

        if (v2_tu > 10)
          break;
        elseif (v2_tu <= 10)
          tdmaxs = [tdmaxs td];
          tumins = [tumins tu];
        endif
      endfor

      [tdmax,i] = max(tdmaxs);
      tumin = tumins(i);

      tdmaxs = [];
      tumins = [];

      for td = tdmax:0.001:tdmax+0.5

        v11 = v1(td);
        x11 = x1(td);
        h = H - x11;

        v2 = @(x) (sqrt(a))*coth((sqrt(b))*x + acoth((sqrt(c))*v11));
        x2 = @(x) (m/k2)*log((sinh((sqrt(b))*x + acoth((sqrt(c))*v11)))/(sinh(acoth((sqrt(c))*v11))));

        if (v11 < 5)
          eq1 = @(t) h-x22(t);
          options = optimset('TolX',1e-3);
          tu = fsolve(eq1,10,options);
          v2_tu = v22(tu);
        else
          eq1 = @(t) h-x2(t);
          options = optimset('TolX',1e-3);
          tu = fsolve(eq1,10,options);
          v2_tu = v2(tu);
        endif

        if (v2_tu > 10)
          break;
        elseif (v2_tu <= 10)
          tdmaxs = [tdmaxs td];
          tumins = [tumins tu];
        endif
      endfor

      [tdmax,i] = max(tdmaxs);
      tumin = tumins(i);
      h = H - x1(tdmax);
    endif

    hs = [hs h];

endfor

 results = [HS; hs]
 
 plot(HS(:),hs(:))
 title('Зависност h од H')
 xlabel('H [m]')
 ylabel('h [m]', 'Color','r')

endfunction