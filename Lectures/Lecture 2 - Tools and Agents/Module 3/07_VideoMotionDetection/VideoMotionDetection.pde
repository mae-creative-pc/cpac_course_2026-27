
import processing.video.*;

Capture video;
PImage prev;

void setup() {
  size(640, 480);
  pixelDensity(1);
  String[] cameras = Capture.list();
  printArray(cameras);
  video = new Capture(this, cameras[0]);
  video.start();
  prev = createImage(640, 480, RGB);
}

void captureEvent(Capture video) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
}
   
    
void draw() {
  
  loadPixels();
  
  video.loadPixels();
  prev.loadPixels();
  image(video, 0, 0);

  int threshold = 50;
  
  for (int loc=0;loc<video.pixels.length;loc++){
      
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      color prevColor = prev.pixels[loc];
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = blue(prevColor);

      float d = distSq(r1, g1, b1, r2, g2, b2); 

      if (d > threshold*threshold) {
        pixels[loc] = color(255);
      } else {
        pixels[loc] = color(0);
      }
  }
  updatePixels();
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) +(z2-z1)*(z2-z1);
  return d;
}
