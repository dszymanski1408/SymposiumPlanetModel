class Planet{

  private PShape shape;
  private int trans;
  private float x;
  private float y; 
  private float topx;
  private float topy;
  private float rotate;
  private float rotateX;
  
  Planet(float size, PImage image, int trans, float rotate, float rotateX){
    noStroke();
    shape = createShape(SPHERE, size);
    shape.setTexture(image);
    this.trans = trans;
    this.rotate = rotate;
    this.rotateX = rotateX;
  }
  
  public void showPlanet(){
     emissive(0,0,0);
     shape(shape); 
  }
  
  public void drawEllipse(int i){
    ellipseMode(CENTER);
    stroke(255,255,255);
    noFill();
    x = -100;
    y = 0;
    topx = trans * 2 * i;
    topy = trans * 3 * i;
    ellipse(x,y,topx,topy);
  }
  
  public float getRotate(){
     return rotate;
  }
  
  public float getOrbit(){
    return rotateX;  
  }
  
  public int getTrans(){
     return trans; 
  } 
  
  public float getTransF(){
     return trans; 
  }
}