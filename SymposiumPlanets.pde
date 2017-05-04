import peasy.*; 

PeasyCam cam;
 
void setup(){
   size(1920,1080, P3D);
   cam = new PeasyCam(this, 2000);
}

void draw(){
   ambientLight(255,255,255);
   sphere(100);
}