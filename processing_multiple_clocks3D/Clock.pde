/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: 3D Multiple Clocks

*/


// Class definition
class Clock {

  // Parameters of the class
  PVector position;
  color colorClock;
  float radio;
  
  float hours;
  float minutes;
  float seconds;
  float speedRotateX;
  float speedRotateY;
  float speedRotateZ;
  float maxRotation, minRotation;
  
  // Class constructor
  Clock(PVector initPosition, color colorClock_, int radio_) {
  
    // Copy (get) initial position
    position = initPosition.copy();
    
    // Set a random full saturated & bright color for our circle 
    colorClock = colorClock_;
    
    // Set a random diameter
    radio = radio_;

    // Initialize parameters
    hours = 0;
    minutes = 0;
    seconds = 0;
    
    maxRotation = 0.001;
    minRotation = 0.00001;
    
    // Rotation speed (the biggest, the slowest)
    speedRotateX = random(minRotation, maxRotation);
    speedRotateY = random(minRotation, maxRotation);
    speedRotateZ = random(minRotation, maxRotation);
    
  }
  
  
  // Update parameters of class
  void update() {
  
    hours = hour();
    if (hours > 12) hours -= 12;
    minutes = minute();
    seconds = second();
  
  }

  // Display our circle in screen
  void display() {
  
    // Fill with selected color
    fill(colorClock);

    // Set stroke weight to 1
    strokeWeight(1);
    
    // Save coordinates
    pushMatrix();
    // Translate to clock position
    translate(position.x, position.y, position.z);
    
    // Rotate acording to rotation speed
    rotateX(millis() * speedRotateX);
    rotateY(millis() * speedRotateY);
    rotateZ(millis() * speedRotateZ);
    
    
    // Draw the external circle
    noFill();
    stroke(colorClock);
    ellipse(0, 0, 2 * radio, 2 * radio);
    
    // Draw the internal circle
    noStroke();
    fill(colorClock);
    ellipse(0, 0, 0.05 * radio, 0.05 * radio);
    
    // Draw markers    
    noFill();
    stroke(colorClock);
    
    for (int i = 0; i < 12; i++) {
    
      pushMatrix();
      rotate(2 * PI/12*i);
      line(radio*0.8, 0, radio * 0.9, 0);
      popMatrix();
    
    }
  
    // Draw hours
    pushMatrix();
    strokeWeight(4);
    rotate(-PI/2 + 2*PI/12 * hours);
    line(0, 0, radio*0.4, 0);
    popMatrix();

    // Draw minutes
    pushMatrix();
    strokeWeight(2);
    rotate(-PI/2 + 2*PI/60 * minutes);
    line(0, 0, radio*0.8, 0);
    popMatrix();    

    // Draw seconds
    pushMatrix();
    strokeWeight(1);
    rotate(-PI/2 + 2*PI/60 * seconds);
    line(0, 0, radio*0.9, 0);
    popMatrix(); 
    
    // Get previous coordinates
    popMatrix();
    
  }  
  
}