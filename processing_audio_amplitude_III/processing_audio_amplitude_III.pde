/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 8/2/2017

Subject: Audio Amplitude III (Audio Reactive Grahics)

For more information about this Real-Time Graphics:
https://manning-content.s3.amazonaws.com/download/c/85bbb4d-ee4f-46d2-9bc1-03b6f23b231f/GenArt-Sample-Intro.pdf

For more information about Processing Minim library, please check:
http://code.compartmental.net/tools/minim/
*/

// Import MINIM library
import ddf.minim.*;

// Create Minim and AudioPlayer objects
Minim minim;
AudioPlayer groove;


// Parameters for graphics
float angnoise, radiusnoise;    // Parameters for angle and radius noise
float xnoise, ynoise;           // Parameters for X/Y center noise
float angle = -PI/2;             // Initial angle in radians
float radius;                    // Radius
color colorA, colorB;             // Limit colors
float colorIndex, colorNoise;     // Parameters for color noise


void setup()
{

  // Set window size
  size(640, 480);

  // Set white background
  background(255);
  
  // Initialize objects
  minim = new Minim(this);
  groove = minim.loadFile("Joy Division - Disorder.mp3", 1024);
  
  // Set grove in loop (continuously playing)
  // groove.loop();

  // Give initial random values for parameters:
  angnoise = random(10);
  radiusnoise = random(10);
  xnoise = random(10);
  ynoise = random(10);
  
  // Set color limits as red and black
  colorA = color(255, 0, 0);
  colorB = color(0);
  colorNoise = 0;

}

void draw()
{
  
  // Draw a transparent white rectangle (fade out effect)
  fill(255, 1);
  noStroke();
  rect(0,0,width,height);
  
  // Calculate a random radius using Perlin noise
  radiusnoise += 0.005;
  radius = (noise(radiusnoise) * 550) + 1;
  // _radius = 550 * groove.mix.level();
  
  // Calculate a random angle using Perlin noise
  angnoise += 0.005;
  angle += (noise(angnoise) * 6) -3;
  
  if (angle > 360) angle -= 360;
  if (angle < 0) angle += 360;
  
  // Calculate index for Perlin noise X/Y calculation
  xnoise += 0.01;
  ynoise += 0.01;
  
  // Calculate new centers randomly using Perlin noise
  float centerX = width/2 + (noise(xnoise) * 100) - 50;
  float centerY = height/2 + (noise(ynoise) * 100) - 50;
  
  // Calculate first point
  float rad = radians(angle);
  float x1 = centerX + (radius * cos(rad));
  float y1 = centerY + (radius * sin(rad));

  // Calculate second point
  float opprad = rad + PI;
  float x2 = centerX + (radius * cos(opprad));
  float y2 = centerY + (radius * sin(opprad));
  
  // Calculate random color
  colorNoise += 0.003;
  colorIndex = noise(colorNoise);
  color colorStroke = lerpColor(colorA, colorB, colorIndex);
  stroke(colorStroke, 60);
  
  // Apply stroke weight to line
  strokeWeight(1);
  //if (groove.mix.level() > 0.15) strokeWeight(10 * groove.mix.level());
  //else strokeWeight(1);
    
  // Finally, draw the line
  line(x1, y1, x2, y2);
  
  

  
}