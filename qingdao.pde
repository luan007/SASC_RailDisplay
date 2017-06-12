

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
    //new qingdao_marker(x + 300, 1200, 1, 200);
    for(int i = 0; i < 100; i++) {
      new qingdao_tinymarker(x + random(-600, 600), 1200 + random(-700, 600), random(1, 5));
    }
    
    new qingdao_marker(x, 1500, 2, "4251家\n“大笑”饭店");
    new qingdao_marker(x + 300, 1200, 1.3, "1005家\n小饭桌");
  }

  void draw() {
    if (sc < 0) 
    { 
      return;
    }
    p.pushMatrix();
    p.stroke(255, 0, 0);
    p.noFill();
    p.tint(255, this.sc * 255);
    p.translate(0, -absSc * 30);
    p.image(qingdao.bg, -30, -30, w + 60, h + 60);

    p.tint(255, (this.sc) * 255);
    p.image(qingdao.title, 250, -400 + 300 + sqrt(1.5 - this.absSc) * 300);

    p.tint(255, 255);

    p.rectMode(CENTER);
    p.noStroke();
    p.fill(255, sc * 255);
    p.pushMatrix();
    p.translate(542, -400 + 500 + sqrt(1.5 - this.absSc) * 300);
    p.rect(0, 0, 775, 109);
    p.textFont(pf_regular);
    p.fill(0, this.sc * this.sc * 200);
    p.textAlign(LEFT, CENTER);
    p.text("搜索地点、饭店", -370 + this.sc * 60, -5);
    p.popMatrix();
    p.rectMode(CORNERS);

    p.popMatrix();
  }
}

class qingdao_tinymarker extends render_dot {
  qingdao_tinymarker(float x, float y, float l) {
    super(x, y, l);
  }
  void draw() {
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.rectMode(CENTER);
    p.pushMatrix();
    p.rotate(PI / 4);
    p.stroke(255);
    p.noFill();
    p.rect(0 ,0, 7, 7);
    p.scale(sc * (1 + sin(x / 100 + t * 5)) * 2);
    p.noStroke();
    p.fill(255);
    p.rect(0 ,0, 7, 7);
    p.popMatrix();
    p.textFont(pf_number, 15);
    p.fill(255, (sin(x / 100 + t * 5)) * 255);
    p.text("A级", 30, 0);
    p.popMatrix();
  }
}

class qingdao_marker extends render_dot {

  String text;

  qingdao_marker(float x, float y, float layer, String text) {
    super(x, y, layer);
    this.text = text;
  }

  void draw() {
    //float sq = sqrt(1 - abs(xoffset - w / 2 + target) / ( w / 2 ));
    if (sc <= 0) return;
    float st = sc * sc;
    p.pushMatrix();
    p.translate(xoffset, y);
    
    float s = 0.5 + sq(sin((t + this.x / 1000) % (PI / 2)));
    p.stroke(255);
    p.strokeWeight((1.5 - s) * 20);
    p.noFill();
    p.ellipse(0, 0, 350 * s, 350 * s);
    
    
    //p.scale(sq);
    p.noStroke();
    //p.strokeWeight(abs(150 * sq * sq * sin(t)));
    p.fill(255);
    float s2 = 0.9 + 0.1 * sq(sin((t + this.x / 1000)));
    p.ellipse(0, 0, 350 * s2, 350 * s2);

    p.fill(0, 180, 255);
    //p.textFont(pf_number);
    p.textAlign(CENTER, CENTER);
    p.textFont(pf_number);
    p.text(text, 0, 0);
    p.popMatrix();
  }
}