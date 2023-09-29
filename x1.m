m = 90;
k1 = 0.35316;
k2 = 35.316;
g = 9.81;
b = (g*k1)/m;

x1 = @(t) (m/k1)*log(cosh((sqrt(b))*t));