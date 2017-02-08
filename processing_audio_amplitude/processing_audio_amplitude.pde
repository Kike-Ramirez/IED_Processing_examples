/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 8/2/2017

Subject: Audio Amplitude

For more information about Processing Minim library, please check:
http://code.compartmental.net/tools/minim/
*/

// Import MINIM library
import ddf.minim.*;

// Create Minim and AudioPlayer objects
Minim minim;
AudioPlayer groove;


void setup()
{

  // Set window size
  size(1024, 200);

  // Initialize objects
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3", 1024);
  
  // Set grove in loop (continuously playing)
  groove.loop();
}

void draw()
{
  
  // Black background
  background(0);
  
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
    
    // Draw left channel
    line( x1, 50 + groove.left.get(i)*50, x2, 50 + groove.left.get(i+1)*50 );
    
    // Draw right channel
    line( x1, 150 + groove.right.get(i)*50, x2, 150 + groove.right.get(i+1)*50 );
  }
  
  noStroke();
  fill( 255, 128 );
  
  // the value returned by the level method is the RMS (root-mean-square) 
  // value of the current buffer of audio.
  // see: http://en.wikipedia.org/wiki/Root_mean_square
  rect( 0, 0, groove.left.level()*width, 100 );
  rect( 0, 100, groove.right.level()*width, 100 );
}