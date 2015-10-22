# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
function [xAGraficar,yAGraficar] = ejercicio2(tensiones,deformaciones,paso)

n = length(tensiones);
[a,b,c,d] = splineCubicoNatural(tensiones,deformaciones)

for i=1:n-1;
    xAGraficar = tensiones(i):paso:tensiones(i+1);
    yAGraficar = a(i) + b(i) * (xAGraficar - tensiones(i)) + c(i) * (xAGraficar - tensiones(i)).^2 + d(i) * (xAGraficar - tensiones(i)).^3;
    hold on;
    title('Interpolacion por splines de grado 3');
    plot(xAGraficar,yAGraficar,'g'); #grafica en color verde
    xlabel('Tension');
    ylabel('Deformacion');
    axis([0,260,-1e-16,1]);
end

endfunction
