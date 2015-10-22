# Trazador cubico natural con frontera libre (S''(Xo)=S''(Xn)=0)
# Basado en la implementacion del libro Analisis Numerico Richard Burden J. Douglas Faires
# Entrada:
# tensiones = vector con los valores de las abscisas; deformaciones = vector con los valores de las ordenadas
# Precondicion: longitud de tensiones == longitud de deformaciones
# Salida:
# a,b,c,d vectores con las constantes correspondientes a cada trazador cubico
function [a,b,c,d] = splineCubicoNatural(tensiones,deformaciones)

if (length(tensiones) != length(deformaciones))
  fprintf("Las longitudes de los datos no pueden ser diferentes \n");
else
n=length(tensiones);

#Paso 0
for i=1:n;
    a(i)=deformaciones(i);
end

#Paso 1
for i=1:n-1
  h(i) = tensiones(i+1) - tensiones(i);
endfor

#Paso 2
for i=2:n-1
  alfa(i) = (3/h(i)) * (a(i+1) - a(i)) - (3/h(i-1))*(a(i)-a(i-1));
endfor

#Paso 3
l(1) = 1;
mu(1) = 0;
z(1) = 0;

#Paso 4
for i=2:n-1
  l(i) = 2 * (tensiones(i+1) - tensiones(i-1)) - h(i-1) * mu(i-1);
  mu(i) = h(i) / l(i);
  z(i) = (alfa(i) - h(i-1) * z(i-1)) / l(i);
endfor

#Paso 5
l(n) = 1;
z(n) = 0;
c(n) = 0;

#Paso 6
for j=n-1:-1:1
  c(j) = z(j) - mu(j) * c(j+1);
  b(j) = (a(j+1) - a(j)) / h(j) - h(j) * (c(j+1) + 2 * c(j)) / 3;
  d(j) = (c(j+1) - c(j)) / (3 * h(j));
endfor

#Paso 7
#Salida
#Si se quiere ver por pantalla los resultados de las constantes a,b,c,d: descomentar las siguientes 4 lineas
#a
#b
#c
#d

endif
endfunction
