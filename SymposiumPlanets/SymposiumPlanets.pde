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
  planets.add(new Planet(100, sun));
  //planets.add(new Planet(100, mercury));
  //planets.add(new Planet(100, venus));
  //planets.add(new Planet(100, earth));
  //planets.add(new Planet(100, mars));
}

void draw(){
  background(0);
  ambientLight(255,255,255);
  for(int i = 0; i < planets.size(); i++){
    planets.get(i).showPlanet(); 
  }
}