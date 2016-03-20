// Jason Fleischer

float t = 0;
int vert = 2;
int horz = 2;
boolean stop = true;

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  fill(255);
  stroke(255);
  frameRate(24);
  orientation(LANDSCAPE);
}

void draw() {

  background(0);
  if (!stop) {
    t=t+1;
    vert = (vert+1);
    if (vert>9) {
      vert = 2;
    }
    horz = (horz+1);
    if (horz>5) {
      horz = 2;
    }
  }
  translate(width/2, height/2);
  recurse(0, 0, height/2);
}

void recurse(float p1, float p2, float d) {
  if (d < 6) {
    return;
  }
  fillRainbow(0, 2, 4, 127, 128);
  //down
  line(p1, p2, p1, p2+d);
  recurse((p1+p1)/2, (p2+p2+d)/2, d/vert);
  //up
  line(p1, p2, p1, p2-d);
  recurse((p1+p1)/2, (p2+p2-d)/2, d/vert);
  //right
  line(p1, p2, p1+d, p2);
  recurse((p1+p1+d)/2, (p2+p2)/2, d/horz);
  //left
  line(p1, p2, p1-d, p2);
  recurse((p1+p1-d)/2, (p2+p2)/2, d/horz);
}

//rainbow
float frequency = 0.07;
float red, blue, green;
float i=0;
void fillRainbow(float phase1, float phase2, float phase3, float center, float wdth) {
  i=i-0.1;
  red   = sin(frequency*i + phase1) * wdth + center;
  green = sin(frequency*i + phase2) * wdth + center;
  blue  = sin(frequency*i + phase3) * wdth + center;
  stroke(red, green, blue);
}

void mousePressed() {
  stop = !stop;
}