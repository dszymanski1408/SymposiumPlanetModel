import peasy.*; 

PeasyCam cam;

ArrayList<Planet> planets = new ArrayList<Planet>();

PImage sun;
PImage venus;
PImage mercury;
PImage mars;
PImage earth;
PImage back;

void setup(){
  size(1200,800,P3D);
  cam = new PeasyCam(this, 2000);
  sun = loadImage("sunTexMap.jpg"); 
  venus = loadImage("venusTexMap.jpg");
  mercury = loadImage("mercuryTexMap.jpg");
  mars = loadImage("marsTexMap.jpg");
  earth = loadImage("earthTexMap.jpg");
  back = loadImage("milkyway.jpg");
  planets.add(new Planet(700, sun, 0, 7.25, 0));
  planets.add(new Planet(20, mercury, 767, 0.03, 50));
  planets.add(new Planet(61, venus, 936, 2.64, 35.02));
  planets.add(new Planet(65, earth, 1247, 23.44, 29.78));
  planets.add(new Planet(36, mars, 1411, 25.19, 24.077));
}

void draw(){
  background(back);
  ambientLight(255,255,255);
  pushMatrix();
    translate(-100, 0);
    planets.get(0).showPlanet();
  popMatrix();
  for(int i = 1; i < planets.size(); i++){
    pushMatrix();
      rotateX(planets.get(i).getRotate());
      planets.get(i).drawEllipse(i);
      //float orbit = planets.get(i).getOrbit();
      //rotateY(orbit += i);
      planets.get(i).showPlanet();
    popMatrix();
  }
}