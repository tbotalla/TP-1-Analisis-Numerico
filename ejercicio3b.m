# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# E = modulo de elasticidad tangente al origen
# Salida:
# xAGraficar = valores x del grafico
# yAGraficar = valores y del grafico
# lnA,B,f02 = parametros de la expresion de Ramberg-Osgood
# Utiliza los ultimos 10 datos y el valor de E obtenido en la parte 3)a)
# para hacer una aproximacion por cuadrados minimos de exp(lnA + B * log(tensiones10(i))) + (tensiones10(i) / E)
function [lnA,B,f02,xAGraficar,yAGraficar] = ejercicio3b(tensiones,deformaciones,E)

xInicioGrafico = tensiones(1);
xFinGrafico = tensiones(length(tensiones));

#Tomo los ultimos 10 pares de datos
tensiones10 = [ 140 160 180 190 200 210 220 230 240 250 ];
deformaciones10 = [ 0.002427 0.004329 0.01058 0.01899 0.03068 0.05582 0.09165 0.1638 0.2498 0.4484 ];

sumaLnX = 0;
cuadradoSumaLnX = 0;
sumaLnXCuadrado = 0;

for i=1:length(tensiones10)
  sumaLnX = sumaLnX + log(tensiones10(i));
  lnXCuadrado = log(tensiones10(i)) * log(tensiones10(i));
  sumaLnXCuadrado = sumaLnXCuadrado + lnXCuadrado;
  cuadradoSumaLnX = (sumaLnX * sumaLnX);
endfor

sumaLnY = 0;

for i=1:length(tensiones10)
  sumaLnY = sumaLnY + log(deformaciones10(i));
endfor

producto = 1;
sumaProducto = 0;

for i=1:length(tensiones10)
  producto = log(tensiones10(i)) * log(deformaciones10(i));
  sumaProducto = sumaProducto + producto;
endfor

#Retorno
B = (10 * sumaProducto - (sumaLnX * sumaLnY)) / ((10 * sumaLnXCuadrado) - (cuadradoSumaLnX));
lnA = ((sumaLnXCuadrado * sumaLnY) - (sumaProducto * sumaLnX)) / ((10 * sumaLnXCuadrado) - (cuadradoSumaLnX));
f02 = nthroot((0.002)/(exp(lnA)),B); #computa la raiz B-esima de 0.002/A

# Inicio grafico
xAGraficar = tensiones10;
for i=1:length(xAGraficar)
    yAGraficar(i) = exp(lnA + B * log(tensiones10(i))) + (tensiones10(i) / E);
    hold on;
end

title('Cuadrados Minimos');
plot(xAGraficar, yAGraficar,'--m','linewidth', 2.5); #grafica en color magenta con ancho de linea 3
xlabel('Tension');
ylabel('Deformacion');
axis([xInicioGrafico,xFinGrafico,-1e-16,1]);
# Fin grafico
endfunction
