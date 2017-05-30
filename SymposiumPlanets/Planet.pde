class Planet{

  private PShape shape;

  private float rotate;
  private float rotateX;
  private String name;
  private float major;
  private float minor;
  private float modelx;
  private float modely;
  private float size;
  private boolean gas;
  
  Planet(String name, float size, PImage image, float rotate, float rotateX, float major, float minor, boolean gas){
    noStroke();
    shape = createShape(SPHERE, size);
    shape.setTexture(image);
    this.size = size;
    this.rotate = rotate;
    this.rotateX = rotateX;
    this.name = name;
    this.major = major;
    this.minor = minor;
    this.gas = gas;
  }
  
  public void showPlanet(){
     emissive(0,0,0);
     shape(shape); 
  }
  
  public void drawEllipse(){
    ellipseMode(CENTER);
    stroke(255,255,255);
    noFill();
    ellipse(25,0,major * 2,minor * 2);
  }
  
  public float getRotate(){
     return rotate;
  }
  
  public float getOrbit(){
    return rotateX;  
  }

  public String getName(){
      return name; 
  }
  
  public float getMinor(){
     return minor; 
  }
  
  public float getMajor(){
     return major; 
  }
  
  public float getModelX(){
     return modelx; 
  }
  
  public void setModelX(float modelx){
     this.modelx = modelx;
  }
  
  public float getModelY(){
     return modely; 
  }
  
  public void setModelY(float modely){
     this.modely = modely; 
  }
  
  public float getSize(){
     return size; 
  }
  
  public boolean getType(){
     return gas; 
  }
}