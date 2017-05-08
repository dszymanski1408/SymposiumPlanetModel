class Planet{

  private PShape shape;
  private int trans;
  private float x;
  private float y; 
  private float topx;
  private float topy;
  
  Planet(float size, PImage image, int trans){
    noStroke();
    shape = createShape(SPHERE, size);
    shape.setTexture(image);
    this.trans = trans;
  }
  
  public void showPlanet(){
     emissive(0,0,0);
     translate(trans, 0);
     shape(shape); 
  }
  
  public void drawEllipse(int i){
    ellipseMode(CORNER);
    stroke(255,255,255);
    noFill();
    x = trans;
    topx = -1000 * i * 1.5;
    topy = x * -3 * i;
    y = x * 1.5 * i;
    ellipse(x,y,topx,topy);
  }
}