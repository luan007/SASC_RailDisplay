final float scaler = .4;
PGraphics p;
void settings() {
  size(int(1080 * scaler), int(1920 * scaler), OPENGL);
}

void setup() {
  p = createGraphics(1080, 1920, OPENGL);
}

void draw() {
  background(0);
  scale(scaler);
  image(p, 0, 0);
}