# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# x = valor en el que se evalua el polinomio
function Pn = lagrangeBaricentrico(tensiones,deformaciones,x)
	n = length(tensiones); #numero de datos

	#L(x)
	Lx = 1;
	for i=1:n
		Lx = Lx * (x - tensiones(i));
	end

	Pn = 0;#polinomio que sera evaluado en el x recibido a la entrada y sera devuelto como salida
	#Pn(x)
	for i=1:n
		#Calculo del peso baricentrico de la iteracion correspondiente
		Wi = 1;
		for k=1:n
			if(k != i)
				Wi = Wi * (1 / (tensiones(i) - tensiones(k)));
			endif
		end

		#Dos posibilidades: (x == tensiones(i) || x != tensiones(i))
		if (x == tensiones(i)) #con esto se salva la condicion x == tensiones(i) que provoca division por cero
			Pn = Pn + deformaciones(i);
		else
			Pn = Pn + deformaciones(i) * ((Lx * Wi) / (x - tensiones(i)));
		end
	end

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
