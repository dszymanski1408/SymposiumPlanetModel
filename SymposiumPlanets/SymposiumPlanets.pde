import peasy.*; 

PeasyCam cam;

ArrayList<Planet> planets = new ArrayList<Planet>();

PImage sun;
PImage venus;
PImage mercury;
PImage mars;
PImage earth;
PImage back;
PImage moon;
PImage deimos;
PImage phobos;

void setup(){
  size(1200,800,P3D);
  cam = new PeasyCam(this, 1500);
  sun = loadImage("sunTexMap.jpg"); 
  venus = loadImage("venusTexMap.jpg");
  mercury = loadImage("mercuryTexMap.jpg");
  mars = loadImage("marsTexMap.jpg");
  earth = loadImage("earthTexMap.jpg");
  back = loadImage("milkyway.jpg");
  moon = loadImage("moonTexture.jpg");
  deimos = loadImage("deimosTex.jpg");
  phobos = loadImage("phobosTex.jpg");
  //                    ("name", size, image, tilt, speed, major axis, minor axis) 
  planets.add(new Planet("Sun",450, sun, 7.25, 1000, 0 , 0));
  planets.add(new Planet("Mercury", 10, mercury, 0.03, 50, 566,563));
  planets.add(new Planet("Venus",30.5 , venus, 2.64, 35.02, 666, 665));
  planets.add(new Planet("Earth",32.5, earth, 27.3, 29.78, 749, 748));
  planets.add(new Planet("Mars",17, mars, 25.19, 24.077, 907, 904));
  planets.add(new Moon("Moon", planets.get(3), 6.5, moon, 6.68, 5.6 ,41.1, 40.6));
  planets.add(new Moon("Phobos", planets.get(4), 1.05, phobos, 26.04, 2.1, 18.45, 18.45));
  planets.add(new Moon("Deimos", planets.get(4), 0.8, deimos, 27.58 , 1.3 , 20.9, 20.9));
}

void draw(){
  background(back);
  ambientLight(255,255,255);
  pushMatrix();
    planets.get(0).showPlanet();
    textSize(50);
    text(planets.get(0).getName(), 0 - 25, 0 - planets.get(0).getSize() - 50);
  popMatrix();
  //pushMatrix();
  //  rotate(planets.get(1));
  //popMatrix();
  //pushMatrix();
  //  rotate(planets.get(2));
  //popMatrix();
  //pushMatrix();
  //  rotate(planets.get(3));
  //popMatrix();
  //pushMatrix();
  //  rotate((Moon) planets.get(5));
  //popMatrix();
  //pushMatrix();
  //  rotate(planets.get(4));
  //popMatrix();
  //pushMatrix();
  //  rotate((Moon) planets.get(6));
  //popMatrix();
  //pushMatrix();
  //  rotate((Moon) planets.get(7));
  //popMatrix();
  for(int i = 1; i < planets.size(); i++){
     pushMatrix();
     Planet planet = planets.get(i);
     if(planet instanceof Moon){
       rotate((Moon) planet);
     }
     else{
       rotate(planet);
     }
     popMatrix();
  }
}

void rotate(Planet planet){
    int cx = 25;
    int cy = 0;
    float a = planet.getMinor();
    float b = planet.getMajor();
    float num = planet.getOrbit();
    float t = millis()/(1000.0 * num); //increase to slow down the movement
    
    planet.drawEllipse();
    
    t = t + 100;
    int x = (int)(cx + a * cos(t));
    int y = (int)(cy + b * sin(t));
     
    textSize(20);
    text(planet.getName(), x - 25, y - planet.getSize() - 20);
    
    translate(x, y);
    rotateY(radians(planet.getRotate()));
    rotateZ(PI/2);
    rotateY(millis()/3000.0);
    planet.showPlanet();
    
    planet.setModelX(modelX(0,0,0));
    planet.setModelY(modelY(0,0,0));
}

void rotate(Moon moon){
    Planet origin = moon.getParent();
 
    float cx = origin.getModelX();
    float cy = origin.getModelY();
    float a = moon.getMinor();
    float b = moon.getMajor();
    float num = moon.getOrbit();
    float t = millis()/(1000.0 * num); //increase to slow down the movement
    
    moon.drawEllipse();
    
    t = t + 100;
    int x = (int)(cx + a * cos(t));
    int y = (int)(cy + b * sin(t));
     
    textSize(10);
    text(moon.getName(), x, y + moon.getSize() + 10);
        
    translate(x, y);
    rotateY(radians(moon.getRotate()));
    rotateZ(PI/2);
    rotateY(millis()/3000.0);
    moon.showPlanet();
}