import peasy.*; 

PeasyCam cam;

ArrayList<Planet> planets = new ArrayList<Planet>();

PImage sun;
PImage venus;
PImage mercury;
PImage mars;
PImage earth;

void settings(){
   fullScreen(P3D, 2); 
}

void setup(){
  cam = new PeasyCam(this, 2000);
  sun = loadImage("sunTexMap.jpg"); 
  venus = loadImage("venusTexMap.jpg");
  mercury = loadImage("mercuryTexMap.jpg");
  mars = loadImage("marsTexMap.jpg");
  earth = loadImage("earthTexMap.jpg");
  //for loop can and should be changed, 5 is just how many planets I have atm.
  for(int i = 0; i <= 5; i++){
    planets.add(new Planet());
  } 
  planets.get(0).setPlanet(500, sun);
  planets.get(1).setPlanet(60, mercury);
  planets.get(2).setPlanet(100, venus);
  planets.get(3).setPlanet(120, earth);
  planets.get(4).setPlanet(90, mars);
}

void draw(){
  background(0);
  ambientLight(255,255,255);
  for(int i = 0; i < planets.size(); i++){
    planets.get(i).showPlanet(); 
  }
}