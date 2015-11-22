# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# paso = distancia entre punto y punto del grafico
# Salida:
# xAGraficar = valores x del grafico
# yAGraficar = valores y del grafico
function [xAGraficar,yAGraficar] = ejercicio2(tensiones,deformaciones,paso)

n = length(tensiones);
xInicioGrafico = tensiones(1);
xFinGrafico = tensiones(length(tensiones));

[a,b,c,d] = splineCubicoNatural(tensiones,deformaciones)

# Inicio grafico
for i=1:n-1;
    xAGraficar = tensiones(i):paso:tensiones(i+1);
    yAGraficar = a(i) + b(i) * (xAGraficar - tensiones(i)) + c(i) * (xAGraficar - tensiones(i)).^2 + d(i) * (xAGraficar - tensiones(i)).^3;
    hold on;
    title('Interpolacion por splines de grado 3');
    plot(xAGraficar,yAGraficar,'--g','linewidth', 2.5); #grafica en color verde con ancho de linea 3
    xlabel('Tension');
    ylabel('Deformacion');
    axis([xInicioGrafico,xFinGrafico,-1e-16,1]);
end
# Fin grafico

endfunction
