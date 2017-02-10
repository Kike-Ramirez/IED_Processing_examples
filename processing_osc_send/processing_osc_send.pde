/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 10/2/2017

Subject: OSC Send example. Sketch that sends OSC messages corresponding to a circle's location to another equipment.

For more information about Processing OSCP5 library, please check:
http://www.sojamo.de/libraries/oscP5/

*/
 
// Import libraries 
import oscP5.*;
import netP5.*;
  
// Declare objects
OscP5 oscP5;
NetAddress myRemoteLocation;

// Declare two floats for saving the circle's center
float xCircle, yCircle;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12001);
  
  // Initialize circle's center
  xCircle = width/2;
  yCircle = height/2;
  
  // Set white fill & no stroke
  fill(255);
  noStroke();
  
}


void draw() {
  
  // Set black background
  background(0);  
  
  // Set circle's center to mouse position
  xCircle = mouseX;
  yCircle = mouseY;
  
  // Draw a circle
  ellipse(xCircle, yCircle, 50, 50);
  
  // Create an object of class OSCMessage with tag "/testIED"
  OscMessage myMessage = new OscMessage("/testIED");
  
  myMessage.add(xCircle); /* add a float to the osc message */
  myMessage.add(yCircle); /* add a float to the osc message */

  /* send the message to destiny*/
  oscP5.send(myMessage, myRemoteLocation); 
}