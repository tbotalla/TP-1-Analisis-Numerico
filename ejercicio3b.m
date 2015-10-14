#utiliza los ultimos 10 datos y el valor de E obtenido en la parte 3)a)
#para hacer una aproximacion por cuadrados minimos de ln(A) = 0.002/((f0,2)^n) y B = n 
function [lnA,B] = ejercicio3b(tensiones,deformaciones,E)

sumaX = 0;
cuadradoSumaX = 0;
sumaXCuadrado = 0;
for i=(length(tensiones)-10):length(tensiones)
  sumaX = sumaX + tensiones(i);
  sumaXCuadrado = sumaXCuadrado + (tensiones(i) * tensiones(i));
  cuadradoSumaX = (sumaX * sumaX);
endfor

sumaLnY = 0;
for i=(length(tensiones)-10):length(tensiones)
  sumaLnY = sumaLnY + log(deformaciones(i));
endfor

producto = 1;
sumaProducto = 0;
for i=(length(tensiones)-10):length(tensiones)
  producto = tensiones(i) * log(deformaciones(i));
  sumaProducto = sumaProducto + producto;
endfor

B = (10 * sumaProducto - (sumaX * sumaLnY)) / ((10 * sumaXCuadrado) - (cuadradoSumaX));
lnA = ((sumaXCuadrado * sumaLnY) - (sumaProducto * sumaX)) / ((10 * sumaXCuadrado) - (cuadradoSumaX));
#hay que agregar que devuelva f02 para el ejercicio 5

##################################
#Grafico con los valores obtenidos
xAGraficar = tensiones;
for i=1:length(tensiones)
    yAGraficar(i) = exp(lnA + B * log(tensiones(i))) + (tensiones(i) / E);
end
title('Cuadrados Minimos');
plot(xAGraficar, yAGraficar,'-','MarkerEdgeColor','r','LineWidth',0.5); #grafica en color rojo, con ancho de linea=0.5);

endfunction
