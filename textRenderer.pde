class textParagraph extends textRenderer {
  float w;
  float h;
  boolean invert;
  textParagraph(float x, float y, float w, float h, float layer, String text, boolean invert) {
    super(x, y, layer, text);
    this.w = w;
    this.invert = invert;
    this.h = h;
  }

  void draw() {
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.noStroke();
    p.fill(invert? 255 : 0, sc * 255);
    p.rectMode(0);
    p.rect(-30, -30, 30 + w, 30 + h);
    if (!invert) {
      p.fill(sin(t) * 50 + 180, 255, 255, sc * 255);
    } else {
      p.fill(0, 0, 50 + cos(t) * 200, sc * 255);
    }
    p.rect(-20, -20, 10 + w, 10 + h);
    p.fill(invert? 255 : 0, sc * 255);
    p.textAlign(LEFT, TOP);
    p.textFont(pf_number, 25);
    p.text(this.text, 0, 0);
    p.popMatrix();
  }
}

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
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.noStroke();
    p.rectMode(CENTER);
    p.textAlign(CENTER, CENTER);
    p.textFont(pf_number, 30);
    if (tlen <= 0) {
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
  String text2;
  float w;
  float h;
  markerRenderer(float x, float y, float w, float h, float layer, String text) {
    super(x, y, layer);
    this.w = w;
    this.h = h;
    this.text = text;
  }

  markerRenderer(float x, float y, float w, float h, float layer, String text, String text2) {
    super(x, y, layer);
    this.w = w;
    this.h = h;
    this.text = text;
    this.text2 = text2;
  }

  void draw() {
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    //p.scale(sc);

    p.noStroke();
    p.rectMode(CENTER);


    float swing = 1 + sin(t * 2 + this.y / 1000);
    float swingsz = 1 + cos(t * 2 + this.y / 1000);


    p.fill(0);
    p.rect(0, 0, w, h);
    p.fill(255);
    p.rect(0, 0, w - 10, h - 10);



    p.rect(0, 0, w - 50 * swing, h + 10);
    p.rect(0, 0, w + 10, h - 50 * swing);

    p.fill(0, 180, 255);
    p.rect(0, 0, w * swingsz * 0.4, h * swingsz * 0.4);

    p.translate(w / 2, -h / 2);
    p.textAlign(LEFT, CENTER);
    p.textFont(pf_number, 30);
    p.fill(0);
    p.text(text, 60, -40 - 5);

    if (text2 != null) {
      p.textFont(pf_number, 22);
      p.text(text2, 60, 35 - 5);
    }

    p.noFill();
    p.stroke(0);
    p.strokeWeight(3);
    p.beginShape();
    p.vertex(0, 0);
    p.vertex(40, -40);
    p.vertex(50, -40);
    p.endShape();
    p.popMatrix();
  }
}


class circular_marker extends render_dot {

  String text;

  float textSize;
  float textMeasure = -1;

  circular_marker(float x, float y, float layer, String text, float textSize) {
    super(x, y, layer);
    this.textSize = textSize;
    this.text = text;
  }

  void draw() {
    //float sq = sqrt(1 - abs(xoffset - w / 2 + target) / ( w / 2 ));
    if (sc <= 0) return;
    float st = sc * sc;
    p.pushMatrix();
    p.translate(xoffset, y);

    float s = 0.5 + sq(sin((t + this.y / 1000) % (PI / 2)));
    p.stroke(0, 180, 255);
    p.strokeWeight((1.5 - s) * 20);
    p.noFill();
    p.ellipse(0, 0, (this.textMeasure + 60) * s, (this.textMeasure + 60) * s);


    p.scale(sc);
    p.noStroke();
    //p.strokeWeight(abs(150 * sq * sq * sin(t)));
    p.fill(0, 180, 255);
    float s2 = 0.9 + 0.1 * sq(sin((t + this.y / 1000)));
    p.ellipse(0, 0, (this.textMeasure + 60) * s2, (this.textMeasure + 60) * s2);

    p.fill(255);
    p.textFont(pf_number, textSize);
    p.textAlign(CENTER, CENTER);
    if (textMeasure == -1) {
      textMeasure = p.textWidth(this.text);
    }
    p.text(text, 0, 0);
    p.popMatrix();
  }
}


class tinymarker extends render_dot {
  String text;
  tinymarker(float x, float y, float l, String text) {
    super(x, y, l);
    this.text = text;
  }
  void draw() {
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);
    p.rectMode(CENTER);
    p.pushMatrix();
    p.rotate(PI / 4);
    p.stroke(255);
    p.strokeWeight(2);
    p.noFill();
    p.rect(0, 0, 7, 7);
    p.scale(0.2 + sc * (1 + sin(x / 100 + t * 5)) * 2);
    p.noStroke();
    p.fill(255);
    p.rect(0, 0, 7, 7);
    p.popMatrix();
    p.textFont(pf_number, 18);
    p.textAlign(LEFT, CENTER);
    p.fill(255, (sin(x / 100 + t * 5)) * 127 + 127);
    p.text(this.text, 30, 0);
    p.popMatrix();
  }
}




class highLightRenderer extends markerRenderer {

  tinymarker[] markers;

  highLightRenderer(float x, float y, float w, float h, float layer, String text, String text2) {
    this(x, y, w, h, layer, text, text2, null);
  }



  highLightRenderer(float x, float y, float w, float h, float layer, String text, String text2, String[] floating) {
    super(x, y, w, h, layer, text, text2);
    if (floating != null) {
      this.markers = new tinymarker[floating.length];
      for (int i = 0; i < floating.length; i++) {
        float deg = random(0, PI * 2);
        float r = random(0.5, 0.8) * dist(w, h, 0, 0);
        float xx = cos(deg) * r;
        float yy = sin(deg) * r;
        markers[i] = new tinymarker(x + xx, y + yy, random(1, 2), floating[i]);
      }
    }
  }

  void draw() {
    if (sc <= 0) return;
    p.pushMatrix();
    p.translate(xoffset, y);

    if (markers != null) {
      for (int i = 0; i < markers.length; i++) {
        markers[i].calculatePosition();
        float x = markers[i].xoffset - this.xoffset;
        float y = markers[i].y - this.y;
        p.stroke(255, sc * 255);
        p.strokeWeight(2);
        p.line(x, y, 0, 0);
      }
    }

    p.noStroke();
    p.rectMode(CENTER);

    float swing = 1 + sin(t * 2 + this.y / 1000);
    float swingsz = 1 + cos(t * 2 + this.y / 1000);

    p.pushMatrix();


    p.scale(sc);
    p.rotate(PI / 4);
    p.fill(30);
    p.rect(0, 0, w, h);
    p.scale(0.9);
    p.fill(255);
    p.rect(0, 0, w, h);

    p.fill(0);
    p.textAlign(CENTER, CENTER);
    p.rotate(-PI / 4);
    if (text2 != null) {
      p.textFont(pf_number, 90);
      p.text(text2, 0, -15);
    }

    p.popMatrix();



    p.translate(w / 2, -h / 2 + 15 + (swing - 1) * 15);
    p.textAlign(LEFT, CENTER);
    p.textFont(pf_number, 50);
    p.fill(255, (swing * 0.5 + 0.5) * 255 * sc);
    p.text(text, 40, -30 - 5);

    p.popMatrix();
  }
}