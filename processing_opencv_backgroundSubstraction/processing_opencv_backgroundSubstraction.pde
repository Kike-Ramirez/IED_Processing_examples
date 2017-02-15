/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 15/02/2017

Subject: Background substraction using Computer Vision (openCV) and video file

openCV Reference: https://github.com/atduskgreg/opencv-processing

*/


// Import libraries
import gab.opencv.*;
import processing.video.*;

// Declare an object of class Movie
Movie video;

// Declare an object of class OpenCV
OpenCV opencv;

void setup() {
  
  // Set window size
  size(720, 480);
  // Load video into video object
  video = new Movie(this, "street.mov");
  // Initialize opencv with the same size than video
  opencv = new OpenCV(this, 720, 480);
  
  // Start Background Substraction
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  // Put video on loop
  video.loop();
 
}

void draw() {
  
  // Draw video frame into window
  image(video, 0, 0);  
  
  // Load actual video frame into opencv
  opencv.loadImage(video);
  
  // Update background in opencv
  opencv.updateBackground();
  
  // Dilate and Erode the image to reduce complexity
  opencv.dilate();
  opencv.erode();

  // Set drawing style
  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  
  // Find contours in actual frame and save them in contours array
  ArrayList<Contour> contours = opencv.findContours();
  
  // Loop through contours arraylist drawing every contour
  for (int i = 0; i < contours.size(); i++) {
    contours.get(i).draw();
  }
}


// Event to update frame from video card
void movieEvent(Movie m) {
  m.read();
}