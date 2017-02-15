/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 15/02/2017

Subject: Face detection using Computer Vision (openCV) and live camera

openCV Reference: https://github.com/atduskgreg/opencv-processing

*/

// Import libraries
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

// Declare a video object of class "Capture" (live camera)
Capture video;

// Declare an object of class opencv
OpenCV opencv;



void setup() {
  
  // Set window size
  size(640, 480);
  
  // Initialize live camera object
  video = new Capture(this, 640/2, 480/2);
  
  // Initialize opencv object
  opencv = new OpenCV(this, 640/2, 480/2);
  
  // Set face detection method
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  // Start live cam feed
  video.start();
}

void draw() {
  
  // Set double size
  scale(2);
  
  // Load frame from live cam into opencv
  opencv.loadImage(video);

  // Display frame from live cam
  image(video, 0, 0 );

  // Set drawing style
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  
  // Detect all faces in the frame and save them in array "faces"
  Rectangle[] faces = opencv.detect();
  
  // print in console number of faces detected
  println(faces.length);
  
  // Loop through "faces" array drawing a rectangle over every face detected
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}