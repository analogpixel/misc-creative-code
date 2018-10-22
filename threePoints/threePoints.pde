// https://www.siggraph.org/education/materials/HyperGraph/modeling/mod_tran/2drota.htm
// http://stackoverflow.com/questions/2259476/rotating-a-point-about-another-point-2d

PVector p1, p2, p3;
float rot=0;
float z=10;


void setup() {
  size(400, 400);
  
  Motion.setup(this);
  
  p1 = new PVector(0, 43);
  p2 = new PVector(-50, -43);
  p3 = new PVector(50, -43);
  
  Tween t = new Tween(this, "z", 200, 60).repeat().reverse().play();
  Tween t2 = new Tween(60).add(this, "rot", 360).repeat().play();
  background(255);
}


void draw() {
   if (frameCount == 240) { exit(); }
   fill(255,40);
  rect(0,0, width, height);
 
 fill(0);
  p1 = rpoint(new PVector(0, 43) , rot);
  p2 = rpoint(new PVector(-50, -43), rot);
  p3 = rpoint(new PVector(50, -43) , rot);

 
  
  translate(width/2, height/2);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p2.x, p2.y, p3.x, p3.y);
  line(p3.x, p3.y, p1.x, p1.y);
  
  
  ellipse(p1.x, p1.y, z, z);
  ellipse(p2.x, p2.y, z, z);
  ellipse(p3.x, p3.y, z, z);
  if (frameCount >=120) {
    saveFrame("out/image###.png");
  }
}

// Rotate point around origin (0,0)
PVector rpoint(PVector p, float r) {
  float rr = radians(r);
  float s  = sin(rr);
  float c = cos(rr);

  PVector ret = new PVector(0, 0);
  ret.x = p.x * c - p.y * s;
  ret.y = p.x * s + p.y* c;

  return ret;
}

void keyPressed() {
  
}

