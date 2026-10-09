

float separationDistance = 100;
float alignDistance = 30;
float cohesionDistance = 50;
float cohesionAttractorDistance = 30;

float separationStrength = 10;
float alignStrength = 10;
float cohesionStrength = 3;
float cohesionAttractorStrength = 1;

float randomness = 7; 
Boolean drawTrace = false;

outLine outl;
Flock flock;
int Initial_num = 0;   // Initial number of flocks

void setup() {
  //size(800,600);
  fullScreen();
  background(0);
  
  outl = new outLine();

  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < Initial_num; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
  smooth();
}

void draw() {
  
  if (!drawTrace){
    background(0);
  }
  flock.run();
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
