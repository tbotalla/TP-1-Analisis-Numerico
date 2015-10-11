function [A,B]=spline(x,y)
X=[x;y];
tam=length(X(1,:));

for i=1:tam;
    coeficientes(i,1)=X(2,i);
end

for i=1:tam-1;
    AL(i)=X(1,i+1)-X(1,i);
end

for i=2:tam-1;
    alfa(i)=3/AL(i)*(coeficientes(i+1,1)-coeficientes(i,1))-3/AL(i-1)*(coeficientes(i,1)-coeficientes(i-1,1));
end

LB(1)=1;
NIU(1)=0;
FIN(1)=0;

for i=2:tam-1;
    LB(i)=2*(X(1,i+1)-X(1,i-1))-AL(i-1)*NIU(i-1);
    NIU(i)=AL(i)/LB(i);
    FIN(i)=(alfa(i)-AL(i-1)*FIN(i-1))/LB(i);
end

LB(tam)=1;
FIN(tam)=0;
coeficientes(tam,3)=0;

for i=tam-1:-1:1;
    coeficientes(i,3)=FIN(i)-NIU(i)*coeficientes(i+1,3);
    coeficientes(i,2)=(coeficientes(i+1,1)-coeficientes(i,1))/AL(i)-AL(i)*(coeficientes(i+1,3)+2*coeficientes(i,3))/3;
    coeficientes(i,4)=(coeficientes(i+1,3)-coeficientes(i,3))/(3*AL(i));
end
coeficientes
  for i=1:tam-1;
      title('TRAZADOR CUBICO SPLINES');
      x=X(1,i):0.1:X(1,i+1);
      y=coeficientes(i,1)+coeficientes(i,2)*(x-X(1,i))+coeficientes(i,3)*(x-X(1,i)).^2+coeficientes(i,4)*(x-X(1,i)).^3;
      hold on;
      plot(x,y,'b');
  end
