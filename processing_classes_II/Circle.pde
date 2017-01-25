/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: OOP - Classes & Objects

*/


// Class definition
class Circle {

  // Parameters of the class
  PVector position, speed;
  color colorCircle;
  float diameter;
  
  // Class constructor
  Circle(PVector initPosition) {
  
    // Copy (get) initial position
    position = initPosition.get();
    
    // Defina a variable to set maximum speed
    int maxSpeed = 10;
    
    // Set vector speed randomly according to maxSpeed
    speed = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));

    // Set a random full saturated & bright color for our circle 
    colorMode(HSB);    
    colorCircle = color(random(360), 255, 255);
    
    // Set a random diameter
    diameter = random(5, 50);
  
  }
  
  
  // Update parameters of class
  void update() {
  
    // Update position according to speed
    position.add(speed);
    
    // Check border conditions
    if ((position.x <= 0) || (position.x >= width)) speed.x *= -1;
    if ((position.y <= 0) || (position.y >= height)) speed.y *= -1;
  
  }

  // Display our circle in screen
  void display() {
  
    // Fill with selected color
    fill(colorCircle);
    
    // Draw the circle
    ellipse(position.x, position.y, diameter, diameter);
  
  }  
  
}
