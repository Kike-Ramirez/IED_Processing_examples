/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 25/1/2017

Subject: Rotate & Translate - Clock

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
  
  // Class constructor. Initial position, color and radio are passed as arguments.
  Clock(PVector initPosition, color colorClock_, int radio_) {
  
    // Copy initial position
    position = initPosition.copy();
    
    // Set colorClock according to passed parameter colorClock_ 
    colorClock = colorClock_;
    
    // Set radio according to passed parameter radio_
    radio = radio_;

    // Give 0 value to other parameters
    hours = 0;
    minutes = 0;
    seconds = 0;
    
  }
  
  
  // Update parameters of class
  void update() {
  
    // Get number of hours from operative system
    hours = hour();
    
    // If you receive a 24h value, get 12h value.
    if (hours > 12) hours -= 12;
    
    // Get number of minutes from operative system
    minutes = minute();

    // Get number of seconds from operative system
    seconds = second();
  
  }

  // Display our circle in screen
  void display() {
  
    // Fill with selected color
    fill(colorClock);

    // Set stroke to 1 pixel
    strokeWeight(1);
    
    // Translate to clock position
    translate(position.x, position.y);
    
    // Draw the external circle
    noFill();
    stroke(colorClock);
    ellipse(0, 0, 2 * radio, 2 * radio);

    // Draw the internal circle
    noStroke();
    fill(colorClock);
    ellipse(0, 0, 0.05 * radio, 0.05 * radio);
    
    // Draw hour markers    
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
    
  }  
  
}