% PROBLEMA 21.1 – MÉTODOS DE INTEGRACIÓN NUMÉRICA
% Asesor: Claudio Hiram Carmona Jurado
% Alumno: Jonathan Meixueiro
% Matrícula: 240694

% Evalúa la integral: ∫₀⁴ (1 - e^(-2x)) dx
% Aplicando diferentes reglas numéricas (b-g) y comparando con la solución exacta (a)

% --- Cargar el paquete symbolic si está disponible (requerido para Octave local) ---
% En Octave Online podría no funcionar. Si da error, comentar esta línea y usar el valor manualmente
% pkg load symbolic

% Definir la función
f = @(x) 1 - exp(-2*x);
a = 0;
b = 4;

% --- Valor exacto (inciso a) ---
try
    % Usamos symbolic solo si está disponible
    pkg load symbolic
    syms x
    I_exact = double(int(1 - exp(-2*x), x, a, b));
catch
    % Si symbolic no está disponible (por ejemplo, en Octave Online), usar valor manual
    I_exact = 3.50016773;
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

% --- Inciso e: Simpson 1/3 compuesta n = 4 ---
n4 = 4;
h4 = (b - a)/n4;
x4 = a:h4:b;
fx = arrayfun(f, x4);
I_e = (h4/3)*(fx(1) + 4*sum(fx(2:2:end-1)) + 2*sum(fx(3:2:end-2)) + fx(end));

% --- Inciso f: Simpson 3/8 simple ---
h_38 = (b - a)/3;
x_38 = a:h_38:b;
I_f = (3*h_38/8)*(f(x_38(1)) + 3*f(x_38(2)) + 3*f(x_38(3)) + f(x_38(4)));

% --- Inciso g: Simpson combinado (n = 5) ---
h5 = (b - a)/5;
x5 = a:h5:b;
f5 = arrayfun(f, x5);
% Simpson 3/8: x0 - x3
I_g1 = (3*h5/8)*(f5(1) + 3*f5(2) + 3*f5(3) + f5(4));
% Simpson 1/3: x3 - x5
I_g2 = (h5/3)*(f5(4) + 4*f5(5) + f5(6));
I_g = I_g1 + I_g2;

% --- Función para calcular error relativo porcentual ---
error_rel = @(I_aprox) abs((I_exact - I_aprox)/I_exact) * 100;

% --- Mostrar resultados con formato por inciso ---
fprintf('\n--- Resultados Problema 21.1 ---\n\n');
fprintf('Integral exacta (inciso a): %.8f\n\n', I_exact);

fprintf('Trapecio simple (inciso b): %.8f | Error: %.4f %%\n', I_b, error_rel(I_b));
fprintf('Trapecio compuesta n=2 (inciso c1): %.8f | Error: %.4f %%\n', I_c1, error_rel(I_c1));
fprintf('Trapecio compuesta n=4 (inciso c2): %.8f | Error: %.4f %%\n\n', I_c2, error_rel(I_c2));

fprintf('Simpson 1/3 simple (inciso d): %.8f | Error: %.4f %%\n', I_d, error_rel(I_d));
fprintf('Simpson 1/3 compuesta n=4 (inciso e): %.8f | Error: %.4f %%\n\n', I_e, error_rel(I_e));

fprintf('Simpson 3/8 simple (inciso f): %.8f | Error: %.4f %%\n\n', I_f, error_rel(I_f));

fprintf('Simpson combinado (n=5) (inciso g): %.8f | Error: %.4f %%\n', I_g, error_rel(I_g));