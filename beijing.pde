class beijing extends render_dot {

  beijing(float x, float y, float layer) {
    super(x, y, layer);
    new qingdao_marker(x - 250, 300, 1, "15条\n餐饮安全\n示范街");
    new qingdao_marker(x + 92, 363, 1, "403家\n明厨亮灶\n商户");
    new qingdao_marker(x - 100, 1500, 1, "30家\n诚信经营\n单位");
    new qingdao_marker(x - 215, 1300, 1, "30家\n优质\n旅游供应商");
    
    new tinyTextParagraph(x + 20, 600, 820, 250, 1.2,
    "2016年，西城区在全区15条街开展了“餐饮安全示范街”创建活动。\n" + 
    "西城区发挥“老字号”和行业引领者的示范带头作用，将西单、西直门、金融街地区\n" +
    "示范街的餐饮单位作为重点，\n" + 
    "打造首批“餐饮安全示范店”，通过商圈带动整个区域，形成餐饮食品安全示范区。\n" + 
    "食品安全水平和服务质量大幅改观的同时，营业额同比提高了四成，实现了百姓饮食安全和产业发展双赢。\n" + 
    "在创建过程中，政府、监管部门、企业、群众共同发力，共治共建，取得了良好的成效。\n" + 
    "截至2016年12月底，十五条示范街403家商户已全部实现明厨亮灶，\n" + 
    "示范街内30家商户被评为诚信经营单位，超过30家商户被评为优质旅游供应商。", true, "*");
    
    new textRenderer(x + 20, 1700, 1, "北京市西城区打造“西单餐饮食品安全示范区”");
  }

  void draw() {
    if (sc < 0) return;
    p.pushMatrix();
    p.rectMode(0);
    //p.fill(255, 60, 80, sc * 255);
    //p.rect(0, 0, p.width, p.height);

//    p.fill(255, 150);
//    int s = 120;
//    p.noStroke();
//    p.rectMode(CENTER);
//    p.translate(xoffset % s, 0);
//    for (float x = -s; x < w + s; x+=s) {
//      for (float y = -s; y < h + s; y+=s) {
//        p.fill(255, sc * 255);
//        p.pushMatrix();
//        p.translate(x, y);
//        //p.rotate(PI / 4);
//        p.scale(sin(x / 1000 + t));
//        p.rect(0, 0, 3, 15);
//        p.rect(0, 0, 15, 3);
//        p.popMatrix();
//      }
//    }
    p.popMatrix();
    //p.text("明厨亮灶 3.0", this.xoffset, 0);
  }
}