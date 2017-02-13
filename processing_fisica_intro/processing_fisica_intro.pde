/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 13/02/2017

Subject: Introduction exercise to BOX2D library

*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Definimos el objeto box2d de la clase PBox2D
Box2DProcessing box2d;

// Definimos un ArrayList para guardar todos los objetos de la clase Boundary
ArrayList<Boundary> boundaries;
// Definimos un ArrayList para guardar todos los objetos de la clase Box
ArrayList<Box> boxes;

// Vector para guardar la gravedad
Vec2 gravedad;

// Número de objetos tipo Box que añadimos al sketch
int nObjetos = 100;

// Imagen nueva para el fondo del sketch
PImage background;

void setup() {
  
  size(640,480);
  smooth();

  // Creamos el mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Inicializamos la gravedad
  gravedad = new Vec2(0,0);
  box2d.setGravity(gravedad.x, gravedad.y);

  // Creamos los arraylists para guardar los objetos	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Añadimos 4 bordes a nuestro sketch para que no
  // se salgan los objetos tipo Box (añadimos)
  // cuatro objetos Boundary al arrayList "boundaries"
  boundaries.add(new Boundary(width/2,5,width,10));
  boundaries.add(new Boundary(width/2,height-5,width,10));
  boundaries.add(new Boundary(5,height/2,10,height));
  boundaries.add(new Boundary(width-5,height/2,10,height));
  
  // Añadimos nObjetos objetos tipo Box (cuantos más objetos, más computación necesita). 
  // Ojo con los frames por segundo. Aquí, añadimos 100 objetos tipo Box
  // al arrayList "boxes".
  for (int i = 0; i < nObjetos; i++) {
    Box p = new Box(width/2,height/2);
    boxes.add(p);
  }
  
  // Cargamos las imagenes en sus objetos respectivos
  background = loadImage("background.jpg");
  
}

void draw() {
  
  // Dibujamos el fondo de la caja
  imageMode(CENTER);
  image(background,width/2,height/2,width,height);
  
  // Actualizamos la gravedad (recuerda que en World la componente vertical va al contrario!)
  // El vector gravedad es la diferencia entre la posición del ratón y el punto central, con la 
  // componente Y con un signo -.
  gravedad = new Vec2(mouseX-width/2,-(mouseY-height/2));
  box2d.setGravity(gravedad.x, gravedad.y);

  // Le decimos al objeto box2d que haga una iteración de cálculos
  // completa para actualizar todos los valores
  box2d.step();
  
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Dibujamos todas las cajas
  for (Box b: boxes) {
    b.display();
  }

  // En nuestro sketch las cajas no nacen ni mueren: siempre son el mismo 
  // número. Por eso no necesitamos ver las que hay que eliminar del array.
  // En otros sketches tendremos que hacerlo
  
  // Dibujamos el vector gravedad
  stroke(200);
  strokeWeight(3);
  fill(200);
  line(width/2, height/2, mouseX, mouseY);
  text("Gravedad = (" + gravedad.x + "," + gravedad.y + ")", mouseX, mouseY);
  
  println(frameRate);
  
}