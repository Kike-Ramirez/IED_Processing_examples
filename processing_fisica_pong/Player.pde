/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 13/02/2017

Subject: Class that implements the players for Atari Game's Pong

*/


class Player {

  // Necesitamos un objeto Body para incluirlo en el mundo BOX2D, una anchura
  // y una altura (fíjate que ya no necesitamos su posición, la sabe BOX2D y se la
  // preguntaremos directamente a él). Además, necesitamos llevar la cuenta de sus goles
  
  Body b;
  float w;
  float h;
  int tanteo;

  // Constructor de la clase
  Player(float x, float y) {
    w = 20;
    h = 80;
    tanteo = 0;
    // Llama a la función makeBody (ver más abajo)
    // que crea el body y lo incluye en el mundo.
    makeBody(x, y, w, h);
    
  }
  
  // Funciones para mover el jugador 
  
  void moverAbajo() {
    
    // Preguntamos a box2d dónde está nuestro objeto
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // Velocidad de desplazamiento del jugador
    Vec2 desp = new Vec2(0,10);
    pos.addLocal(desp);
    // Comprueba que no te salgas de la pantalla!!
    if (pos.y > height - 45) {
      pos.y = height - 45;
    }
    // Aplica la nueva posición
    b.setTransform(box2d.coordPixelsToWorld(pos), b.getAngle());              
    
  }
  
  void moverArriba() {

    // Preguntamos a box2d dónde está nuestro objeto
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // Velocidad de desplazamiento del jugador
    Vec2 desp = new Vec2(0,-5);
    pos.addLocal(desp);
    // Comprueba que no te salgas de la pantalla!!
    if (pos.y < 45) {
      pos.y = 45;
    }
    // Aplica la nueva posición
    b.setTransform(box2d.coordPixelsToWorld(pos), b.getAngle());       
    
  }

  // Dibuja el objeto
  void display() {
    // Preguntamos a box2d dónde está nuestro objeto
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // Le preguntamos también su ángulo de rotación
    float a = b.getAngle();

    // Dibujamos desde el centro
    rectMode(CENTER);
    
    // Guardamos los ejes actuales
    pushMatrix();
    
    // Hacemos un cambio de ejes desplazándonos y 
    // rotando hasta la posición del objeto.
    translate(pos.x, pos.y);
    rotate(-a);
    
    // Dibujamos la textura caja en el origen de coordenadas nuevo (0,0) y con
    // el tamaño adecuado
    
    fill(255);          // Relleno marrón oscuro
    noStroke();              // Sin trazo
    rect(0, 0, w, h);   // Un simple rectángulo
    
    // Recuperamos los ejes de coordenadas originales!
    popMatrix();      
    
  }


  // Función que se encarga de añadir el objeto BODY al mundo BOX2D
  void makeBody(float x_, float y_, float w_, float h_) {

    // CREAMOS EL BODY
    
    // Creamos la definición del cuerpo bd de la clase BodyDef
    BodyDef bd = new BodyDef();
    // Configuramos el cuerpo como dinámico (cajas sueltas, se mueven continuamente)
    bd.type = BodyType.KINEMATIC;
    // Traducimos su posición (x,y) del mundo pixel al mundo World y ajustamos
    // con ellas la posición del cuerpo
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    // Usando la definición de cuerpo bd, creamos el cuerpo b de la clase Body
    b = box2d.createBody(bd);
    
    // CREAMOS LA FORMA (SHAPE)
    // Definimos su forma sd (Shape), tipo polígono
    PolygonShape sd = new PolygonShape();
    // Traducimos su anchura/altura del mundo píxel
    // al mundo World
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    // Configuramos sd como tipo rectángulo, con su anchura
    // y altura correctas.
    sd.setAsBox(box2dW, box2dH);

    // UNIMOS BODY Y SHAPE MEDIANTE FIXTURE
    // Forma rápida de unir el cuerpo b a la forma sd dando densidad 1 al cuerpo:
    b.createFixture(sd,1);
    
    // DÉMOSLE ALGUNAS PROPIEDADES INICIALES
    // Velocidad lineal inicial cero
    b.setLinearVelocity(new Vec2(0,0));
    // Velocidad angular inicial cero
    b.setAngularVelocity(random(0,0));
  }
}