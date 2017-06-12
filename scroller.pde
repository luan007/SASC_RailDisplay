

void drawScroller() {
  p.pushMatrix();
  int stepper = 15;
  float offset = posEase / 10;
  float step = offset % stepper;
  p.translate((w / 2), h / 1.2);
  p.rectMode(CENTER);
  for (float x = -w / 2 + step; x < w / 2 + step; x += stepper) {
    float sx = 1 + sin((float)millis() / 500 + (x + offset) / 50);
    float cx = 1 + cos((float)millis() / 500 + (x + offset) / 50);
    p.fill(0, 150, 255, cx * 150);
    p.noStroke();
    p.pushMatrix();
    p.translate(x * 2, 18 * sx);
    p.rotate(PI / 4);
    p.rect(0, 0, 5, 5);
    //p.line(0, 0, 0, 15 * (1 + sin((float)millis() / 200 + (x + offset) / 50)));
    //p.point(0, 18 * sx);
    p.popMatrix();
    
    p.strokeWeight(2);
    p.stroke(0, sx * 150);
    p.pushMatrix();
    p.translate(x * 4, 0);
    //p.line(0, 0, 0, 0);
    p.point(0, -8 * sx);
    p.popMatrix();
  }
  p.rectMode(CORNER);

  p.popMatrix();
}