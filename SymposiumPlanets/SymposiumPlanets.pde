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
PImage mantle;
PImage outerCore;
PImage innerCore;

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
  mantle = loadImage("magmaEarth.jpg");
  outerCore = loadImage("outerCore.png");
  innerCore = loadImage("innerCore.jpg");
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
    fill(255,255,255); 
    textSize(50);
    text(planets.get(0).getName(), 0 - 25, 0 - planets.get(0).getSize() - 50);
  popMatrix();
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
  if(keyPressed){
    if(key == '1'){
      thread("changeCam1");
    }
    else if(key == '2'){
      thread("changeCam2");
    }
    else if(key == '3'){
      thread("changeCam3");
    }
    else if(key == '4'){
      thread("changeCam4");
    }
    else if(key == '5'){
      thread("changeCam5");
    }
    else if(key == '6'){
      thread("changeCam6");
    }
    else if(key == '7'){
      thread("changeCam7");
    }
  }
}

void changeCam1(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(1).getModelX(), planets.get(1).getModelY() + 20, 0);  
  }
}
void changeCam2(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(2).getModelX(), planets.get(2).getModelY() + 20, 0);  
  }
}
void changeCam3(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(3).getModelX(), planets.get(3).getModelY() + 20, 0);  
  }
}
void changeCam4(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(4).getModelX(), planets.get(4).getModelY() + 20, 0);  
  }
}
void changeCam5(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(5).getModelX(), planets.get(5).getModelY() + 20, 0);  
  }
}
void changeCam6(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(6).getModelX(), planets.get(6).getModelY() + 20, 0);  
  }
}
void changeCam7(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(7).getModelX(), planets.get(7).getModelY() + 20, 0);  
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
    
    fill(255,255,255); 
    textSize(20);
    text(planet.getName(), x - 25, y - planet.getSize() - 20);
    
    translate(x, y);
    
    noStroke();
    
    PShape first = createShape(SPHERE, planet.getSize()/1.1);
    first.setTexture(mantle);
    shape(first);
    
    PShape second = createShape(SPHERE, planet.getSize()/1.75);
    second.setTexture(outerCore);
    shape(second);
    
    PShape third = createShape(SPHERE, planet.getSize()/2.75);
    third.setTexture(innerCore);
    shape(third);
    
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
     
    fill(255,255,255);  
    textSize(10);
    text(moon.getName(), x, y + moon.getSize() + 10);
        
    translate(x, y);
    rotateY(radians(moon.getRotate()));
    rotateZ(PI/2);
    rotateY(millis()/3000.0);
    moon.showPlanet();
    
    moon.setModelX(modelX(0,0,0));
    moon.setModelY(modelY(0,0,0));
}