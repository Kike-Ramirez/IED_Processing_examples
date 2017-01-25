/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: OOP - Classes & Objects

*/

Circle circle;

void setup() {

  // Set window size
  size(1024, 768);
  
  // Create a variable position to initialize Circle
  PVector position = new PVector(width/2, height/2);

  circle = new Circle(position);
  
}


void draw(){

  // Clear background
  background(0);
  
  // Update & Display our circle
  circle.update();
  circle.display();
  
}
