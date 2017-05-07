import peasy.*; 

PeasyCam cam;

ArrayList<Planet> planets = new ArrayList<Planet>();

PImage sun;
PImage venus;
PImage mercury;
PImage mars;
PImage earth;

//Planet fire; this is just an example of the planet instance I need to create.

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
    planets.add(new Planet(100, sun));
  } 
  
  //here I need to make all of the planets as variables and instantiant them with instances of the planet class
}

void draw(){
  background(0);
  ambientLight(255,255,255);
  for(int i = 0; i < planets.size(); i++){
    planets.get(i).showPlanet(); 
  }
}