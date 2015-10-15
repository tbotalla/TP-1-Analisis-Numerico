
function [ret] = ejercicio3c(tensiones,deformaciones,E,lnA,B,f02)

  n = length(tensiones);
  xAGraficar = tensiones;
  for i=1:n;
      #xAGraficar = tensiones(i):0.1:tensiones(i+1);
      yAGraficar(i) = (tensiones(i) / E) + 0.002 * realpow((tensiones(i)/f02),B);
      hold on;
  end
  #xAGraficar
  #yAGraficar

  title('Expresion de Ramberg-Osgood');
  plot(xAGraficar,yAGraficar,'-','MarkerEdgeColor','r'); #grafica en color rojo, con ancho de linea=0.5

endfunction
