class Circle {
  float x, y, r;
  int c=(int)random(cols.length);
  boolean growing=true;

  Circle(float x_, float y_) {
    x=x_;
    y=y_;
    r=1;
  }

  void grow() {
    if (growing) {
      r+=0.05;
    }
    
  }
  void show() {
    //noFill();
    fill(cols[c]);
    noStroke();
    ellipse(x, y, 2*r, 2*r);
  }
}
