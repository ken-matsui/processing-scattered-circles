float sec;

int particleNum = 100;
float[] r, g, b;
PVector[] pos, vel;
float gravity = 0.03;

float x = 0.1, y = 0.1;

void setup() {
  size(1024, 768);
  blendMode(ADD);
  background(0);

  stroke(124, 155, 255, 50);

  r = new float[particleNum];
  g = new float[particleNum];
  b = new float[particleNum];
  pos = new PVector[particleNum];
  vel = new PVector[particleNum];
  for (int i = 0; i < particleNum; i++) {
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
    pos[i] = new PVector(width/2, height/2);
    vel[i] = new PVector(random(-5, 5), random(-5, 5));
  }

  sec = 5;
}

void draw() {
  background(0);

  for (int i = 0; i < particleNum; i++) {
    if (pos[i].x < 0 || pos[i].x > width) {
      vel[i].x = -vel[i].x;
    }
    if (pos[i].y < 0) {
      vel[i].y = -vel[i].y;
    }
    if (mouseX-100 < pos[i].x && pos[i].x < mouseX+100) {
      if (pos[i].y > 648-20 && pos[i].y < 648+20) {
        vel[i].y = -vel[i].y;
      }
    }
    pos[i].add(vel[i]);
    vel[i].y += gravity;
    //vel[i].add(acc[i]);
    //vel[i].mult(0.999);
  }
  for (int i = 0; i < particleNum; i++) {
    fill(r[i], g[i], b[i]);
    ellipse(pos[i].x, pos[i].y, 10, 10);
  }
  
  rect(mouseX-100, 648-10, 200, 20);
}