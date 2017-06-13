class dalian extends render_dot {

  dalian(float x, float y, float layer) {
    super(x, y, layer);
    new qingdao_marker(x + 400, 300, 1.2, "24家\n餐饮管理公司");
    new qingdao_marker(x + 700, 300, 1.2, "80家\n覆盖学校食堂");
    new qingdao_marker(x + 100, 300, 1.2, "100%\n学校食堂\n明厨亮灶率");
    new textRenderer(x + 500, 1700, 3, "大连中央厨房进校园”");
    new textParagraph(x - 300, 600, 850, 260, 1.2,
    "大连市自2014年开始在金普新区开展“中央厨房进校园”试点工作。\n联合教育行政部门，确定了\n“政府投资主办、学校承担食品安全第一责任、\n餐饮管理公司具体运营管理并对所供食品安全负责”的校餐供应模式。\n餐饮管理公司对所管理的学校食堂实行中央厨房统一采购、统一初加工，\n并将半成品配送至各学校食堂现场烹饪供餐。"
    , false);
    
    new tinyTextParagraph(x - 300, 170, 620, 110, 1.3,
    "严格督促落实《餐饮服务食品安全操作规范》关于\n人员健康、进货查验、食品贮存、加工制作、半成品配送等关键环节的要求，\n鼓励采用和实施先进管理方法和标准加强食品安全管理；"
    , true, "1");
    
    new tinyTextParagraph(x - 400, 330, 450, 220, 1,
    "鼓励中央厨房对大宗食品原料实行定点采购，\n利用辽宁省餐饮食品安全信息化监管系统企业端，\n实行大宗商品台账追溯信息电子化管理并上传有关数据。\n推广“生产基地+中央厨房+学校食堂”的经营模式，\n引导中央厨房同优质种养殖基地签约采购，\n建立安全稳定可追溯的原料供应模式，\n建立了省内首家产供销一体化校餐直供平台。", true, "2");
    
    new tinyTextParagraph(x - 450, 915, 500, 220, 1.12,
    "成立了由有关餐饮管理公司和学校食堂组成的校餐协会，\n每月召开例会，分析解决存在的问题；\n加强对校餐从业人员的食品安全培训，\n协会每年举办2次管理人员培训会议，\n并督促有关单位制定培训计划、建立培训档案；\n根据学生年龄特点及营养需求统一制定全区校餐食谱，\n每周在校餐平台及《大连日报》上进行公布。"
    , true, "3");
    
    new tinyTextParagraph(x - 500, 1170, 800, 135, 1.2,
    "通过“中央厨房进校园”校餐管理新模式，\n有效解决了以往“学校办食堂”模式的“管理人员不专业”和“食材零采成本高”等问题，\n以及“学生集体餐成品配送”模式的“口感差”和“食品温度难控制”等问题。\n同时，通过餐饮管理公司的规模化采购，大大降低了食材成本，丰富了学生餐桌，提升了校餐质量。"
    , true, "4");
    
    
    new markerRenderer(x + 95, 980, 200, 200, 1, "米饭\n主食");   
    new markerRenderer(x + 95, 1350, 200, 200, 1, "萝卜\n蔬菜");    
    
    
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