# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
function uno = ejercicio1(tensiones,deformaciones,paso)

#Grafico de la interpolacion por el metodo de Lagrange Baricentrico en el intervalo  [0..250] con paso pasado por parametro
xInicioGrafico = tensiones(1);
xFinGrafico = tensiones(length(tensiones));
xAGraficar = xInicioGrafico:paso:xFinGrafico; #define un vector con puntos desde xInicioGrafico hasta xFinGrafico equiespaciados una distancia paso
yAGraficar = xAGraficar; #genero un vector del mismo tamanio
j=0;
for i=xInicioGrafico:paso:xFinGrafico
    j++;
		yAGraficar(j) = lagrangeBaricentrico(tensiones, deformaciones, i);
end

title('Lagrange Baricentrico');
plot(xAGraficar, yAGraficar,'-','MarkerEdgeColor','r','LineWidth',0.5); #grafica en color rojo, con ancho de linea=0.5);
xlabel('Tension');
ylabel('Deformacion');
#Fin grafico

endfunction
