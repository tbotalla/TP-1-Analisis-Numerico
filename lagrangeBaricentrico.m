% xPuntos = vector fila conteniendo los valores x dato
% yPuntos = vector fila conteniendo los valores y dato
% x = valor en el que se evalua el polinomio
function Pn = lagrangeBaricentrico(xPuntos,yPuntos,x)
	Pn = 0; %polinomio evaluado en el x dado para ser devuelto por la funcion
	n = length(xPuntos); %numero de datos

	%L(x)
	Lx = 1;
	for i=1:n
		Lx = Lx * (x - xPuntos(i));
	end

	%Pn(x)
	for i=1:n
		%Calculo del peso baricentrico de la iteracion correspondiente
		Wi = 1;
		for k=1:n
			if(k != i)
				Wi = Wi * (1 / (xPuntos(i) - xPuntos(k))); 
			endif
		end
		
		Pn = Pn + yPuntos(i) * ((Lx * Wi) / (x - xPuntos(i)));
	end
end


%ejemplo con el que lo probe; 
% xPuntos = [ 1 2 3 4 ]
% yPuntos = [ 1 2 3 4 ]
% lagrangeBaricentrico(xPuntos,yPuntos,5)
% la interpolacion devuelve Pn(x=5) = 5

