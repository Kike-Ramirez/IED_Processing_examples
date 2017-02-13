/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 13/02/2017

Subject: Introduction exercise to BOX2D library. This class implements a Boundary.

*/

class Boundary {

  // Un borde (boundary) es solo un rectángulo con:
  float x;    // Coordenada x de su posición
  float y;    // Coordenada y de su posición
  float w;    // Anchura
  float h;    // Altura
  
  // Pero también tenemos que crear un Body, para incluirlo en 
  // el mundo BOX2D.
  Body b;

  // Constructor de la clase Boundary
  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // CREAMOS EL BODY
    
    // Creamos la definición del cuerpo bd de la clase BodyDef
    BodyDef bd = new BodyDef();
    // Configuramos el cuerpo como estático (es un borde fijo, nunca se mueve)
    bd.type = BodyType.STATIC;
    // Traducimos su posición (x,y) del mundo pixel al mundo World y ajustamos
    // con ellas la posición del cuerpo
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    // Usando la definición de cuerpo bd, creamos el cuerpo b de la clase Body
    b = box2d.createBody(bd);
    
    // CREAMOS LA FORMA (SHAPE)
    // Definimos su forma sd (Shape), tipo polígono
    PolygonShape sd = new PolygonShape();
    // Traducimos su anchura/altura del mundo píxel
    // al mundo World
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // Configuramos sd como tipo rectángulo, con su anchura
    // y altura correctas.
    sd.setAsBox(box2dW, box2dH);

    // UNIMOS BODY Y SHAPE MEDIANTE FIXTURE
    // Forma rápida de unir el cuerpo b a la forma sd dando densidad 1 al cuerpo:
    b.createFixture(sd,1);
    
  }

  // Dibuja el objeto Boundary. Es un rectángulo fijo y nunca está rotado ni girado. 
  // Dibujarlo es tan sencillo como hacer los siguiente.
  void display() {
    fill(80,32,2);          // Relleno marrón oscuro
    noStroke();              // Sin trazo
    rectMode(CENTER);       // Dibujamos desde el centro
    rect(x,y,w,h);          // Dibujamos un simple rectángulo
  }

}