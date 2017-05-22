class Moon extends Planet{

  //private PShape shape;

  //private float rotate;
  //private float rotateX;
  //private String name;
  private float major;
  private float minor;
  private Planet origin;
  
  Moon(String name, Planet origin, float size, PImage image, float rotate, float rotateX, float major, float minor){
    super(name, size, image, rotate, rotateX, major, minor);
    //noStroke();
    //shape = createShape(SPHERE, size);
    //shape.setTexture(image);
    //this.rotate = rotate;
    //this.rotateX = rotateX;
    //this.name = name;
    this.major = major;
    this.minor = minor;
    this.origin = origin;
  }
  
  //public void showPlanet(){
  //   emissive(0,0,0);
  //   shape(shape); 
  //}
  
  public void drawEllipse(){
    ellipseMode(CENTER);
    stroke(255,255,255);
    noFill();
    ellipse(origin.getModelX(),origin.getModelY(),major * 2,minor * 2);
  }
  
  //public float getRotate(){
  //   return rotate;
  //}
  
  //public float getOrbit(){
  //  return rotateX;  
  //}

  //public String getName(){
  //    return name; 
  //}
  
  //public float getMinor(){
  //   return minor; 
  //}
  
  //public float getMajor(){
  //   return major; 
  //}
  
  public Planet getParent(){
     return origin; 
  }
}