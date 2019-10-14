class SnowFlake {
  float xpos; 
  float ypos;
  float size;
  float rateY;
  float rateX;
  int snowColor;
  float numberOfFramesDelayed;

  float MAX_RATE_X = 0.4;

  SnowFlake() {
    numberOfFramesDelayed = random(0, height);
    reset();
  }

  void reset() {
    xpos = random(0, width);
    ypos = 0;
    size = random(1, 4.5);
    rateY = random(0.5, 3);
    rateX = random(-1*MAX_RATE_X, MAX_RATE_X);
    snowColor = int(random(155, 255));
  }

  void move () {

    numberOfFramesDelayed = numberOfFramesDelayed - 1;
    if (numberOfFramesDelayed < 0) {

      if ( xpos < 0-size ) { // sides
        xpos = width;
      }else if(xpos>width+size){
        xpos = 0;
      }else if ( hasColided() ) {
        if (snowIndex < numberOfFlakes) {
          snow[snowIndex].init(xpos, ypos, size, snowColor);
          snowIndex = snowIndex + 1;
        } else {
          snowIndex = 0;
        }
        
        reset();
      } else {
        //println(((mouseX/500.0)));
        xpos = xpos + rateX ;//+  ((mouseX/500.0) *15.0);
        ypos = ypos + rateY;
      }
    }
    float xchange = random(0, 0.5);
    boolean goLeft = random(1) > .5;
    if (goLeft) { 
      xchange = xchange *-1;
    }
    float tempxpos = xpos + xchange;

    if (tempxpos < MAX_RATE_X || tempxpos > MAX_RATE_X*-1) {
      xpos = tempxpos;
    }
  }


  int snowInc = 1;
  boolean hasColided() {
    //println(xpos);
    int x = int(xpos);
    if (x<0) {
      x =0;
    } else if (x>=width) {
      x =width-1;
    }

    int groundIndex = x;
    int heightY = + height - ground[groundIndex] ;
    //println ( ypos + "< "+heightY);
    if (ypos > heightY) {

      if (groundIndex == 0) {
        int rightOfH = ground[groundIndex+1];
        if (ground[groundIndex]-rightOfH>2) {
          ground[groundIndex+1] = rightOfH + snowInc;
        } else {
          ground[groundIndex] = ground[groundIndex] + snowInc;
        }
      } else if (groundIndex == width -1) {
        int leftOfH = ground[groundIndex-1];
        if (ground[groundIndex]-leftOfH>2) {
          ground[groundIndex-1] = leftOfH + snowInc;
        } else {
          ground[groundIndex] = ground[groundIndex] + snowInc;
        }
      } else {

        int rightOfH = ground[groundIndex+1];
        int leftOfH = ground[groundIndex-1];
        if (ground[groundIndex]-rightOfH>2) {
          ground[groundIndex+1] = rightOfH + snowInc;
        } else if (ground[groundIndex]-leftOfH>2) {
          ground[groundIndex-1] = leftOfH + snowInc;
        } else {
          ground[groundIndex] = ground[groundIndex] + snowInc;
        }
      }

      return true;
    } else {
      return false;
    }
  }
  void display() {
    move();
    if (numberOfFramesDelayed < 0) {
      noStroke();
      fill(snowColor);
      ellipse(xpos, ypos, size, size);
    }
  }
}