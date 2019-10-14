class Snow {
  float xpos; 
  float ypos;
  float size;
  int snowColor;
  boolean shown = false;

  Snow() {
  }

  void init(float x, float y, float sz, int clr) {
    shown = true;
    xpos = x;
    ypos = y;
    if (sz<3)
      sz=5;
    size = sz;
    snowColor = clr;
  }

  void display() {
    if (shown) {
      noStroke();
      fill(255);
      ellipse(xpos, ypos, size, size);
    }
  }
}