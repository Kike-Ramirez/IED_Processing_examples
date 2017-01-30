/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: OOP - Classes & Objects

*/

// Define an object named "circle" of class "Circle"
Circle circle;


void setup() {

  // Set window size
  size(600, 400);
  
  // Create a variable position to initialize Circle
  PVector position = new PVector(width/2, height/2);

  // Create the object "circle"
  circle = new Circle(position);
  
}


void draw(){

  // Clear background
  background(255);
  
  // Trail effect! Try it!! 
  // 1. Comment "Background" line
  // 2. Uncomment next three lines
  // fill(255,150);
  // noStroke();
  // rect(0,0,width,height);
  
  // Update & Display our circle. Easy!!
  circle.update();
  circle.display();
  
}