/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: 3D drawing

*/


void setup() {

  // Set window size
  size(1024, 768, P3D);
  
  // Smooth lines
  smooth();
  
  // Set stroke to white
  stroke(255);
 
}


void draw(){

  // Clear background
  background(0);
  
  // Map mouseY to zoom
  float zoom = map(mouseY, 0, height, -400, 400);
  
  // Translate to window center and zoom
  translate(width/2, height/2, zoom);
  
  // Draw sphere
  noFill();
  pushMatrix();
  rotateY(millis()/1000.0);
  sphere(300);
  popMatrix();
  
  // Draw Rectangle
  fill(255, 0, 0);
  pushMatrix();
  rotateX(millis()/3000.0);
  rotateZ(millis()/2000.0);
  box(100, 120, 80);
  popMatrix();  
  
}
