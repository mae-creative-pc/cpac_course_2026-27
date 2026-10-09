
import fisica.*;

FWorld world;

int circleCount = 20;

ArrayList<FBlob> blobs;

void setup() {
  size(400, 400);
  smooth();
  
  blobs = new ArrayList<FBlob>();

  Fisica.init(this);

  world = new FWorld();

  world.setEdges();
  world.setEdgesRestitution(0.8);
  
  for (int i=0; i<circleCount; i++) {
    FBlob b = new FBlob();
    float s = random(30, 40);
    b.setAsCircle(random(50,width-50), random(50,height-50), s, 30);
    b.setStroke(0);
    b.setStrokeWeight(2);
    b.setFill(255);
    world.add(b);
    
    blobs.add(b);
  }
}

void draw() {
  background(80, 120, 200);
  world.setGravity(map(mouseX, 0, width, -100, 100), map(mouseY, 0, height, -100, 100));

  world.step();
  world.draw();
  
}
      
