PFont pf_thin;
PFont pf_regular;

final float scaler = 0.3;
PGraphics p;
static PApplet inf;
float position = 0; // from 0 - 1
float l1 = 1;

float l4 = 50;

int w = 1080;
int h = 1920;
float t = 0;
PImage debug_img ;
float totalLength = 6000;
float screenWidth = 500;
float pWidth = float(w) / screenWidth;
float totalPixels = floor(pWidth * totalLength);
float posEase = 0;

void settings() {
  size(int(1080 * scaler), int(1920 * scaler), OPENGL);
  println(totalPixels);
}

void setup() {
  inf = this;
  qingdao.init();
  p = createGraphics(1080, 1920, OPENGL);
  pf_regular = createFont("PingFangSC-Regular", 48, true);
  pixelDensity(2);
  frameRate(60);
  smooth(8);
  debug_img = loadImage("debug.JPG");
  new render_dot(0, h / 3, 1);
  new render_dot(1000, h / 3, 1);
  new qingdao_map(5000, h / 3, 3);
  new render_dot(3000, h / 3, 1);
  new render_dot(4000, h / 3, 1);
  new render_dot(5000, h / 3, 1);
  new render_dot(6000, h / 3, 1);
 
  new render_dot(0, h / 5, 3);
  new render_dot(1000, h / 5, 3);
  new render_dot(2000, h / 5, 3);
  new render_dot(3000, h / 5, 3);
  new render_dot(4000, h / 5, 3);
  new render_dot(5000, h / 5, 3);
  new render_dot(6000, h / 5, 3);
 
  initSprites();
  
}

void draw() {
  position = ease(position, (mouseX / scaler) / w * 1, 0.03);
  posEase = position * totalPixels;
  t = float(millis()) / 1000;
  renderP();
  background(0);
  scale(scaler);
  image(debug_img, 0, 0);
  blendMode(MULTIPLY);
  image(p, 0, 0);
  blendMode(NORMAL);
}

void renderP() {
  p.beginDraw();
  p.fill(255, 200);
  p.noStroke();
  p.rect(0, 0, w, h);
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

  renderSprites();
  drawScroller();
  p.endDraw();
}