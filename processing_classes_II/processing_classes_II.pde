/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: OOP - Classes & Objects (II)

*/

ArrayList<Circle> circles;
int numCircles = 500;

void setup() {

  // Set window size
  size(1024, 768);
  
  // Set frameRate
  frameRate(25);
  
  // Create a variable position to initialize Circle
  PVector position = new PVector(width/2, height/2);

  circles = new ArrayList<Circle>();
  
  for (int i = 0; i < numCircles; i++) {
  
    circles.add(new Circle(position));
  
  }
  
}


void draw(){

  // Clear background
  background(0);
  
  // Update & Display our circles  
  for (int i = 0; i < circles.size(); i++) {
  
    circles.get(i).update();
    circles.get(i).display();  
  
  }
  
  // Print framerate on screen
  fill(255);
  textSize(20);
  text(frameRate, 15, 25);
  
}
