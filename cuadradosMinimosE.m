function E = cuadradosMinimosE(tensiones,deformaciones)

sumaX = 0;
cuadradoSumaX = 0;
sumaXCuadrado = 0;
for i=1:6
  sumaX = sumaX + tensiones(i);
  sumaXCuadrado = sumaXCuadrado + (tensiones(i) * tensiones(i));
  cuadradoSumaX = (sumaX * sumaX);
endfor

sumaY = 0;
for i=1:6
  sumaY = sumaY + deformaciones(i);
endfor

producto = 1;
sumaProducto = 0;
for i=1:6
  producto = tensiones(i) * deformaciones(i);
  sumaProducto = sumaProducto + producto;
endfor

invE = (6 * sumaProducto - (sumaX * sumaY)) / ((6 * sumaXCuadrado) - cuadradoSumaX);
E = 1 / invE;

endfunction