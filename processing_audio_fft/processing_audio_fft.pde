/*

IED Visual Communication Madrid

One Year Course of Digital Arts & Experience Design

PROCESSING

Author: Kike Ramírez

Date: 8/2/2017

Subject: Audio AmplitudeFFT


For more information about Minim and additional features, 
visit http://code.compartmental.net/minim/

*/

// Import MINIM library
import ddf.minim.analysis.*;
import ddf.minim.*;

// We create an object of class Minim
Minim       minim;

// We create a jingle object of class AudioPlayer
AudioPlayer jingle;

// We create a fft object of class FFT
FFT         fft;



void setup()
{

  // Set window size
  size(512, 200, P3D);
  
  // Initialize object minim
  minim = new Minim(this);
  
  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile("jingle.mp3", 1024);
  
  // loop the file indefinitely
  jingle.loop();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  
  colorMode(HSB);
  
}

void draw()
{
  background(255);
  stroke(255);
  
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );
  
  float step = map(mouseX, 0, width, 1, 100);
  
  for(int i = 0; i < fft.specSize(); i += step)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    
    float hue = map(i, 0, fft.specSize(), 0, 120);
    fill(hue, 255, 255);
    stroke(0);
    rect( i, height - fft.getBand(i)*8 , step, fft.getBand(i)*8);
  }
}