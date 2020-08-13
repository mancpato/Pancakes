/**
 * Pancakes. Número fijado en 6.
 *
 * Programa de ejemplo para IA I.
 *  
 * manc, 2019, DASC-UABCS.
 */
  
void setup() {
  size(800, 600);  // Size must be the first statement
  frameRate(30);
  MaxDiscos=5;
  Desordenar(20);
}

int MaxMovs = 64;
int MaxDiscos;

int PancakesInvertidos=-1;
int Jugadas[] = new int[MaxMovs];
int Movimientos = 0;
int Orden[]  = { 0,  1,  2,  3,  4,  5};
int Centrox = 100;
int Centroy = 250;
int Alto = 20;
int Ancho[]  ={ 25, 40, 60, 80,100,  0};
int Color[]  ={  0, 60,120,180,240,300};
char Numero[]={'1','2','3','4','5','6'};

void draw() 
{
  background(50);
  
  colorMode(HSB,360,100,100);
  rectMode(CENTER);
  strokeWeight(10);
  DibujarDiscos();
  if ( OrdenCorrecto() ) {
    noLoop();
    textSize(24);
    text("Juego terminado",350,250);
  }
}

void DibujarDiscos()
{
  int i;
  textSize(12);
  for ( i=0; Ancho[Orden[i]]!=0 ; i++ ) {
    noStroke();
    fill(Color[Orden[i]],75,75);
    rect(Centrox,Centroy+i*Alto,Ancho[Orden[i]],Alto,4);
    stroke(255);
    fill(0); 
    text(Numero[Orden[i]],Centrox-3,Centroy+i*Alto+5);
  }
  textSize(16);
  fill(200);
  text("Jugadas: ", 50,50);
  fill(255);
  if ( PancakesInvertidos >= 0 ) 
    for ( i=0 ; i<Movimientos ; i++ )
      text(Numero[Jugadas[i]-1],130+i*12,50);
}

void mouseClicked() 
{
  int i;
 
  for ( i=0; Ancho[i]!=0 ; i++ ) {
    if ( mouseX < Centrox+Ancho[Orden[i]]/2  &&  mouseX > Centrox-Ancho[Orden[i]]/2  && 
         mouseY < Centroy+i*Alto+Alto/2  &&  mouseY > Centroy+i*Alto-Alto/2 ) {
           if ( i==0  ||  Movimientos >= MaxMovs ) return;
           PancakesInvertidos = i+1;
           Jugadas[Movimientos] = PancakesInvertidos;
           Movimientos++;
           Voltear(PancakesInvertidos);
           return;
    }
  }
}

void keyPressed() 
{
  if ( key == BACKSPACE  ||  keyCode == LEFT ) 
    if ( Movimientos>0 ) {
      Movimientos--;
      Voltear(Jugadas[Movimientos]);
    }
}


/* Fin de archivo */
