function [lnA,B] = cuadradosMinimosA(tensiones,deformaciones)

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

endfunction
