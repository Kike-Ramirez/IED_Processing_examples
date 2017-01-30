/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: Rotate & Translate - Clock

*/

// We create an object "clock" of class "Clock"
Clock clock;

void setup() {

  // Set window size
  size(1024, 768);
  
  // Smooth lines
  smooth();
  
  // Create a variable position to initialize Clock
  PVector position = new PVector(width/2, height/2);

  // Initialize clock object
  clock = new Clock(position, color(0), height/2);
  
 
}


void draw(){

  // Clear background
  background(255);
  
  // Update & Display our clock
  clock.update();
  clock.display();
 
}