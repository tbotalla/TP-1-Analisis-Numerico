# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# E = modulo de elasticidad tangente al origen
# lnA,B,f02 = parametros de la expresion de Ramberg-Osgood
# Salida:
# Grafico de la expresion de Ramberg-Osgood con los datos obtenidos
# previamente
function [ret] = ejercicio3c(tensiones,deformaciones,E,lnA,B,f02)

  n = length(tensiones);
  xInicioGrafico = tensiones(1);
  xFinGrafico = tensiones(length(tensiones));

  xAGraficar = tensiones;
  for i=1:n;
      #xAGraficar = tensiones(i):0.1:tensiones(i+1);
      yAGraficar(i) = (tensiones(i) / E) + 0.002 * realpow((tensiones(i)/f02),B);
      hold on;
  end

  # Inicio grafico
  title('Expresion de Ramberg-Osgood');
  plot(xAGraficar,yAGraficar,'k'); #grafica en color negro
  xlabel('Tension');
  ylabel('Deformacion');
  axis([xInicioGrafico,xFinGrafico,-1e-16,1]);
  # Fin grafico
endfunction
