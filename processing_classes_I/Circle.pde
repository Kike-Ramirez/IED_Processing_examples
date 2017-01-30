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
  PVector position, speed;      // Vectors position and speed
  color colorCircle;            // Fill color
  float diameter, maxSpeed;     // Diameter and maximum speed
  
  // Class constructor
  Circle(PVector initPosition) {
  
    // Copy initial position
    position = initPosition.copy();
    
    // Set maximum speed
    maxSpeed = width/50;
    
    // Set vector speed randomly according to maxSpeed
    speed = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed));

    // Set a random full saturated & bright color with alpha for our circle 
    // Set colorMode to HSB 
    colorMode(HSB, 255, 255, 255);
    
    // Set colorcircle to a random 'hue' color with '150' for alpha value
    colorCircle = color(random(255), 255, 255, 150);
    
    // Set a random diameter
    diameter = random(5, width/10);
  
  }
  
  
  // Update parameters of class
  void update() {
  
    // Update position according to speed (sum speed to position)
    position.add(speed);
    
    // Check border conditions
    if ((position.x <= diameter/2) || (position.x >= width-diameter/2)) speed.x *= -1;
    if ((position.y <= diameter/2) || (position.y >= height-diameter/2)) speed.y *= -1;
  
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