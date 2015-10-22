# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# x = valor en el que se evalua el polinomio (x a interpolar)
# devuelve el resultado de la interpolacion en el x dado
function Pn = lagrangeBaricentrico(tensiones,deformaciones,x)

	if (length(tensiones) != length(deformaciones))
		fprintf("Las longitudes de los datos no pueden ser diferentes \n");
	else
		n = length(tensiones);#numero de datos

		#L(x)
		Lx = 1;
		for i=1:n
			Lx = Lx * (x - tensiones(i));
		endfor

		#Pn(x) <-- polinomio interpolante
		Pn = 0;
		for i=1:n
			#Calculo del peso baricentrico de la iteracion correspondiente
			Wi = 1; # <-- peso baricentrico
			for k=1:n
				if(k != i)
					Wi = Wi * (1 / (tensiones(i) - tensiones(k)));
				endif
			endfor
			#Fin calculo del peso baricentrico

			#Dos posibilidades: (x == tensiones(i) || x != tensiones(i))
			if (x == tensiones(i)) #con esto se salva la condicion x == tensiones(i) que provoca division por cero
				Pn = Pn + deformaciones(i);
			else
				Pn = Pn + deformaciones(i) * ((Lx * Wi) / (x - tensiones(i)));
			endif
		endfor
	endif
endfunction
