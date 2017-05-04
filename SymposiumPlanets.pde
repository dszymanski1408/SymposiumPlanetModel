import peasy.*; 

PeasyCam cam;

void settings(){
   fullScreen(P3D); 
}

void setup(){
   cam = new PeasyCam(this, 2000);
}

void draw(){
  background(0);
  stroke(255,255,255);
  fill(255,255,255);
  ambientLight(255,255,255);
  sphere(100);
}