/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 10/2/2017

Subject: Audio Beat Detection

For more information about Processing Minim library's Beat detection, please check:
http://code.compartmental.net/minim/beatdetect_class_beatdetect.html
*/

// Import minim library
import ddf.minim.*;
import ddf.minim.analysis.*;

// Declare necessary objects for beat detection
Minim minim;
AudioPlayer song;
BeatDetect beat;

// Declare variables to save circle sizes
float eRadiusHat, eRadiusKick, eRadiusSnare;


void setup()
{
  // Set window size
  size(600, 200);
  
  // Initialize minim object
  minim = new Minim(this);
  
  // Load song into object and start playing
  song = minim.loadFile("marcus_kellis_theme.mp3", 2048);
  song.play();
  
  // a beat detection object song SOUND_FREQUENCY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());


  // Initialize radius for circles
  ellipseMode(RADIUS);
  eRadiusHat = 20;
  eRadiusKick = 20;
  eRadiusSnare = 20;

}

void draw()
{

  // Set black background
  background(0);
  
  // Perform detection over the object song (mixed channels)
  beat.detect(song.mix);
  
  // Calculate transparency according to radius
  float aHat = map(eRadiusHat, 20, 80, 60, 255);
  float aKick = map(eRadiusKick, 20, 80, 60, 255);
  float aSnare = map(eRadiusSnare, 20, 80, 60, 255);

  // Draw the first circle (corresponding to "HAT" beat)
  fill(60, 255, 0, aHat);
  if ( beat.isHat() ) eRadiusHat = 80;
  ellipse(width* 1/4, height/2, eRadiusHat, eRadiusHat);
  eRadiusHat *= 0.95;
  if ( eRadiusHat < 20 ) eRadiusHat = 20;

  // Draw the first circle (corresponding to "KICK" beat)
  fill(0, 60, 255, aKick);
  if ( beat.isKick() ) eRadiusKick = 80;
  ellipse(width* 2/4, height/2, eRadiusKick, eRadiusKick);
  eRadiusKick *= 0.95;
  if ( eRadiusKick < 20 ) eRadiusKick = 20;

  // Draw the first circle (corresponding to "SNARE" beat)
  fill(255, 0, 60, aSnare);
  if ( beat.isSnare() ) eRadiusSnare = 80;
  ellipse(width * 3/4, height/2, eRadiusSnare, eRadiusSnare);
  eRadiusSnare *= 0.95;
  if ( eRadiusSnare < 20 ) eRadiusSnare = 20;
  
}