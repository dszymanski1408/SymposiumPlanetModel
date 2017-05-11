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
  cam = new PeasyCam(this, 3000);
  sun = loadImage("sunTexMap.jpg"); 
  venus = loadImage("venusTexMap.jpg");
  mercury = loadImage("mercuryTexMap.jpg");
  mars = loadImage("marsTexMap.jpg");
  earth = loadImage("earthTexMap.jpg");
  back = loadImage("milkyway.jpg");
  planets.add(new Planet(700, sun, -100, 7.25, 1000));
  planets.add(new Planet(20, mercury, 867, 0.03, 50));
  planets.add(new Planet(61, venus, 1036, 2.64, 35.02));
  planets.add(new Planet(65, earth, 1347, 23.44, 29.78));
  planets.add(new Planet(36, mars, 1511, 25.19, 24.077));
}

void draw(){
  background(back);
  ambientLight(255,255,255);
  pushMatrix();
    rotateX(planets.get(0).getRotate());
    rotateY(frameCount/planets.get(0).getOrbit());
    translate(planets.get(0).getTrans(), 0);
    planets.get(0).showPlanet();
  popMatrix();
  pushMatrix();
    rotateX(planets.get(1).getRotate());
    planets.get(1).drawEllipse(1);
    rotateY(frameCount/planets.get(1).getOrbit());
    translate(planets.get(1).getTrans(), 0);
    planets.get(1).showPlanet();
  popMatrix();
}