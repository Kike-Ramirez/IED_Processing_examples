/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 5/2/2017

Subject: Image Dot Effect

For more information about Processing image library, please check:
https://www.processing.org/reference/PImage.html

*/


// cam is an object of class "Capture", it implements video camera functions.
PImage picture;

// Variables to store capture width and height
int pictureWidth, pictureHeight;

// Step to generate matrix points and its limits.
float step, stepMax, stepMin;



void setup() {
  
  // We select a window size to fit 2 images
  size(1414, 720);

  // Load picture into file
  picture = loadImage("turturro.jpg");
  
  // Set capture's width and height
  pictureWidth = picture.width;
  pictureHeight = picture.height;
  
  println(pictureWidth + " " + pictureHeight);
  

  
  // Initialize step value and its limits
  step = 10;
  stepMax = 100;
  stepMin = 2;
  
}

void draw() {

  // We set a white background
  background(255);
  
  // We display sample Image in the left half of the window
  image(picture, 0, 0, pictureWidth, pictureHeight);
  
  // We set black fill and no stroke for drawing
  fill(0);
  noStroke();
  
  // The image is sampled at step values in a matrix  
  for (int i = 0; i < pictureWidth; i += step) {
    for (int j  = 0; j < pictureHeight; j+= step) {
      
      // We store actual pixel's color in colorPixel
      color colorPixel = picture.get(i, j);
      // We calculate brightness for actual pixel
      float brightness = brightness(colorPixel);
      // We calculate a radio depending of brightness
      float radio = map(brightness, 255, 0, 0, step);
      
      // We draw a circle on the right half of the window with 'radio' dimensions
      ellipse(pictureWidth + i, j, radio, radio);
      
    }
  }
  
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
  text("Step: " + int(step), 10, 60);

  text("Press <Q> to quit.", 10, height - 20);

}



// The keyPressed() function is called once every 
// time a key is pressed. The key that was pressed 
// is stored in the 'key' variable.

void keyPressed() {

  // CHECK KEY PRESSED
  
  // Check if '+' has been pressed. If so, then increment step. 
  if (key == '+') step ++;
  // Check if '-' has been pressed. If so, then decrement step. 
  else if (key == '-') step--;
  // Check if "S" has been pressed. If so, then save actual frame to file.
  else if ((key == 's') || (key == 'S')) saveFrame("data/dot_effect_####.png");
  // Check if "Q" has been pressed. If so, then quit program.
  else if ((key == 'q') || (key == 'Q')) exit();  
  
  // CHECK STEP LIMITS
  
  // Check that step is not higher than maximum level
  if (step > stepMax) step = stepMax;
  // Check that step is not lower than minimum level
  else if (step < stepMin) step = stepMin;
  
}