/**
  Funciones necesarias para el programa de los pancakes

  manc UABCS/DSC
*/
  
/*
Voltear  Actúa sobre el arreglo Orden, que indica las posiciones de los pancakes.
*/
void Voltear(int n)
{
  int i,j;
  int t;

  if ( n < 2 )
    return;

  for ( i = 0, j = n-1 ; i<j ; i++,j-- ) {
    t = Orden[i]; //<>//
    Orden[i] = Orden[j];
    Orden[j] = t;
  }
}

/*
Desordenar  Desorganiza los pancakes
*/
void Desordenar(int n)
{
  int r;
  
  for ( ; n>0 ; n-- ) {
    r = 2+int(random(MaxDiscos-1));
    println(r);
    Voltear(r);
  }
}

/*
OrdenCorrecto  verifica que los discos estáne en el orden deseado.
*/
boolean OrdenCorrecto()
{
  int i;
  for ( i=0; i<MaxDiscos ; i++ )
    if ( Orden[i] != i )
      return false;
  return true;
}
