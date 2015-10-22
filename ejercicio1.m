# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# paso = distancia entre punto y punto del grafico
# Salida:
# xAGraficar = valores x del grafico
# yAGraficar = valores y del grafico
# Grafica la curva que resulta de interpolar los datos de entrada con el metodo
# de lagrange baricentrico en el intervalo [0..250]
function [xAGraficar,yAGraficar] = ejercicio1(tensiones,deformaciones,paso)

xInicioGrafico = tensiones(1);
xFinGrafico = tensiones(length(tensiones));
xAGraficar = xInicioGrafico:paso:xFinGrafico; #define un vector con puntos desde xInicioGrafico hasta xFinGrafico equiespaciados una distancia paso
yAGraficar = xAGraficar; #genero un vector del mismo tamanio
j=0;
for i=xInicioGrafico:paso:xFinGrafico
    #en cada iteracion se obtiene el resultado de interpolar un valor de tension
    j++;
		yAGraficar(j) = lagrangeBaricentrico(tensiones, deformaciones, i);
end

# Inicio grafico
hold on;
title('Lagrange Baricentrico');
plot(xAGraficar, yAGraficar, 'r'); #grafica en color rojo
xlabel('Tension');
ylabel('Deformacion');
axis([xInicioGrafico,xFinGrafico,-1e-16,1]);
# Fin grafico

endfunction
