/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: 3D Multiple Clocks

*/



import peasy.*;

PeasyCam cam;


ArrayList<Clock> clocks;
int numClocks = 50;


void setup() {

  // Set window size
  size(1024, 768, P3D);
  
  // Initialize peasyCam
  // cam = new PeasyCam(this, 100);
  // cam.setMinimumDistance(50);
  // cam.setMaximumDistance(500);
  
  // Smooth lines
  smooth();
  
  // Initialize clocks object arraylist
  clocks = new ArrayList<Clock>();
  
  // Fill list with numclocks clocks
  
  for(int i = 0; i < numClocks; i++) {
    
    // Create a variable position to initialize Clock
    PVector position = new PVector(random(width), random(height), random(-500, 500));    
    // PVector position = new PVector(width/2, height/2);
    color color_i = color(random(50, 255));
    int radio = int(random(50, 200));
    
    clocks.add(new Clock(position, color_i, radio));
    
  }
  
 
}


void draw(){

  // Clear background
  background(0);
  
  pushMatrix();
  float zoom = map(mouseY, 0, height, -1000, 1000);
  translate(0, 0, zoom);
  
  // Update & Display our clocks
  for(int i = 0; i < numClocks; i++) {
    clocks.get(i).update();
    clocks.get(i).display();
  }
 
  popMatrix();
}
