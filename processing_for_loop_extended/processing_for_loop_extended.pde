/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: For loops

*/


// Step variable definition
float step;



void setup() {

  // Set window size
  size(600, 600);
  
  // Remove stroke lines
  strokeWeight(3);
  stroke(0, 100);
  
  // Fill in black
  fill(0, 50);
  
}


void draw(){

  // Clear background
  background(255);
  
  // Animate it!! Uncomment next line to set a sinusoidal variable step
  step = width/10 * ( 1 + 9 * (0.5 + 0.5 * sin(millis() / 5000.0)));  
  
  // Draw ellipses using a "for" loop
  // i :          Float variable chosen (by ourselves) to control for loop
  // i < width:   Condition to continue the for loop. If FALSE it stops.
  // i += step:   Increment of control variable.
  for (float j = 0; j < height; j += step) {
    for (float i = 0; i < width; i += step) {
    
      // Draw a circle of 'step' diameter at position (i, height/2)
      ellipse(i, j, step, step);
      ellipse(width - i, height - j, step, step);
    
    }
  }
  

}