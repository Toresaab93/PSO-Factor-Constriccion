clc; clear; close all;

N = 10;                  
iterMax = 50;             
xmin = -10; xmax = 10;    

phi1 = 2.05;
phi2 = 2.05;
phi = phi1 + phi2;

chi = 2 / (phi - 2 + sqrt(phi^2 - 4*phi));

x = xmin + (xmax - xmin).*rand(1, N);  
v = zeros(1, N);                      
pbest = x;                             
pbest_val = 9 - (x - 3).^2;           

[gbest_val, idx] = max(pbest_val);
gbest = pbest(idx);

hist_best = zeros(1, iterMax);        

for t = 1:iterMax
    r1 = rand(1, N);
    r2 = rand(1, N);

    v = chi * ( v + phi1 .* r1 .* (pbest - x) + phi2 .* r2 .* (gbest - x) );
    
    x = x + v;
    
    x(x < xmin) = xmin;
    x(x > xmax) = xmax;
    
    fx = 9 - (x - 3).^2;
    
    mejor = fx > pbest_val;
    pbest(mejor) = x(mejor);
    pbest_val(mejor) = fx(mejor);
    
    [valor_max, idx] = max(pbest_val);
    if valor_max > gbest_val
        gbest_val = valor_max;
        gbest = pbest(idx);
    end
    
    hist_best(t) = gbest_val;
    
    fprintf('Iteración %d: Mejor global = %.4f, f(gbest) = %.4f\n', t, gbest, gbest_val);
end

fprintf('\n========== RESULTADO FINAL ==========\n');
fprintf('Mejor posición encontrada: x = %.4f\n', gbest);
fprintf('Valor máximo aproximado: f(x) = %.4f\n', gbest_val);

figure;
plot(1:iterMax, hist_best, 'b-', 'LineWidth', 2);
xlabel('Iteración');
ylabel('Mejor valor global');
title('Convergencia PSO con Factor de Constricción');
grid on;

X = linspace(xmin, xmax, 500);
Y = 9 - (X - 3).^2;

figure;
plot(X, Y, 'r-', 'LineWidth', 2); hold on;
scatter(x, 9 - (x - 3).^2, 'bo', 'filled');
scatter(gbest, gbest_val, 80, 'g', 'filled', 'p');
xlabel('x');
ylabel('f(x)');
title('Posiciones finales de las partículas');
legend('f(x)','Partículas finales','Mejor solución');
grid on;
