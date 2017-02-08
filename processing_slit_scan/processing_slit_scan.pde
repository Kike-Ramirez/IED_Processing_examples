/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 8/2/2017

Subject: SlitScan effect Implementation

For more information about Processing video library, please check:
https://processing.org:8443/reference/libraries/video/index.html

For more information about SlitScan effect, check:
http://www.flong.com/texts/lists/slit_scan/

*/

// Import processing video library (it must be installed first)
import processing.video.*;

// myMovie is an object of class "Movie", it reads video file and prepares every frame for processing.
Movie myMovie;

// Create a PGraphics object to draw in it and save it later
PGraphics myCanvas;

// Variables to store movie width and height
int movieWidth, movieHeight;

// Variable for storing frameRate selected
float fRate = 25.0;

// Step to generate matrix points and its limits.
int lineIndex, movieLength;



void setup() {
  
  // We select a window size to fit 2 images
  size(1280, 720);
  
  frameRate(fRate);

  // Set movie's width and height
  movieWidth = 1280;
  movieHeight = 720;
  
  // Load movie into "myMovie"
  myMovie = new Movie(this, "sampleVideo.mp4");
  
  // Initialize lineIndex
  lineIndex = 0;
  
  // Calculate the width neccesary for storing the image
  movieLength = int( myMovie.duration() * fRate );

  // We play our video
  myMovie.play();
  
  // Create a PGraphics object with enough resolution to save result image
  myCanvas = createGraphics(int( myMovie.duration() * fRate ), movieHeight );
  
  // We set "myCanvas" to have a black background
  myCanvas.beginDraw();
  myCanvas.background(100);
  myCanvas.endDraw();
 
}

void draw() {

  // We set a white background
  background(0);
  
  // We display sample Image in the left half of the window
  image(myMovie, 5, 5, movieWidth*0.4, movieHeight*0.4);
  
  // We set black fill and no stroke for drawing
  noFill();
  stroke(255,0,0);
  rect(movieWidth*0.4/2 + 5 - 1, 5, 2, movieHeight*0.4); 
  
  // We save central line of video in an image called "line"
  PImage line = myMovie.get(movieWidth/2, 0, 1, movieHeight);
  
  // We draw "line" in canvas, on position determined by lineIndex
  myCanvas.beginDraw();
  myCanvas.image(line, lineIndex, 0);
  myCanvas.endDraw();
  
  // Calculate the ratio between window and myCanvas to fit it
  float ratio = float(width)/myCanvas.width;
  
  // We display "myCanvas" with ratio in order to fit it on window
  image(myCanvas, 0, height/2, myCanvas.width * ratio, myCanvas.height * ratio);
  
  // We increment lineIndex
  lineIndex++;
  
  // We show information on screen about progression
  float percentage = myMovie.time()/myMovie.duration();
  fill(255);
  textSize(14);
  text(int(percentage * 100) + "% Completed", width/2, 50);
  
  // If we reached the end, save result and exit
  if (myMovie.time() >= myMovie.duration()) {
  
    myCanvas.save("ResultSlitScan.jpg");
    exit();
  
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}