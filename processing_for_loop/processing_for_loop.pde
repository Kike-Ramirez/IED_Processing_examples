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
  
  
  // Draw ellipses using a "for" loop
  // i :          Float variable chosen (by ourselves) to control for loop
  // i < width:   Condition to continue the for loop. If FALSE it stops.
  // i += step:   Increment of control variable.
  for (float i = 0; i < width; i += step) {
  
    // Draw a circle of 'step' diameter at position (i, height/2)
    ellipse(i, height/2, step, step);
  
  }
  
  // Animate it!! Uncomment next line to set a sinusoidal variable step
  // step = 20 * ( 1.5 + sin(millis() / 1000.0));
}