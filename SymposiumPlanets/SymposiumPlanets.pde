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
PImage jupiter;
PImage saturn;
PImage uranus;
PImage neptune;

void setup(){
  size(1200,800,P3D);
  cam = new PeasyCam(this, 2500);
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
  jupiter = loadImage("jupiterMap.jpg");
  saturn = loadImage("saturnMap.jpg");
  uranus = loadImage("uranusTex.jpg");
  neptune = loadImage("neptuneMap.jpg");
  //                    ("name", size, image, tilt, speed, major axis, minor axis, if gass giant) 
  planets.add(new Planet("Sun",700, sun, 7.25, 1000, 0 , 0, false));
  planets.add(new Planet("Mercury", 10, mercury, 0.03, 20, 566 + 350,563 + 350, false));
  planets.add(new Planet("Venus",30.5 , venus, 2.64, 35.02, 666 + 450, 665 + 450, false));
  planets.add(new Planet("Earth",32.5, earth, 27.3, 29.78, 749 + 450, 748 + 450, false));
  planets.add(new Planet("Mars",17, mars, 25.19, 24.77, 907 + 450, 904 + 450, false));
  //                  ("name", parent planet, size, image, tilt, speed, major axis, minor axis)
  planets.add(new Moon("Moon", planets.get(3), 6.5, moon, 6.68, 5.6 ,41.1, 40.6));
  planets.add(new Moon("Phobos", planets.get(4), 1.05, phobos, 26.04, 2.1, 18.45, 18.45));
  planets.add(new Moon("Deimos", planets.get(4), 0.8, deimos, 27.58 , 1.3 , 20.9, 20.9));
  planets.add(new Planet("Jupiter", 200, jupiter, 6.09, 13.7, 2100, 2000, true));
  planets.add(new Planet("Saturn", 130, saturn, 5.51, 9.69, 2600, 2800, true));
  planets.add(new Planet("Uranus", 65, uranus, 90, 6.8, 4000, 3600, true));
  planets.add(new Planet("Neptune", 62, neptune, 28, 5.43, 4300, 4200, true));
}

void draw(){
  background(back);
  ambientLight(255,255,255);
  pushMatrix();
    //ring1.ring(0,0,500,0,0,600); 
    planets.get(0).showPlanet();
    fill(255,255,255); 
    textSize(100);
    text(planets.get(0).getName(), 0 - 25, 0 - planets.get(0).getSize() - 50);
  popMatrix();
  for(int i = 1; i < planets.size(); i++){
     pushMatrix();
     Planet planet = planets.get(i);
     if(planet instanceof Moon){
       rotate((Moon) planet);
     }
     else{
       rotate(planet, i);
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
    else if(key == '8'){
      thread("changeCam8"); 
    }
    //else if(key == '9'){
    //  thread("changeCam9");
    //}
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
     cam.lookAt(planets.get(8).getModelX(), planets.get(8).getModelY() + 20, 0);  
  }
}
void changeCam6(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(9).getModelX(), planets.get(9).getModelY() + 20, 0);  
  }
}
void changeCam7(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(10).getModelX(), planets.get(10).getModelY() + 20, 0);  
  }
}

void changeCam8(){
  if(millis() % 1 == 0){
     cam.lookAt(planets.get(11).getModelX(), planets.get(11).getModelY() + 20, 0);
  }
}

//void changeCam9(){
//  if(millis() % 1 == 0){
//     cam.lookAt(planets.get(9).getModelX(), planets.get(12).getModelY() + 20, 0);
//  }
//}

void rotate(Planet planet, int count){
    int cx = 25;
    int cy = 0;
    float a = planet.getMajor();
    float b = planet.getMinor();
    float num = planet.getOrbit();
    float t = millis()/((4000.0 * count) / (num / count * 0.2)); //increase to slow down the movement
   
    planet.drawEllipse();
    
    t = t + 100;
    int x = (int)(cx + a * cos(t));
    int y = (int)(cy + b * sin(t));
    
    fill(255,255,255); 
    if(planet.getSize() * 0.5 > 50){
      textSize(planet.getSize() * 0.5);
      text(planet.getName(), x - 75, y - (planet.getSize() * 1.5));
    }
    else{
      textSize(50);
      text(planet.getName(), x - 50, y - 70); 
    }
    
    translate(x, y);
    
    if(planet.getName().equals("Saturn")){
      pushMatrix();
        noStroke();
        fill(139,69,19);
        rotateY(radians(90));
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.40, planet.getSize() * 1.30);
        fill(222,184,135);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.55, planet.getSize() * 1.40);
        fill(78,40,10);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.90, planet.getSize() * 1.65);
        fill(141,72,19);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 2, planet.getSize() * 1.95);
      popMatrix();
    }
    
    if(planet.getName().equals("Uranus")){
      pushMatrix();
        noStroke();
        fill(40,40,40);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.40, planet.getSize() * 1.30);
        fill(80,80,80);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.55, planet.getSize() * 1.40);
        fill(20,20,20);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 1.90, planet.getSize() * 1.65);
        fill(60,60,60);
        ring(planet.getModelX() / x, planet.getModelY() / y,planet.getSize() * 2, planet.getSize() * 1.95);
      popMatrix();
    }
    
    if(!planet.getType()){
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
    }
    
    rotateY(radians(planet.getRotate()));
    rotateZ(PI/2);
    rotateY(millis()/ 1000.0);
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
    textSize(20);
    text(moon.getName(), x, y + 25);
        
    translate(x, y);
    rotateY(radians(moon.getRotate()));
    rotateZ(PI/2);
    rotateY(millis()/3000.0);
    moon.showPlanet();
    
    moon.setModelX(modelX(0,0,0));
    moon.setModelY(modelY(0,0,0));
}

void ring(float cx1, float cy1, float r1 , float r2){
  beginShape();
    buildCircle(cx1,cy1,r1,true);
    buildCircle(cx1,cy1,r2,false); 
  endShape();
}
  
void buildCircle(float cx, float cy, float r, boolean isClockwise){
  int numSteps = 10;
  float inc = TWO_PI/numSteps;
       
  if (isClockwise){
    curveVertex(cx+r*cos(-inc),cy+r*sin(-inc));
      
    for (float theta=0; theta<TWO_PI-0.01; theta+=inc){
      curveVertex(cx+r*cos(theta),cy+r*sin(theta));
    }
    curveVertex(cx+r,cy);
      
    curveVertex(cx+r*cos(inc),cy+r*sin(inc));
      
    vertex(cx+r,cy);
    }
    else{
      vertex(cx+r,cy);
      
      curveVertex(cx+r*cos(inc),cy+r*sin(inc));
          
      for (float theta=TWO_PI; theta>0.01; theta-=inc){
        curveVertex(cx+r*cos(theta),cy+r*sin(theta));
      }
      curveVertex(cx+r,cy);
      
      curveVertex(cx+r*cos(TWO_PI-inc),cy+r*sin(TWO_PI -inc));
   }  
}