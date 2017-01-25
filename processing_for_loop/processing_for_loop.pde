/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: For loops

*/


// Step variable definition
float step = 20;



void setup() {

  // Set window size
  size(1024, 768);
  
  // Remove stroke lines
  noStroke();
  
}


void draw(){

  // Clear background
  background(0);
  
  
  // Draw ellipses with a "for" loop
  for (int i = 0; i < width; i += step) {
  
    ellipse(i, height/2, step, step);
  
  }
  
  // Increment step
  // step = width/2 * abs(sin(millis() / 1000.0));
  
}
