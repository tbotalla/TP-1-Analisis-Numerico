# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# Salida:
# E = modulo de elasticidad tangente al origen calculado por aproximacion
# por cuadrados minimos con los primeros 6 datos
function [ E ] = ejercicio3a(tensiones,deformaciones)

tensiones6 = [ 0 20 40 60 80 100 ];
deformaciones6 = [ 0.0000001 0.00028 0.0005771 0.0008486 0.001155 0.001464 ];

[b, m] = cuadradosMinimos(tensiones6,deformaciones6);

E = 1 / m;

endfunction
