PImage img;

void setup() {
  size(1024, 576);
  frameRate(60);
  
  img = loadImage("40704.jpg");
  //imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  background(255);
  image(img,mouseX,mouseY,100,100);
}
