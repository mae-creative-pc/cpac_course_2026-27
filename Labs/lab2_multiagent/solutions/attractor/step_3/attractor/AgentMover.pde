import processing.sound.*;

float alpha_amp=0.01;
float A_min=0.01;

float dist_min=50;
float dist_max=100;

class AgentMover{
  PVector position, velocity, acceleration;
  float mass, radius;
  SoundFile sound;
  AgentMover(float mass, SoundFile sound){
    /* YOUR CODE HERE: connect the agent with an audio and play it on loop (step 2) */
    this.position = new PVector(random(0, width), random(0, height));
    this.velocity = new PVector(random(-2, 2), random(-2, 2));
    this.acceleration = new PVector(random(2), random(2));
    this.mass=mass;
    this.radius=sqrt(this.mass/PI)*MASS_TO_PIXEL; 
    this.sound = sound;
    this.sound.amp(0);
    this.sound.loop();
  }
  void update(){    
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
    
  }
  void applyForce(PVector force){      
    PVector f = force.copy();
    f.div(this.mass);
    this.acceleration.add(f);    
  }
  
  void changeAmp(float d){
    float amp=max(1/(1+alpha_amp * d), A_min);
    this.sound.amp(amp);
  }
  
  void draw(){
    fill(200);
    noStroke();
    ellipse(this.position.x, this.position.y, this.radius, this.radius);    
  }
}
