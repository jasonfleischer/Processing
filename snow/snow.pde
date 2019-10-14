
int numberOfFlakes = 500; // same as number on ground

SnowFlake[] snowFlakes;
Snow[] snow;

int[] ground;

int snowIndex = 0;

void setup() {
  size(450, 500);//displayWidth, displayHeight);
  frameRate(300);
  noStroke();
  ground = new int[width];
  
  snowFlakes = new SnowFlake[numberOfFlakes];
  for (int i = 0; i < numberOfFlakes; i = i+1) {
    snowFlakes[i] = new SnowFlake();
  }
  snow = new Snow[numberOfFlakes];
  for (int i = 0; i < numberOfFlakes; i = i+1) {
    snow[i] = new Snow();
  }
}

void draw() {
  background(0); 
  

  
  for (int i = 0; i < numberOfFlakes; i = i+1) {
    snowFlakes[i].display();
    snow[i].display();
  }
  
  for (int i = 0; i < width; i = i+1){
      stroke(255);//color(255,0,0));
      strokeWeight(1);
      line(i, height, i, height-ground[i]);
  }

}