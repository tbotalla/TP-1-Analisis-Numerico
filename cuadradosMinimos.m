  function [b, m] = cuadradosMinimos (tensiones, deformaciones)
  #Ajuste de minimos cuadrados a una recta y = b + m*x
  #Datos: tensiones y deformaciones son vectores de igual dimension con los datos
  #Salida: Parametros de la recta m,x

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
