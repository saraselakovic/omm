m = 90;
k1 = 0.35316;
k2 = 35.316;
g = 9.81;
a = (m*g)/k1;
b = (g*k1)/m;

v1 = @(t) (sqrt(a))*tanh((sqrt(b))*t);
