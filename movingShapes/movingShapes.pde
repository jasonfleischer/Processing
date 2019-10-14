float circleX = 300;
float circleY = 300;
float ellipseSizeX = 120;
float ellipseSizeY = 80;

void setup() {
  size(1000, 1000);
  background(255);
  //smooth();
  //drawPattern();
  
  rectTransY = random(height);
}

float i = 0;
float j = 0;
float rectTransY = 200;
void draw() {
 
  pushMatrix();
  translate(j*2, rectTransY);
  rotate(radians(frameCount*3));
  float scl = sin(radians(frameCount *3.5));
  scale(map(scl, -1, 1, .5, 1));
  noFill();
  stroke(0, noise(j)*255, 89);
  rect(-60, -40, 120, 180);
   j++;
  if(j*2>width){
     j =0;
     rectTransY = random(height);
  }
  //translate(frameCount, 200);
  //rect(-80, -140, 120, 80);

  popMatrix();
 i = (i +0.5);
 if(i>360){
   circleX = random(width);
   circleY = random(height);
   
   i = 0;
   ellipseSizeX = random(120); 
   ellipseSizeY = random(80);
 }
 //println (i);
translate(circleX, circleY);

    pushMatrix();
    rotate(radians(i));
    translate(100, 200);
    scale(map(sin(radians(i*6)), -1, 1, .5, 1), map(sin(radians(i*3)), -1, 1, .5, 1));
    noFill();
    stroke(155, noise(i)*255, 0);
    ellipse(0, 0, ellipseSizeX+i, ellipseSizeY-i);

    popMatrix();


}

void drawPattern() {
  translate(300, 300);
  for (float i =0; i<360; i +=0.7) {
    pushMatrix();
    rotate(radians(i));
    translate(100, 200);
    scale(map(sin(radians(i*6)), -1, 1, .5, 1), map(sin(radians(i*3)), -1, 1, .5, 1));
    noFill();
    stroke(255, 0, 0, 128);
    ellipse(0, 0, 120+i, 80-i);

    popMatrix();
  }
}