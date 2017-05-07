class Planet{

  private PShape shape;
  
  Planet(float size, PImage image){
    noStroke();
    shape = createShape(SPHERE, size);
    shape.setTexture(image);
  }
  
  public void showPlanet(){
     shape(shape); 
  }
}
