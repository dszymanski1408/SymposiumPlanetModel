import peasy.*; 

PeasyCam cam;

ArrayList<Planet> planets = new ArrayList<Planet>();

PImage sun;
PImage venus;
PImage mercury;
PImage mars;
PImage earth;

void settings(){
   fullScreen(P3D); 
}

void setup(){
  cam = new PeasyCam(this, 2000);
  sun = loadImage("sunTexMap.jpg"); 
  venus = loadImage("venusTexMap.jpg");
  mercury = loadImage("mercuryTexMap.jpg");
  mars = loadImage("marsTexMap.jpg");
  earth = loadImage("earthTexMap.jpg");
  planets.add(new Planet(300, sun, 0));
  planets.add(new Planet(20, mercury, 300));
  planets.add(new Planet(35, venus, 200));
  planets.add(new Planet(70, earth, 200));
  planets.add(new Planet(55, mars, 200));
}

void draw(){
  background(0);
  ambientLight(255,255,255);
  pushMatrix();
    translate(-100, 0);
    planets.get(0).showPlanet();
  popMatrix();
  for(int i = 1; i < planets.size(); i++){
    planets.get(i).drawEllipse(i);
    planets.get(i).showPlanet(); 
  }
}