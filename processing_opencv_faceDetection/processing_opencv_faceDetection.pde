/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 15/02/2017

Subject: Face detection using Computer Vision (openCV)

openCV Reference: https://github.com/atduskgreg/opencv-processing

*/

// Import libraries
import gab.opencv.*;
// Import Java library to use Rectangle class
import java.awt.Rectangle;


// Declare openCV object
OpenCV opencv;
// Declare a list "faces" of object of class Rectangle
Rectangle[] faces;

void setup() {
  
  // Load test image into opencv
  opencv = new OpenCV(this, "test.jpg");
  
  // Set window size
  size(648, 432);

  // Set type of detection "FrontalFace"
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  // Save all faces detected into array "faces"
  faces = opencv.detect();
}

void draw() {
  
  // Draw image
  image(opencv.getInput(), 0, 0);

  // Set drawing style
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  
  // Loop through faces array displaying a rectangle over every face
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}