float r = 0;

void setup(){
  size(displayWidth, displayHeight);
  background(0);
  fill(0);
  noSmooth();
  noFill();
  stroke(255);
  frameRate(10);
  orientation(PORTRAIT); 
}

void draw(){
  background(0);
  translate(width/2,height/2);
  rotate(r);
  r=r+PI/140;
  drawTriangle(0,0,(width<height?width:height)-200);
}

void recurs(float x, float y, float size){
   if(size <15){ return; }
   fillRainbow(0,2,4, 127, 128);
   ellipse(x, y, size, size);
   recurs(x-size/2, y, size/2);
   recurs(x+size/2, y, size/2);
   recurs(x, y-size/2, size/2);
}

void drawTriangle(float centerX, float centerY, float size){
   if(size <5){ return; }
   fillRainbow(0,2,4,127,128);
   float edge= tan(PI/6)*size/2.0;
   triangle(centerX-size/2, centerY+edge, centerX+size/2, centerY+edge, centerX, centerY-(size/2.0) / cos(PI/6));
   float yOffset= tan(PI/6)*size/4.0;
   float yOffset2 = dist(centerX, centerY, centerX, centerY-(size/2.0) / cos(PI/6) )/2.0;
   drawTriangle(centerX-size/4, centerY+yOffset, size/2);
   drawTriangle(centerX+size/4, centerY+yOffset, size/2);
   drawTriangle(centerX, centerY-yOffset2, size/2);
}

//rainbow
float frequency = 0.06;
float red, blue, green;
float i=0;
void fillRainbow(float phase1, float phase2, float phase3, float center, float wdth){
   i=i-0.1;
   red   = sin(frequency*i + phase1) * wdth + center;
   green = sin(frequency*i + phase2) * wdth + center;
   blue  = sin(frequency*i + phase3) * wdth + center;
   stroke(red, green, blue);
}