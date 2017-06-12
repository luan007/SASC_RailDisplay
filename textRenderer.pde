class textRenderer extends render_dot {
  
  String text = "";
  float tlen = -1;
  int lines = 1;
  
  textRenderer(float x, float y, float layer, String text) {
    super(x, y, layer);
    this.text = text;
    lines = text.split("\n").length;
  }
  
  void draw() {
    if(sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.noStroke();
    p.rectMode(CENTER);
    p.textAlign(CENTER, CENTER);
    p.textFont(pf_number, 30);
    if(tlen <= 0) {
      tlen = p.textWidth(this.text);
    }
    p.fill(150, (sc) * 255);
    p.rect((xoffset - w / 2) / w * 50, sc * 20, this.tlen + 80, 60 * lines);
    p.fill(0);
    p.rect(0, 0, this.tlen + 80, 60 * lines);
    p.fill(255);
    p.text(text, 0, -4);
    
    p.popMatrix();
  }
}


class markerRenderer extends render_dot {
  
  String text;
  float w;
  float h;
  markerRenderer(float x, float y, float w, float h, float layer, String text) {
    super(x, y, layer);
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  void draw() {
    if(sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.noStroke();
    p.rectMode(CENTER);
    p.textAlign(CENTER, CENTER);
    p.textFont(pf_number, 20);
    p.fill(150, (sc) * 255);
    p.rect((xoffset - w / 2) / w * 50, sc * 20, this.tlen + 80, 60 * lines);
    p.fill(0);
    p.fill(255);
    p.text(text, 0, -4);
    
    p.popMatrix();
  }
}