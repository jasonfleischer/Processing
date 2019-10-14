void setup() {
  size(displayWidth, displayHeight);
  frameRate(300);
  background(0);
  stroke(255);
}
float t = 0;
int p1 = 0;
int  p2 =0;
int x = 0;
int y = 0;
float r = 0;
boolean flip = false;
boolean flipS = true;
float currentColor = 0;
void draw() {

  p1 = 0;
  p2 = 0;
  t= t +0.1;
  
  int distance = int(noise(30+t)*dist(mouseX, mouseY, width/2, height/2)*1.25);
  if (flip) {
    currentColor = currentColor - 0.1;
    if (currentColor < 0)
      currentColor = 0;
  } else {
    currentColor = currentColor + 0.1;
    if (currentColor > 255)
      currentColor = 255;
  }

  x = x + int((noise(30+t)*50)) -25;
  if (x<0) {
    x=0;
  }
  if (x>width) {
    x= width;
  }
  y = y + int((noise(2*t)*50)) -25;
  if (y<0) {
    y=0;
  }
  if (y>height) {
    y= height;
  }

  translate(width/2,height/2);//mouseX, mouseY);

  int size = int(noise(78+t)*50);
  noStroke();

  fill(currentColor);
  //ellipse(0, 0, size, size);


  r = r+1%TWO_PI;
  rotate(r);
  if (flipS)
    drawSine(distance);
  else
    drawline(distance);
}

void drawline(int distance) {
  //stroke(currentColor, currentColor,currentColor, currentColor );//noise(t+754)*255, noise(t+754)*255);
  //line(p1, p2, p1+distance, p2);
  for (int i=0; i<distance; i++) {
   
    float clr =   currentColor*(1.0-(i/float(distance)));
    //println("cur:"+currentColor);
    fill(clr,clr,clr,clr);//, clr,clr, currentColor );
    noStroke();
    ellipse(i, i/float(distance), 1, 1);
  }
}
void drawSine(int distance) {
  for (int i=0; i<distance; i++) {
    float clr =   currentColor*(1.0-(i/float(distance)));
    fill(clr, clr, clr, clr);
    noStroke();
    ellipse(i, sin(i/3), 1, 1);
  }
}

void keyPressed() {

  if (key=='q') {
    flip = !flip;
  } 
  if (key=='c') {
    background(0);
    currentColor =0;
    flip = false;
  }
  if (key=='s') {
    flipS = !flipS;
  }
}