/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 5/2/2017

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

PGraphics myCanvas;

// Variables to store movie width and height
int movieWidth, movieHeight;

// Step to generate matrix points and its limits.
int lineIndex, movieLength;



void setup() {
  
  // We select a window size to fit 2 images
  size(1280, 720);

  // Set capture's width and height
  movieWidth = 1280;
  movieHeight = 720;
  
  myMovie = new Movie(this, "sampleVideo.mp4");
  
  // Initialize step value and its limits
  lineIndex = 0;
  myMovie.frameRate(29);
  movieLength = int( myMovie.duration() * 29.0 );

  myMovie.play();
  
  println(movieLength);

  myCanvas = createGraphics(movieWidth, int( myMovie.duration() * 29.0 ));
  
  myCanvas.beginDraw();
  myCanvas.background(0);
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
  
  PImage line = myMovie.get(movieWidth/2, 0, 1, movieHeight);
  
  myCanvas.beginDraw();
  myCanvas.image(line, lineIndex, 0);
  myCanvas.endDraw();
  
  image(myCanvas, 5, height/2, myCanvas.width * 0.4, myCanvas.height * 0.4);
  
  lineIndex++;
  
  // Instructions are displayed in window
  drawInstructions();

}


// Function to draw instructions in window
void drawInstructions() {

  // Set white color
  fill(255);
  // Set text size (check also textFont)
  textSize(14);
  // Draw instructions in screen");
  text("Press <+>/<-> to change step size.", 10, 20);
  text("Press <S> to save image file.", 10, 40);
  text("Step: " + int(2), 10, 60);

  text("Press <Q> to quit.", 10, height - 20);

}


// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}