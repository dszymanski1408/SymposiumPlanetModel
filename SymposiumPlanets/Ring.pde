class Ring{
   Ring(float x, float y, float size1, float size2){
       ring(x,y,size1,x,y,size2);
   }
  
  void ring(float cx1, float cy1, float r1, float cx2, float cy2, float r2)
  {
    beginShape();
     buildCircle(cx1,cy1,r1,true);
     buildCircle(cx2,cy2,r2,false); 
    endShape();
  }

  void buildCircle(float cx, float cy, float r, boolean isClockwise)
  {
    int numSteps = 10;
    float inc = TWO_PI/numSteps;
     
    if (isClockwise)
    {
      curveVertex(cx+r*cos(-inc),cy+r*sin(-inc)); 
      for (float theta=0; theta<TWO_PI-0.01; theta+=inc)
      {
        curveVertex(cx+r*cos(theta),cy+r*sin(theta));
      }
      curveVertex(cx+r,cy);
      curveVertex(cx+r*cos(inc),cy+r*sin(inc));
      vertex(cx+r,cy);
    }
    else
    {
      vertex(cx+r,cy);
      curveVertex(cx+r*cos(inc),cy+r*sin(inc));    
      for (float theta=TWO_PI; theta>0.01; theta-=inc)
      {
        curveVertex(cx+r*cos(theta),cy+r*sin(theta));
      }
      curveVertex(cx+r,cy);
      curveVertex(cx+r*cos(TWO_PI-inc),cy+r*sin(TWO_PI -inc));
    }  
  }
}