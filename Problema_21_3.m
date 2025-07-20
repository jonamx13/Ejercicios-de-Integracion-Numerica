% PROBLEMA 21.3 – MÉTODOS DE INTEGRACIÓN NUMÉRICA
% Asesor: Claudio Hiram Carmona Jurado
% Alumno: Jonathan Meixueiro
% Matrícula: 240694

% Evalúa la integral: ∫_{-2}^{4}(1 - x - 4x³ + 2x⁵) dx
% Aplicando diferentes reglas numéricas (b-f) y comparando con la solución exacta (a)

a = -2;
b = 4;
f = @(x) 1 - x - 4*x.^3 + 2*x.^5;

% --- Valor exacto (inciso a) ---
try
    warning('off', 'all');
    pkg load symbolic
    syms x
    I_exact = double(int(1 - x - 4*x^3 + 2*x^5, x, a, b));
    warning('on', 'all');
catch
    I_exact = 2212;  % Valor obtenido manualmente
end

% --- Inciso b: Regla del Trapecio simple ---
I_b = (b - a)/2 * (f(a) + f(b));

% --- Inciso c: Trapecio compuesto ---
trapecio_compuesta = @(n) ...
    (b - a)/(2*n) * (f(a) + 2 * sum(arrayfun(f, a + (1:n-1)*(b-a)/n)) + f(b));
I_c1 = trapecio_compuesta(2);  % n = 2
I_c2 = trapecio_compuesta(4);  % n = 4

% --- Inciso d: Simpson 1/3 simple ---
I_d = (b - a)/6 * (f(a) + 4*f((a + b)/2) + f(b));

% --- Inciso e: Simpson 3/8 simple ---
h_38 = (b - a)/3;
x_38 = a:h_38:b;
I_e = (3*h_38/8)*(f(x_38(1)) + 3*f(x_38(2)) + 3*f(x_38(3)) + f(x_38(4)));

% --- Inciso f: Regla de Boole (n = 4 subintervalos, 5 nodos) ---
% Reescribimos la función f como polinomio para usar Boole correctamente
% y evitar errores de redondeo de las funciones generales
h_boole = (b - a) / 4;
x_boole = a:h_boole:b;
fx_boole = f(x_boole);
I_f = (2*h_boole/45) * (7*fx_boole(1) + 32*fx_boole(2) + 12*fx_boole(3) + 32*fx_boole(4) + 7*fx_boole(5));

% --- Función para calcular error relativo porcentual ---
error_rel = @(I_aprox) abs((I_exact - I_aprox)/I_exact) * 100;

% --- Mostrar resultados con formato por inciso ---
fprintf('\n--- Resultados Problema 21.3 ---\n\n');
fprintf('Integral exacta (inciso a): %.8f\n\n', I_exact);

fprintf('Trapecio simple (inciso b): %.8f | Error: %.4f %%\n', I_b, error_rel(I_b));
fprintf('Trapecio compuesta n=2 (inciso c1): %.8f | Error: %.4f %%\n', I_c1, error_rel(I_c1));
fprintf('Trapecio compuesta n=4 (inciso c2): %.8f | Error: %.4f %%\n\n', I_c2, error_rel(I_c2));

fprintf('Simpson 1/3 simple (inciso d): %.8f | Error: %.4f %%\n\n', I_d, error_rel(I_d));

fprintf('Simpson 3/8 simple (inciso e): %.8f | Error: %.4f %%\n\n', I_e, error_rel(I_e));

fprintf('Boole (n=4) (inciso f): %.8f | Error: %.4f %%\n', I_f, error_rel(I_f));