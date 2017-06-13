ArrayList<IRenderable> sprites = new ArrayList<IRenderable>();

interface IRenderable {
  void init();
  void render();
}

class render_dot implements IRenderable {
  
  float x = 0; 
  float y = 0;
  float layer = 1; 
  
  
  float sc = 0;
  float ssc = 0;
  float psc = 0;
  float absSc = 0;
  float xoffset = 0;
  
  
  render_dot(float x, float y, float layer) {
    this.x = x;
    this.y = y;
    this.layer = layer;
    sprites.add(this);
  }
  
  void init() {
    
  }
  
  void calculatePosition() {
    xoffset = -position * totalPixels / layer + x * pWidth / layer + w / 2;
    absSc = xoffset / w;
    psc = scaler(xoffset, 0);
    sc = scaler(xoffset, 0.3);
    ssc = sq(sc);
  }
  
  void render() {
    //calculate relative position
    this.calculatePosition();
    this.draw();
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

void initSprites() {
  for(IRenderable i : sprites) {
    i.init();
  }
}
void renderSprites() {
  for(IRenderable i : sprites) {
    i.render();
  }
}