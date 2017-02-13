/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 13/02/2017

Subject: Class that implements the ball for Atari Game's Pong

*/


class Ball {

  // Necesitamos un objeto Body para incluirlo en el mundo BOX2D, una anchura
  // y una altura (fíjate que ya no necesitamos su posición, la sabe BOX2D y se la
  // preguntaremos directamente a él).
  
  Body b;
  float r;
  PImage textura;
  

  // Constructor de la clase
  Ball(float x, float y) {
    r = 15;
    // Llama a la función makeBody (ver más abajo)
    // que crea el body y lo incluye en el mundo.
    makeBody(x, y, r);
    // textura = loadImage("ball.png");
    
  }

  // Esta pone la pelota en el punto de saque y reinicia el partido
  void reset() {
   
    Vec2 pos = new Vec2(width/2,height/2);
    b.setTransform(box2d.coordPixelsToWorld(pos), 0);             
    // Velocidad lineal inicial cero
    b.setLinearVelocity(new Vec2(0,0));
    b.setAngularVelocity(0);
    
  }

  // Saque inicial
  void kickoff() {
    
    float anguloRandom = random(2*PI);
    float linearSpeed = 50;
    float angularSpeed = random(50);
    
    // Velocidad lineal inicial aleatoria
    b.setLinearVelocity(new Vec2(linearSpeed*cos(anguloRandom), linearSpeed*sin(anguloRandom)));
    // Velocidad angular inicial aleatoria
    b.setAngularVelocity(angularSpeed);
    
  }
  
  // Nos dice si hay gol o no:
  // 0: no hay gol
  // 1: gol del jugador derecho
  // 2: gol del jugador izquierdo
  
  int isGol() {
    // Pídele a box2D la posición actual de la partícula
    Vec2 pos = box2d.getBodyPixelCoord(b);
    // ¿Está fuera de nuestra pantalla?
    if (pos.x < 0) {
      return 1;           // 
    }
    else if (pos.x > width) {
      return 2;           // 
    }    
    else return 0;
    
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
    ellipse(0,0,2*r,2*r);
    // image(textura,0,0,2*r,2*r);
    // Recuperamos los ejes de coordenadas originales!
    popMatrix();      
    
  }


  // Función que se encarga de añadir el objeto BODY al mundo BOX2D
  void makeBody(float x_, float y_, float r_) {

    // CREAMOS EL BODY
    
    // Creamos la definición del cuerpo bd de la clase BodyDef
    BodyDef bd = new BodyDef();
    // Configuramos el cuerpo como dinámico (cajas sueltas, se mueven continuamente)
    bd.type = BodyType.DYNAMIC;
    // Traducimos su posición (x,y) del mundo pixel al mundo World y ajustamos
    // con ellas la posición del cuerpo
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    // Usando la definición de cuerpo bd, creamos el cuerpo b de la clase Body
    b = box2d.createBody(bd);
    
    // CREAMOS LA FORMA (SHAPE)
    // Definimos su forma sd (Shape), tipo círculo
    CircleShape sd = new CircleShape();
    // Traducimos su radio del mundo píxel
    // al mundo World
    float radio = box2d.scalarPixelsToWorld(r_);
    // Configuramos sd como tipo rectángulo, con su anchura
    // y altura correctas.
    sd.m_radius = radio;
    
    // Creamos el fixture
    FixtureDef fd = new FixtureDef();
    // The fixture is assigned the PolygonShape we just made.
    fd.shape = sd;
    fd.friction = 0;
    fd.restitution = 1;
    fd.density = 1;

    // UNIMOS BODY Y SHAPE MEDIANTE FIXTURE
    // Forma rápida de unir el cuerpo b a la forma sd dando densidad 1 al cuerpo:
    b.createFixture(fd);
    
    // DÉMOSLE ALGUNAS PROPIEDADES INICIALES
    // Velocidad lineal inicial cero
    b.setLinearVelocity(new Vec2(0,0));
    // Velocidad angular inicial cero
    b.setAngularVelocity(0);
  }
}