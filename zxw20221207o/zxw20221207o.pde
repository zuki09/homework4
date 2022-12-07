ArrayList<Circle>circles;
PImage img;
ArrayList<PVector>spots;
int[]cols={#000000, #FF9E0A};

int number=0;
void setup() {

  size(910, 620);
  circles=new ArrayList<Circle>();
  spots=new ArrayList<PVector>();
  img=loadImage("img.png");


  for (int x=0; x<img.width; x++)
  {
    for (int y=0; y<img.height; y++)
    {
      int index=x+y*img.width;  
      color c=img.pixels[index];
      float b=brightness(c);
      if (b>1)
      {
        spots.add(new PVector(x, y));
      }
    }
  }
 
}
void draw()
{
  for (int i=0; i<10; i++)
  {
    newCircle();
  }

  background(255);
  for (Circle c : circles) {
    if (c.growing) 
    {
      for (Circle other : circles)
      {
        if (c!=other)
        {
          float d=dist(c.x, c.y, other.x, other.y);
          if (d-2 < c.r + other.r)
          {
            c.growing=false;
            other.growing=false;
            break;
          }
        }
      }
    }
    c.grow();
    c.show();
  }

}
void newCircle() {
  PVector spot=spots.get((int)random(spots.size()));
  float x=spot.x;
  float y=spot.y;
  boolean valid=true;
  for (Circle c : circles)
  {
    float d=dist(x, y, c.x, c.y);
    if (d-2<c.r) {
      valid=false;
      break;
    }
  }
  if (valid) {
    circles.add(new Circle(x, y));
  }
}

void mousePressed() {
  saveFrame(millis()+"png");
}
