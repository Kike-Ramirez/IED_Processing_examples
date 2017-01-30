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
  background(255);
  
  // Trail effect! Try it!! 
  // 1. Comment "Background" line
  // 2. Uncomment next three lines
  // fill(255,150);               // Select a white fill color with transparency
  // noStroke();                  // Set no stroke
  // rect(0,0,width,height);      // Draw a rectangle over the whole canvas
  
  // Update & Display our circles  
  for (int i = 0; i < circles.size(); i++) {
  
    circles.get(i).update();
    circles.get(i).display();  
  
  }
  
  // Print framerate on screen (check your computer limits!)
  fill(0);
  textSize(20);
  text(frameRate, 15, 25);
  
}