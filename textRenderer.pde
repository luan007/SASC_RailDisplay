class textRenderer extends render_dot {
  
  String text = "";
  
  
  textRenderer(float x, float y, float layer, String text) {
    super(x, y, layer);
    this.text = text;
  }
  
  void draw() {
    if(sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.scale(sc);
    p.fill(0);
    p.noStroke();
    p.ellipse(0, 0, 30, 30);
    p.text(this.x + "<",  0, -30);
    p.popMatrix();
  }
  
}