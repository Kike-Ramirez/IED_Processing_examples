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
  size(600, 400, P3D);
  
  // Smooth lines
  smooth();
  
  // Set stroke to white
  stroke(255);
 
}


void draw(){

  // Clear background
  background(255);
  
  // Map mouseY to zoom
  float zoom = map(mouseY, 0, height, -350, 600);
  
  // Translate to window center and zoom
  translate(width/2, height/2, zoom);
  
  // DRAW SPHERE
  // Don't draw planes
  noFill();
  stroke(0);
  // Save actual axis
  pushMatrix();
  // Rotate around Y axis
  rotateY(millis()/8000.0);
  // Draw a sphere of radius 300
  sphere(300);
  // Go back to previous saved axis
  popMatrix();
  
  // DRAW RECTANGLE
  // fill planes in red
  fill(255, 0, 0);
  stroke(200, 0, 0);
  // Save actual axis
  pushMatrix();
  // Rotate around X axis
  rotateX(millis()/3000.0);
  // Rotate around Z axis
  rotateZ(millis()/4000.0);
  // Draw a box
  box(100, 120, 80);
  // Go back to previous saved axis
  popMatrix();  
  
}