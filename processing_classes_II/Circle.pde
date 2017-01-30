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
  float diameter, maxSpeed;
  
  // Class constructor
  Circle(PVector initPosition) {
  
    // Copy (get) initial position
    position = initPosition.copy();
    
    // Set maximum speed
    maxSpeed = 20;
    
    // Set vector speed randomly according to maxSpeed
    speed = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));

    // Set a random full saturated & bright color with alpha for our circle 
    // Set colorMode to HSB 
    colorMode(HSB, 255, 255, 255);
    
    // Set colorcircle to a random 'hue' color with '150' for alpha value
    colorCircle = color(random(255), 255, 255, 150);
    
    // Set a random diameter
    diameter = random(5, 50);
  
  }
  
  
  // Update parameters of class
  void update() {
  
    // Update position according to speed (sum speed to position)
    position.add(speed);
    
    // Check border conditions
    if ((position.x <= 0) || (position.x >= width)) speed.x *= -1;
    if ((position.y <= 0) || (position.y >= height)) speed.y *= -1;
  
  }

  // Display our circle in screen
  void display() {
  
    // Fill with selected color
    fill(colorCircle);
    
    // No stroke
    noStroke();
    
    // Draw the circle
    ellipse(position.x, position.y, diameter, diameter);
  
  }  
  
}