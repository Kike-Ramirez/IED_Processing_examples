/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 8/2/2017

Subject: Audio Amplitude II (Unknown Pleasures - Joy Division)

For more information about cover of "Unknown Pleasures" by Joy Division:
http://mudic-elisava.com/el-origen-de-la-portada-de-unknown-pleasures-de-joy-division/

For more information about Processing Minim library, please check:
http://code.compartmental.net/tools/minim/
*/

// Import MINIM library
import ddf.minim.*;

// Create Minim and AudioPlayer objects
Minim minim;
AudioPlayer groove;

// PImage to copy results
PImage sample;

void setup()
{

  // Set window size
  size(640, 480);

  // Initialize objects
  minim = new Minim(this);
  groove = minim.loadFile("Joy Division - Disorder.mp3", 1024);
  
  // Set grove in loop (continuously playing)
  groove.loop();
  
  sample = createImage(width, height, RGB);
  
  imageMode(CENTER);
}

void draw()
{
  
  // Black background
  background(0);
  // Copy the previous image resized
  sample.resize(int(sample.width * 0.94), int(sample.height * 0.94));
  image(sample, width/2, height/2);
  
  // White stroke
  stroke( 255 );
  
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  
  for(int i = 0; i < groove.bufferSize() - 1; i++)
  {
  
    float x1 = map( i, 0, groove.bufferSize(), 0, width );
    float x2 = map( i+1, 0, groove.bufferSize(), 0, width );
    
    // Draw mix channel
    line( x1, height - 25 - groove.mix.get(i)*100, x2, height - 25 - groove.mix.get(i+1)*100 );

  }
  
  sample = get();
  
}