function retorno = TP1()

tensiones = [ 0 20 40 60 80 100 120 140 160 180 190 200 210 220 230 240 250 ];
deformaciones = [ 0.0000001 0.00028 0.0005771 0.0008486 0.001155 0.001464 0.001795 0.002427 0.004329 0.01058 0.01899 0.03068 0.05582 0.09165 0.1638 0.2498 0.4484 ]
paso = 0.1;

###################################
###################################
#Ejercicio 1: Lagrange Baricentrico

ejercicio1(tensiones,deformaciones,paso);

####################
####################
#Ejercicio 2: Spline

ejercicio2(tensiones,deformaciones,paso);

#############################
#############################
##Ejercicio 3: Ramberg-Osgood
#a)

E = ejercicio3a(tensiones,deformaciones); #devuelve E=6.8520x10^4 -->OK


#b)

[lnA,B] = ejercicio3b(tensiones,deformaciones,E); #Revisar las cuentas no da bien

#c)












end
