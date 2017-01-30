/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: 3D Multiple Clocks

*/


// Import peasyCam library (http://mrfeinberg.com/peasycam/)
import peasy.*;

// Create a cam object of class PeasyCam
PeasyCam cam;

// Create an arrayList of Clock objects called "clocks"
ArrayList<Clock> clocks;

// Number of clocks in the sketch. Change it!!
int numClocks = 200;


void setup() {

  // Set window size
  size(600, 400, P3D);
  
  // Initialize peasyCam
   cam = new PeasyCam(this, 0);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(2000);
  
  // Smooth lines
  smooth();
  
  // Initialize clocks object arraylist (still empty!)
  clocks = new ArrayList<Clock>();
  
  // Fill arraylist with numclocks objects of class 'Clock'
  for(int i = 0; i < numClocks; i++) {
    
    // Create a random variable position to initialize Clock
    float dispersion = 1000;
    PVector position = new PVector(random(-dispersion, dispersion), random(-dispersion, dispersion), random(-dispersion, dispersion));    
    
    // Create a random gray color for Clock
    color color_i = color(random(0, 200));
    
    // Create a random radio for Clock
    int radio = int(random(50, 200));
    
    // Create a new object of class "Clock" and add it to "clocks" arrayList
    clocks.add(new Clock(position, color_i, radio));
    
  }
  
 
}


void draw(){

  // Clear background
  background(255);
  
  // Save actual axis
  pushMatrix();
  
  // Update & Display our clocks
  for(int i = 0; i < numClocks; i++) {
    clocks.get(i).update();
    clocks.get(i).display();
  }
 
  // Go back to last saved axis
  popMatrix();
}