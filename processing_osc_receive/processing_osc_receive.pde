/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 10/2/2017

Subject: OSC Receive example. Sketch that receive OSC messages corresponding to a circle's location in another equipment.

For more information about Processing OSCP5 library, please check:
http://www.sojamo.de/libraries/oscP5/

*/
 
// Import libraries
import oscP5.*;
import netP5.*;

// Declare necessary objects
OscP5 oscP5;

// Declare two floats to save circle's center
float xCircle, yCircle;

void setup() {
  
  // Set window size
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12001 */
  oscP5 = new OscP5(this,12001);
  
  // Initialize circle's center
  xCircle = width/2;
  yCircle = height/2;
  
  // Fill in white
  fill(255);
  noStroke();
  
}


void draw() {
  
  // Black background
  background(0);  
  
  // Draw the circle in xCircle,yCircle position
  ellipse(xCircle, yCircle, 50, 50);
  
}


// Event that is executed when a new OSC message reachs out network card
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for (/testIED). */
  
  if(theOscMessage.checkAddrPattern("/testIED")==true) {
    
    /* check if the typetag is the right one (2 FLOATS - ff). */
    if(theOscMessage.checkTypetag("ff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      xCircle = theOscMessage.get(0).floatValue();  
      yCircle = theOscMessage.get(1).floatValue();
      
      // Print message in console
      print("### received an osc message /testIED with typetag ff.");
      println(" values: "+ xCircle +", "+yCircle);
      return;
    }  
  } 
  
  // If we receive another OSC message, print it on console
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}