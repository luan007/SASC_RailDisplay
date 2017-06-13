class huaian extends render_dot {

  huaian(float x, float y, float layer) {
    super(x, y, layer);
    new qingdao_marker(3900, 1600, 1.2, "8658户\n服务单位数据");
    new qingdao_marker(4180, 725, 1.2, "3875个\n开通用户");
    new qingdao_marker(4020, 1100, 1.3, "3400户\n开放展示");
    new qingdao_marker(4150, 1500, 1.1, "100%学校\n上线运行");

    new highLightRenderer(3500, 1000, 350, 350, 1, "厨房加工透明", "1", null);
    new highLightRenderer(3300, 1480, 150, 150, 1, "食品留样透明", "2", "食品名称 留样人 餐次 时间".split(" "));
    new highLightRenderer(3200, 600, 250, 250, 1, "原料采购透明", "3", "时间 类别 名称 规格 品牌 批号 保质期 供应商 采购量".split(" "));
    new highLightRenderer(2950, 1250, 250, 250, 1, "检验结果透明", "4", "企业自检 供应商快检".split(" "));
    new highLightRenderer(2850, 400, 250, 250, 1, "人员资质透明", "5", "姓名 性别 状态 职务 就业时间".split(" "));
    new highLightRenderer(2300, 400, 300, 300, 1, "执法监督透明", "6", "日常检查 专项检查 监督人员 企业自检 监督检查 行政处罚".split(" "));
    new highLightRenderer(2200, 1100, 250, 250, 1, "历史等级透明", "7");
    new highLightRenderer(2100, 1650, 250, 250, 1, "公共评价透明", "8", "场所卫生 菜品卫生 人员卫生 口味服务 服务态度 价格态度 评价内容".split(" "));

    new textRenderer(x, 1700, 3, "江苏省淮安市\n打造“明厨亮灶升级版”");
    new textParagraph(x + 300, 100, 550, 180, 1.8,
    "八透明：食物由“生”到“熟”的加工全过程搬上网 \n网上24小时直播，实现“八透明”包括\n人员资质、原料采购、厨房加工、食品留样、\n检测结果、执法监督、公众评价、历史等级", false);
  }

  void draw() {
    if (sc < 0) return;
    p.pushMatrix();
    p.rectMode(0);
    p.fill(0, 60, 80, sc * 255);
    p.rect(0, 0, p.width, p.height);

    p.fill(255, 150);
    int s = 120;
    p.noStroke();
    p.rectMode(CENTER);
    p.translate(xoffset % s, 0);
    for (float x = -s; x < w + s; x+=s) {
      for (float y = -s; y < h + s; y+=s) {
        p.fill(255, sc * 255);
        p.pushMatrix();
        p.translate(x, y);
        //p.rotate(PI / 4);
        p.scale(sin(x / 1000 + t));
        p.rect(0, 0, 3, 15);
        p.rect(0, 0, 15, 3);
        p.popMatrix();
      }
    }
    p.popMatrix();
    //p.text("明厨亮灶 3.0", this.xoffset, 0);
  }
}