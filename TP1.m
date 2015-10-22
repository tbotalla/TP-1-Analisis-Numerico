# Cada funcion corresponde a un item del trabajo practico, las mismas deben ser
# ejecutadas secuencialmente
function retorno = TP1()

#Datos de entrada
tensiones = [ 0 20 40 60 80 100 120 140 160 180 190 200 210 220 230 240 250 ];
deformaciones = [ 0.0000001 0.00028 0.0005771 0.0008486 0.001155 0.001464 0.001795 0.002427 0.004329 0.01058 0.01899 0.03068 0.05582 0.09165 0.1638 0.2498 0.4484 ]
paso = 0.1;

###################################
###################################
#Ejercicio 1: Lagrange Baricentrico

[xAGraficarLagrange, yAGraficarLagrange] = ejercicio1(tensiones,deformaciones,paso);


####################
####################
#Ejercicio 2: Spline

[xAGraficarSPline,yAGraficarSPline] = ejercicio2(tensiones,deformaciones,paso);


############################
############################
#Ejercicio 3: Ramberg-Osgood
#a)Obtencion del modulo de elasticidad tangente al origen utilizando cuadrados minimos

E = ejercicio3a(tensiones,deformaciones);

#b)Aproximacion por cuadrados minimos de exp(lnA + B * log(tensiones10(i))) + (tensiones10(i) / E)
#se implemento aparte la funcion de cuadrados minimos
[lnA,B,f02,xAGraficarCM,yAGraficarCM] = ejercicio3b(tensiones,deformaciones,E);

#c)Expresion de Ramberg-Osgood
ejercicio3c(tensiones,deformaciones,E,lnA,B,f02);


#############################
#############################
#Ejercicio 5: Limite Elastico

ejercicio5(tensiones,deformaciones,paso,f02)


endfunction
