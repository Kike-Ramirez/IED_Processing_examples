/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez
Date: 15/02/2017

Subject: Filtering images using Computer Vision (openCV)

openCV Reference: https://github.com/atduskgreg/opencv-processing

*/

// Import library
import gab.opencv.*;


// Declare object of class OpenCV
OpenCV opencv;

// Declare four images to save results
PImage  img, thresh, blur, adaptive;

void setup() {
  
  // Load the test image into img
  img = loadImage("test.jpg");
  
  // Set window size
  size(1080, 720);

  // Initialize opencv object
  opencv = new OpenCV(this, img);
  
  // Initialize gray image from img
  PImage gray = opencv.getSnapshot();
  // Set threshold to 80
  opencv.threshold(80);
  // Get thresh image from img
  thresh = opencv.getSnapshot();
  
  // Load gray image into opencv
  opencv.loadImage(gray);
  // Set a blur with radio 12
  opencv.blur(12);  
  // Save result into blur image
  blur = opencv.getSnapshot();
  
  // Load gray image into opencv again
  opencv.loadImage(gray);
  // Set an adaptive threshold
  opencv.adaptiveThreshold(591, 1);
  // Save result into adaptive
  adaptive = opencv.getSnapshot();
}

void draw() {
  
  // Save actual coordinates
  pushMatrix();
  // Scale to 50%
  scale(0.5);
  // Draw four images
  image(img, 0, 0);
  image(thresh, img.width, 0);
  image(blur, 0, img.height);
  image(adaptive, img.width, img.height);
  // Restore coordinates
  popMatrix();

  // Draw descriptive text into window
  fill(0);
  text("source", img.width/2 - 100, 20 );
  text("threshold", img.width - 100, 20 );
  text("blur", img.width/2 - 100, img.height/2 + 20 );
  text("adaptive threshold", img.width - 150, img.height/2 + 20 );
}