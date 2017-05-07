class Planet{

  private PShape shape;
  
  public void setPlanet(float size, PImage image){
    shape = createShape(SPHERE, size);
    shape.setTexture(image);
  }
  
  public void showPlanet(){
     shape(shape); 
  }
}