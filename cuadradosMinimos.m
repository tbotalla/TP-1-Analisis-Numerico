# Aproximacion por minimos cuadrados a una recta y = m*x + b
# Entrada:
# tensiones = vector fila conteniendo los valores x dato
# deformaciones = vector fila conteniendo los valores y dato
# Precondicion: longitud de tensiones == longitud de deformaciones
# Salida:
# Parametros de la recta m,x

function [b, m] = cuadradosMinimos (tensiones, deformaciones)
  if (length(tensiones) != length(deformaciones))
    fprintf("Las longitudes de los datos no pueden ser diferentes \n");
  else
    [nr, nc] = size(tensiones);
    nx = nr * nc;
    [nr, nc] = size(deformaciones);
    ny = nr * nc;

    n = length(tensiones);

    sx = sum(tensiones); #sumatoria de los valores de tensiones
    sy = sum(deformaciones); #sumatoria de los valores de deformaciones
    sx2 = sum(tensiones .* tensiones); #sumatoria de las tensiones al cuadrado
    sy2 = sum(deformaciones .* deformaciones); #sumatoria de las deformaciones al cuadrado
    sxy = sum(tensiones .* deformaciones); #sumatoria de los productos de tensiones por deformaciones

    det1 = nx * sx2 - sx * sx;
    b = (sy * sx2 - sx * sxy) / det1;
    m = (nx * sxy - sx * sy) / det1;

  endif
endfunction
