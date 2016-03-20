//Jason Fleischer
//reference: Processing for Visual Arts: Andrew Glassner

int numOfSpokes = 100;
float t =0;
boolean flip = true;

void setup(){
  size(displayWidth,displayHeight);
  smooth();
  noStroke();
  mouseX=width/2;
  mouseY=height/2;
}

void draw(){
  
  t=t+0.01;
  if(flip){
    numOfSpokes--;
    if(numOfSpokes<50){
      flip = !flip;
    }
  }else{
    numOfSpokes++;
    if(numOfSpokes>150){
      flip = !flip;
    }
  }
  
  color c = color(noise(t)*255,noise(t+6)*255,noise(t+12)*255);
  colorMode(RGB);
  fill(c);
  colorMode(HSB);
  background(hue(c),saturation(c),brightness(c)+30); 
  
  pushMatrix();
  translate(width/2, height/2);
  drawStar(numOfSpokes);
  popMatrix();
  
  pushMatrix();
  translate(constrain(mouseX, width/3, width*2/3), constrain(mouseY, height/3, height*2/3));
  rotate(TWO_PI * frameCount/800);
  drawStar(100);
  popMatrix();
}

void drawStar(int numSpokes){
  for(int i=0;i<numSpokes; i++){
    float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
    float t1 = t0 + (TWO_PI/(2*numSpokes));
    arc(0,0,width*2,width*2,t0,t1);
  }
}