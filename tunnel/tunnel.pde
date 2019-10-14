import java.util.Map;

float t = 0;
int r = 50;
int growthRate = 30;
int numberOfCircles = 75;
int circleIndex = 0;
int MAX_D;
int[] sizes;
Circle[] circles;
HashMap<Integer,Circle> hm;
boolean stopped  = false;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(25);
  background(0); 
  noStroke();
  MAX_D = int(dist(0,0,width/2,height/2));
  circles = new Circle[numberOfCircles];
  for (int i = 0; i < numberOfCircles; i = i+1) {
    circles[i] = new Circle();
  }
}

void draw() {  
  float percentMouse = (dist(width/2,height/2, mouseX, mouseY)/MAX_D);
  r = int(percentMouse*100);
  growthRate= int(percentMouse*30)+25;
  translate(width/2, height/2);
  t= t+0.2;
  
  circleIndex = (circleIndex + 1) % numberOfCircles; 
  circles[circleIndex].init(t, growthRate);

  hm = new HashMap<Integer,Circle>();
  sizes = new int[numberOfCircles];
  for (int i =0; i < numberOfCircles; i = i+1) {
    Circle c = circles[i];
    c.move();
    sizes[i] = c.size;
    hm.put(sizes[i], c);
  }
  
  sizes = reverse(sort(sizes));
  for(int s: sizes){ //draw largest circle first
    hm.get(s).display();
  }
}
void mouseClicked(){
  stopped = !stopped;
}