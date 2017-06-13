PFont pf_thin;
PFont pf_regular;
PFont pf_number;
PFont pf_number_l;
static PApplet inf;

final float scaler = 0.4;
PGraphics p;
float position = 0; // from 0 - 1
float l1 = 1;
float l4 = 50;

int w = 1080;
int h = 1920;
float t = 0;
PImage debug_img;
PImage follower;
float screenWidth = 680;
float totalLength = 5760 - screenWidth;
float pWidth = float(w) / screenWidth;
float totalPixels = floor(pWidth * totalLength);
float posEase = 0;

void settings() {
  size(int(1080 * scaler), int(1920 * scaler), P3D);
  println(totalPixels);
}

void setup() {
  inf = this;
  qingdao.init();
  p = createGraphics(1080, 1920, P3D);
  pf_regular = createFont("PingFangSC-Regular", 48, true);
  pf_number = createFont("DIN-Black", 48, true);
  pf_number_l = createFont("DIN-Black", 120, true);
  pixelDensity(2);
  frameRate(60);
  smooth(8);
  debug_img = loadImage("debug.JPG");
  follower = loadImage("kitchen_wall.jpg");
  new qingdao_map(4800, h / 3, 2.5);
  new huaian(3100, 0, 2.4);
  new dalian(1200, 0, 1.9);
  new beijing(0, 0, 1);
  initSprites();
  p.hint(DISABLE_OPTIMIZED_STROKE);
}

void draw() {
  position = ease(position, 1 - (mouseX / scaler) / w * 1, 0.03);
  posEase = position * totalPixels;
  t = float(millis()) / 1000;
  renderP();
  background(255);
  scale(scaler);
  pushMatrix();
  
  translate(-posEase, 0);
  //image(follower, -120 * pWidth, 0, 1920 * 6000 / 1210, 1920);
  //println(8192 * 1.2315586915);
  
  popMatrix();
  image(debug_img, 0, 0, w, h);
  blendMode(MULTIPLY);
  image(p, 0, 0);
  blendMode(NORMAL);
}

void renderP() {
  p.beginDraw();
  p.fill(255, 200);
  p.strokeCap(PROJECT);
  p.strokeJoin(PROJECT);
  p.noStroke();
  p.rect(0, 0, w, h);

  renderSprites();
  drawScroller();
  
  p.pushMatrix(); 
  {
    p.translate(0, h / 1.2);
    p.noFill();
    for(int i = 0; i < 2; i++) {
      p.strokeWeight(3);
      p.stroke(0, i * 10 + 10);
      p.translate(0, i * 2);
      p.beginShape();
      for (int x = 0; x < w; x += 3) {
        float y = (sin(float(x + i * 30) / float(w) * PI
                      - t / 2 + position * l4) * cos(position * l4 + t + i)
                  * (80 + i * 3));
        p.vertex(x, y);
        //p.stroke(255, y);
      }
      p.endShape();
    }
  }
  p.popMatrix();
  p.endDraw();
}