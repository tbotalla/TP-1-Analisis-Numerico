# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# paso = distancia entre punto y punto del grafico
# Salida:
# Deformaciones correspondientes a limite elastico, obtenidas con los distintos
# tipos de interpolacion usados
function [epsilonLagrange,epsilonSpline,epsilonCM] = ejercicio5(tensiones,deformaciones,paso,f02)

n = length(tensiones);

#Lagrange baricentrico
epsilonLagrange = lagrangeBaricentrico(tensiones,deformaciones,f02);

#SPline
[a,b,c,d] = splineCubicoNatural(tensiones,deformaciones)
#f02 = 145.16 y las constantes de los trazadores cubicos que le corresponden para interpolar en el
#intervalo [140..160] son las correspondientes a la posicion 8 de los vectores de constantes

epsilonSpline = a(8) + b(8) * (f02 - tensiones(8)) + c(8) * (f02 - tensiones(8)).^2 + d(8) * (f02 - tensiones(8)).^3;

#Cuadrados Minimos
[b,m] = cuadradosMinimos(tensiones,deformaciones);
epsilonCM = m * f02 + b

endfunction
