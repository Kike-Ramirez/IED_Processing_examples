/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: OOP - Classes & Objects (II)

*/

// List of object of class "Circle"
ArrayList<Circle> circles;

// Number of circles in the sketch. Try to change it!
int numCircles = 200;

void setup() {

  // Set window size
  size(1024, 768);
  
  // Set frameRate
  frameRate(30);
  
  // Create a variable position to initialize Circle
  PVector position = new PVector(width/2, height/2);

  // We create an (empty!) list of objects of class "Circle"
  circles = new ArrayList<Circle>();
  
  // We add 'numCircles' objects of class "Circle" to the list
  for (int i = 0; i < numCircles; i++) {
  
    // We create a new Circle object and add it to 'circles' arrayList
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
  
  // Print framerate on screen (check your limits!)
  fill(255);
  textSize(20);
  text(frameRate, 15, 25);
  
}