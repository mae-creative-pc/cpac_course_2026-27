
float offset = 5;
color c;
float tempC = 0;

MyPoint p1;

void setup(){
  size(800,800);
  frameRate(60);
  c = color(255, 0, 0);
  p1 = new MyPoint(10,10,10, c);
  p1.plot();
}


void draw(){ 
  background(255,255,255);
  p1.size_p(mouseX);
  p1.move(mouseX,mouseY);
  p1.plot();
}
