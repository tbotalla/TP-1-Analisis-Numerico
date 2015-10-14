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


#ejemplo con el que lo probe;
# tensiones = [ 1 2 3 4 ]
# deformaciones = [ 1 2 3 4 ]
# lagrangeBaricentrico(tensiones,deformaciones,5)
# la interpolacion devuelve Pn(x=5) = 5

#otro ejemplo
#tensiones = [ 0 20 40 60 80 100 120 140 160 180 190 200 210 220 230 240 250 ]
#deformaciones = [ 0.0000001 0.00028 0.0005771 0.0008486 0.001155 0.001464 0.001795 0.002427 0.004329 0.01058 0.01899 0.03068 0.05582 0.09165 0.1638 0.2498 0.4484 ]
#lagrangeBaricentrico(tensiones,deformaciones,120)
#la interpolacion devuelve Pn(x=120) = 0.0017950
