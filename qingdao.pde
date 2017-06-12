

static class qingdao {
  static PImage bg;
  static PImage title;
  static void init() {
    bg = inf.loadImage("qd_bg.jpg");  
    title = inf.loadImage("qd_logo.png");
  }
}

class qingdao_map extends render_dot {
  qingdao_map(float x, float y, float layer) {
    super(x, y, layer);
  }

  void draw() {
    if(sc < 0) return;
    p.pushMatrix();
    p.stroke(255, 0, 0);
    p.noFill();
    p.tint(255, this.sc * 255);
    p.translate(0, -absSc * 30);
    p.image(qingdao.bg, 0, 0, w, h);
    
    p.tint(255, (this.sc) * 255);
    p.image(qingdao.title, 250, 300 + sqrt(1 - this.absSc) * 300);
    
    p.tint(255, 255);
    
    p.rectMode(CENTER);
    p.noStroke();
    p.fill(255);
    p.pushMatrix();
    p.translate(542, 833);
    p.rect(0, 0, 775, this.sc * 109);
    p.textFont(pf_regular);
    p.fill(0, this.sc * this.sc * 200);
    p.text("搜索地点、饭店", -370 + this.sc * 30, 18);
    p.popMatrix();
    p.rectMode(CORNERS);
    
    p.popMatrix();
  }
}

class qingdao_dot extends render_dot {

  float expander = 0;

  qingdao_dot(float x, float y, float layer) {
    super(x, y, layer);
  }

  void draw() {
    expander += 0.01;
    expander = expander % 1;
    if (sc < 0) return;
    float st = sc * sc;
    p.pushMatrix();
    p.translate(xoffset, y);
    //p.scale(scaler(xoffset));
    p.stroke(255, 0, 0);
    p.scale(expander);
    p.strokeWeight(90 - expander * 90);
    p.noFill();
    p.ellipse(0, 0, 150, 150);
    p.text(this.x + "<", 0, -30);
    p.popMatrix();
  }
}