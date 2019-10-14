class Circle {

  int size;
  private int cirColor;
  private float xpos;
  private float ypos;
  private int growthRate;
  private boolean shown;

  Circle() {
    xpos = 0;
    ypos = 0;
    shown = false;
    size = 0;    
    growthRate = 30; //30min 130max; //band sizes
  }

  void init(float t, int gr) {
    shown = true;
    size = 0;
    xpos = cos(t)*r;
    ypos = sin(t)*r;
    if (stopped)
      cirColor = 0;
    else
      cirColor = color(int(255*noise(5+t)), int(255*noise(20+t)), int(255*noise(25+t)));
    growthRate = gr;
  }

  void move() {
    size = size + growthRate;
  }

  void display() {
    if (shown) {
      fill(cirColor);
      ellipse(xpos, ypos, size, size);
    }
  }
}