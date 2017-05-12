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
    //rotateY(radians(frameCount/planets.get(0).getOrbit()));
    rotateY(frameCount/planets.get(0).getOrbit());
    translate(planets.get(0).getTrans(), 0);
    planets.get(0).showPlanet();
  popMatrix();
  //pushMatrix();
  //  rotateX(planets.get(1).getRotate());
  //  planets.get(1).drawEllipse(1);
  //  //rotateY(radians(frameCount/planets.get(1).getOrbit()));
  //  rotateZ(frameCount/planets.get(1).getOrbit());
  //  translate(planets.get(1).getTrans(), 0);
  //  planets.get(1).showPlanet();
  //  float x = modelX(876, 0, 0);
  //  float y = modelY(876, 0, 0);
  //  float z = modelZ(876, 0, 0);
  //  if(z > 20){
  //    translate(0,0,frameCount); 
  //  }
  //  println("" + x + ", " + y + ", " + z + "");
    
  //popMatrix();
  pushMatrix();
    rotate(planets.get(1), 1);
  popMatrix();
}

void rotate(Planet planet, int num){
    int cx = -100;
    int cy = 0;
    int a = planet.getTrans() * 3 * num; //radius of the circle
    int b = planet.getTrans() * 2 * num;
    float t = millis()/4000.0f; //increase to slow down the movement
    
    translate(planet.getTrans(), 0);
    planet.showPlanet();
    planet.drawEllipse(num);
    int transFactor = planet.getTrans();
    
    float px = modelX(transFactor, 0, 0);
    float py = modelY(transFactor, 0, 0);
    
    for (int i = 1 ; i <= 12; i++) {
        t = t + 100;
        int x = (int)(cx + a * cos(t));
        int y = (int)(cy + b * sin(t));
        
        px = x;
        py = y;
        
        textSize(30);
        text(i, x, y);

        if (i == 10) {
            textSize(15);
            text("x: " + x + " y: " + y, x - 50, y - 20);
        }
    }
}