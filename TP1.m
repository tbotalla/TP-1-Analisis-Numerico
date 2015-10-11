function retorno = TP1()

tensiones = [ 0 20 40 60 80 100 120 140 160 180 190 200 210 220 230 240 250 ];
deformaciones = [ 0.0000001 0.00028 0.0005771 0.0008486 0.001155 0.001464 0.001795 0.002427 0.004329 0.01058 0.01899 0.03068 0.05582 0.09165 0.1638 0.2498 0.4484 ]
paso = 0.3;
deltaCota = 10;

####################################
####################################
#Ejercicio 1: Lagrange Baricentrico#
#lagrangeBaricentrico(tensiones, deformaciones, xAInterpolar)

#Grafico de la interpolacion por el metodo de Lagrange Baricentrico en el intervalo  [0-deltaCota..250+deltaCota] con paso 0.3
xInicioGrafico = tensiones(1) - deltaCota;
xFinGrafico = tensiones(length(tensiones)) + deltaCota;
xAGraficar = xInicioGrafico:paso:xFinGrafico; #define un vector con puntos desde xInicioGrafico hasta xFinGrafico equiespaciados una distancia paso
yAGraficar = xAGraficar; #hardcodeado para que genere un vector del mismo tamanio
j=0;
for i=xInicioGrafico:xFinGrafico
    j++;
		yAGraficar(j) = lagrangeBaricentrico(tensiones, deformaciones, i);
end
title('Lagrange Baricentrico');
plot(xAGraficar, yAGraficar,'-','MarkerEdgeColor','r','LineWidth',0.5); #grafica en color rojo, con ancho de linea=0.5);
#Fin grafico

####################################
####################################
#Ejercicio 2: Spline
splineCubicoNatural(tensiones,deformaciones); #la funcion ya grafica el resultado

####################################
####################################
##Ejercicio 3: Ramberg-Osgood
#a)
cuadradosMinimosE(tensiones,deformaciones);
#devuelve E=6.8520x10^4 esta bien? (no hice las cuentas)
#b)













end
