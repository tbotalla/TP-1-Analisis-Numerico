#utiliza los ultimos 10 datos y el valor de E obtenido en la parte 3)a)
#para hacer una aproximacion por cuadrados minimos de ln(A) = 0.002/((f0,2)^n) y B = n
function [lnA,B] = ejercicio3b(tensiones,deformaciones,E)

sumaLnX = 0;
cuadradoSumaLnX = 0;
sumaLnXCuadrado = 0;
for i=(length(tensiones)-10):length(tensiones)
  sumaLnX = sumaLnX + log(tensiones(i));
  lnXCuadrado = log(tensiones(i)) * log(tensiones(i));
  sumaLnXCuadrado = sumaLnXCuadrado + lnXCuadrado;
  cuadradoSumaLnX = (sumaLnX * sumaLnX);
endfor

sumaLnY = 0;
for i=(length(tensiones)-10):length(tensiones)
  sumaLnY = sumaLnY + log(deformaciones(i));
endfor

producto = 1;
sumaProducto = 0;
for i=(length(tensiones)-10):length(tensiones)
  producto = log(tensiones(i)) * log(deformaciones(i));
  sumaProducto = sumaProducto + producto;
endfor

B = (10 * sumaProducto - (sumaLnX * sumaLnY)) / ((10 * sumaLnXCuadrado) - (cuadradoSumaLnX));
lnA = ((sumaLnXCuadrado * sumaLnY) - (sumaProducto * sumaLnX)) / ((10 * sumaLnXCuadrado) - (cuadradoSumaLnX));
#hay que agregar que devuelva f02 para el ejercicio 5

##################################
#Grafico con los valores obtenidos
#xAGraficar = tensiones;
xAGraficar = [ 140 160 180 190 200 210 220 230 240 250 ];
#xAGraficar
for i=1:length(xAGraficar)
    yAGraficar(i) = exp(lnA + B * log(tensiones(i))) + (tensiones(i) / E);
    #yAGraficar(i) = (lnA + B * log(tensiones(i))) ;
end
#yAGraficar
title('Cuadrados Minimos');
plot(xAGraficar, yAGraficar,'-','MarkerEdgeColor','r','LineWidth',0.5); #grafica en color rojo, con ancho de linea=0.5);


endfunction
