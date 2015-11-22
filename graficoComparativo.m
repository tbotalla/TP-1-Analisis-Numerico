
function [ret] = graficoComparativo(tensiones,deformaciones,paso)

# Gráfico de los Puntos Dato
title('Grafico comparativo de los resultados');
plot(tensiones,deformaciones,'kx','markersize',10, 'linewidth', 1.5);
xlabel('Tension');
ylabel('Deformacion');
hold on;
# Fin gráfico

# Gráfico de Lagrange Baricentrico
ejercicio1(tensiones,deformaciones,paso)
# Fin gráfico

# Grafico de splines
ejercicio2(tensiones,deformaciones,paso)
# Fin gráfico

# Grafico de Cuadrados Mínimos
ejercicio3b(tensiones,deformaciones,ejercicio3a(tensiones,deformaciones))
# Fin gráfico

title('Grafico comparativo de los resultados');

endfunction
