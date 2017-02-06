/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 6/2/2017

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

// myCanvas is an object of class "PGraphics". It allows us to render in a different canvas.
PGraphics myCanvas;

// Variables to store movie width and height
int movieWidth, movieHeight;

// index for line position and maximum width for image processed
int lineIndex, movieLength;



void setup() {
  
  // We select a window size to fit 2 images
  size(640, 720);

  // Set movie's width and height
  movieWidth = 640;
  movieHeight = 360;
  
  // Initialize movie from file
  myMovie = new Movie(this, "transit.mov");
  
  // Initialize line index and movie length
  lineIndex = 0;
  movieLength = 371 ; // 371 Frames

  // We play our video
  myMovie.play();
  
  // We initialize a canvas with the same height than video and its width is video framerate * video duration
  myCanvas = createGraphics(movieLength, movieHeight);
  
  // Start drawing in myCanvas
  myCanvas.beginDraw();
  
  // Set a black background for my Canvas
  myCanvas.background(0);
  
  // Finish drawing in myCanvas
  myCanvas.endDraw();



  
}

void draw() {

  // We set a black background
  background(0);
  
  // We display sample Image in the left half of the window
  image(myMovie, 5, 5, movieWidth*0.9, movieHeight*0.9);
  
  // We set black fill and no stroke for drawing
  noFill();
  stroke(255,0,0);
  rect(movieWidth*0.9/2 + 5 - 1, 5, 2, movieHeight*0.9); 
  
  // We declare a line "image" copied from actual video frame (center vertical line)
  PImage line = myMovie.get(movieWidth/2, 0, 1, movieHeight);
  
  // Start drawing in myCanvas
  myCanvas.beginDraw();
  
  // Draw the copied line from video to myCanvas
  myCanvas.image(line, lineIndex, 0);
  
  // Finish drawing in myCanvas
  myCanvas.endDraw();
  
  
  // Display myCanvas in position 5, height/2
  image(myCanvas, 5, height/2);
  
  // Draw a white rectangle to border image
  stroke(255);
  noFill();
  rect(5, height/2, movieLength, movieHeight);
  
  // Set red stroke and no fill
  stroke(255,0,0);
  noFill();
  
  // Draw a red line from video line to image line
  line(movieWidth*0.9/2 + 5 - 1, 5 + movieHeight*0.9, lineIndex + 5, movieHeight);
  
  // Draw a rectangle to remark where the line is being drawn
  rect(lineIndex + 5, movieHeight, 2, movieHeight); 
  
  
  // If we have reached end of the video
  if (lineIndex == movieLength) {
  
    // Save image result in data folder
    myCanvas.save("data/ResultSlitScan.jpg");
    
    // Leave program
    exit();
  }

  
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {

  lineIndex++;
  m.read();

}