/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 13/02/2017

Subject: Version of Pong (Atari)

*/

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


// Definimos el objeto box2d de la clase PBox2D
Box2DProcessing box2d;

// Definimos un ArrayList para guardar todos los objetos de la clase Boundary
ArrayList<Boundary> boundaries;

// Definimos un objeto ball tipo Ball para la pelota
Ball ball;

// Definimos dos objetos tipo Player para nuestros jugadores
Player player_izda, player_dcha;

// Variables para guardar el tiempo (y controlar el flujo de programa)
float tiempo, tiempoGol;

// Variable para guardar el estado del flujo de programa
int estado;

// Variable para guardar el tipo de fuente que vamos a usar para el texto
PFont font;

// Objetos para guardar las imagenes con el logo de Atari y el background
PImage logoAtari, background;

void setup() {
  
  size(1024,768);              // Tamaño de nuestro terreno de juego
  smooth();

  // Creamos el mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Inicializamos la gravedad (no queremos que haya gravedad)
  box2d.setGravity(0,0);

  // Creamos los arraylists para guardar los bordes	
  boundaries = new ArrayList<Boundary>();

  // Añadimos 2 bordes a nuestro sketch para que no
  // se salga la bola
  boundaries.add(new Boundary(width/2,5,width,10));
  boundaries.add(new Boundary(width/2,height-5,width,10));
  
  // Añadimos la pelota
  ball = new Ball(width/2,height/2);
  
  // Añadimos los jugadores
  player_izda = new Player(width/8,height/2);
  player_dcha = new Player(7*width/8,height/2);
  
  // Guardamos el tiempo inicial (en milisegundos)
  tiempo = millis();
  
  // Inicializamos tiempoGol (lo usaremos luego, al marcar gol)
  tiempoGol = 0;
  
  // Guardamos el tipo de fuente y la imagen que vamos a usar
  // en la intro
  font = loadFont("PressStart2P-48.vlw");
  logoAtari = loadImage("atari-logo.png");
  background = loadImage("background.jpg");

}

void draw() {
  
  // Dibujamos el fondo en negro
  background(0);
  
  // Comprobamos que estamos en el estado 0 (Introducción)
  if (estado == 0) {
    
    // Dibujamos el texto de presentación
    
    textAlign(CENTER,CENTER);
    textFont(font,48);
    text("PONG",width/2,height/2);
    textFont(font,20);
    textAlign(CENTER, CENTER);
    text("Processing", width/2, height/2 + 100);
    text("13/02/2017 - IED Visual Madrid", width/2, height/2 + 150);
    text("K. Ramirez", width/2, height/2 + 200);
    
    // Dibujamos el logo de Atari
    imageMode(CENTER);
    image(logoAtari,width/2,height/2-200,logoAtari.width*0.5,logoAtari.height*0.5);
    
    // Si nos pasamos de tiempoIntro (5 seg) pasamos al estado 1 (Esperando saque)
    if (millis() - tiempo > 5000) {
     
      estado = 1;
     
    }
  }
  
  // Comprobamos que ya no estamos en la intro 
  if (estado > 0) { 
  
      // Ya estamos jugando, mostramos el terreno de juego y
      // dibujamos la línea central
      fill(255,150);
      for (int i = 0; i <= height; i += 100) {
        
        rectMode(CENTER);
        rect(width/2,i,10,80);
      }
      
      // Comprobamos la pulsación de teclas de movimiento de jugadores
      if (keyPressed) {
        
        // Si se han pulsado las teclas de mover los jugadores
        if ((key == 'a') || (key == 'A')) player_izda.moverAbajo();
        if ((key == 'q') || (key == 'Q')) player_izda.moverArriba();
        if ((key == 'ñ') || (key == 'Ñ')) player_dcha.moverAbajo();
        if ((key == 'p') || (key == 'P')) player_dcha.moverArriba(); 
        
      }
      
      // Le decimos al objeto box2d que haga una iteración de cálculos
      // completa para actualizar todos los valores
      box2d.step();
      
      // Dibujamos los bordes de la pantalla
      for (Boundary wall: boundaries) {
        wall.display();
      }
    
      // Dibujamos la pelota
      ball.display();
    
      // Comprobamos si hemos marcado gol (solo hay que hacerlo en el juego -estado = 2-)
      if ((estado == 2) && (ball.isGol() == 1)) {      // Gol del jugador derecho
        
        // Incrementamos el tanteo del jugador derecho
        player_dcha.tanteo++;

        // Actualizamos el estado
        estado = 3;   
      
        // Inicializamos la cuenta de tiempos
        tiempoGol = millis();
        
      }
    
      else if ((estado == 2) && (ball.isGol() == 2)) {    // Gol del jugador izquierdo
        
        // Incrementamos el tanteo del jugador izquierdo
        player_izda.tanteo++;

        // Actualizamos el estado
        estado = 3;  
        
        // Inicializamos la cuenta de tiempo
        tiempoGol = millis(); 
      
      }
      
      else if (estado == 3) {
       
        textFont(font,58);
        text("¡¡¡¡GOOOOOL!!!!", width/2, height/2);
        
        if (millis() - tiempoGol >= 2000) {
          
          estado = 1;
          
          // Ponemos la pelota en el punto de saque
          ball.reset();
          
        }
       
       
      } 
      
      // Dibujamos los jugadores
      player_izda.display();
      player_dcha.display();
      
      // Dibujamos el marcador
      
      textFont(font, 48);
      text(player_izda.tanteo, width/2 - 50, 50); 
      text(player_dcha.tanteo, width/2 + 50, 50); 

  }
  
  println(frameRate);
}


// Evento asíncrono que se lanza cuando pulso una tecla.
// Aquí analizo si se ha pulsado la barra espaciadora esperando el saque.
// En ese caso, hacemos el saque inicial y pasamos al estado "jugando"

void keyPressed() {
  
  // Si se ha pulsado la barra espaciadora mientras esperamos el saque
  if ((estado == 1) && (key == ' ')) {
    
    ball.kickoff();          // Saque inicial!!
    estado = 2;              // Pasamos a estado "jugando"
    
  }
  
}