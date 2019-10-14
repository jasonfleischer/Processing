

float a = 2;
float t = 0;
boolean flip = false; 
boolean stop = false;
int MAX_D;
void setup() {
  size(displayWidth, displayHeight);
  frameRate(25);
  background(0); 
  noStroke();
  MAX_D = int(dist(0,0,width/2,height/2));
}

void draw() {  
  background(0);
  float percentMouse = (dist(width/2,height/2, mouseX, mouseY)/MAX_D);
  //r = int(percentMouse*100);
  //growthRate= int(percentMouse*30)+25;
  translate(width/2, height/2);
  
  if(flip){
       t=t-0.7;
     }else{
       t= t+0.7;
     }
   if(!stop){
     
     t=t*percentMouse*1.1;
   }
   if(t >150 || t<0){
     flip = !flip;
   }
  
   //fill(cirColor);
     fillRainbow(0,2,4, 230, 25);

   for(int i=0;i<50;i++){
     color cirColor = color(int(255*noise(5+t)), int(255*noise(20+t)), int(255*noise(25+t)));
     float temtT=t+i;
     float x = x(temtT);
     float y = y(temtT);
     float size = dist(0,0,x,y)/6;
     
     ellipse(x, y, size, size);
   }

   
   
}


float x(float t){
  return a*t*cos(t);
}
float y(float t){
  return a*t*sin(t);
}

void mouseClicked(){
  stop = !stop;
}


//rainbow
float frequency = 0.3;
float red, blue, green;
float i=0;


void fillRainbow(float phase1, float phase2, float phase3, float center, float wdth){
   i=i-0.1;
   red   = sin(frequency*i + phase1) * wdth + center;
   green = sin(frequency*i + phase2) * wdth + center;
   blue  = sin(frequency*i + phase3) * wdth + center;
   fill(red, green, blue);
}