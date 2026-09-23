import processing.video.*;

int numPixelsWide, numPixelsHigh;
int blockSize = 5;
Movie mov;
color movColors[];

void setup() {
  size(1280, 720);
  noStroke();
  mov = new Movie(this, "video2.mp4");
  mov.loop();
  numPixelsWide = width / blockSize;         // number of new macro-pixels for width dimension
  numPixelsHigh = height / blockSize;        // number of new macro-pixels for height dimension
  movColors = new color[numPixelsWide * numPixelsHigh];
}

// Display values from movie
void draw() {  
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    int count = 0;
    
    // Cycle over macro-pixels
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        movColors[count] = mov.get(i*blockSize, j*blockSize);
        count++;
      }
    }
  }

  background(255);
  for (int j = 0; j < numPixelsHigh; j++) {
    for (int i = 0; i < numPixelsWide; i++) {
      fill(movColors[j*numPixelsWide + i]);
      rect(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }
}
