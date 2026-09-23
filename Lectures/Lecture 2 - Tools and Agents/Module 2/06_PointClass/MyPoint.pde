
class MyPoint{
  
  float x,y;
  float size; 
  color c;
  
  //Constructor
  public MyPoint(float x, float y, float size, color c){
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  // ---- Methods
  public void plot(){
    noStroke();
    fill(c);
    rect(x,y,size,size);
  }
  
  public void size_p(int s){
    this.size = s;
  }
  
  public void move(float xoff, float yoff){
    x = xoff; 
    y = yoff;
  }
  
  public void changeColor (color c){
    this.c = c;
  }
  
  
}
