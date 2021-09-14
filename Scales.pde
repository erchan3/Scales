void setup() {
  size(400, 400);
  noStroke();
  background(10);
  drawScales(40, 40);
}

int rand(int minv, int maxv) {
  return (int) (Math.random() * (maxv - minv)) + minv;
}
// 0.005 --> 0.015
void drawScale(float x, float y, float w, float h) {
  int r = 200;
  int g = 100;
  int b = 100;
  int randXBound = (int) h/13;
  int randYBound = (int) w/25;
  float step = rand(5, 15) / 1000.0;
  float scaleSize = 1;

  push();
  translate(x, y + h / 2);

  for (float i = 1; i > 0; i -= step) {
    fill(r, g, b);
    push();
    scale(scaleSize);
    bezier(0, -w/2, h + rand(-randXBound, randXBound + 1), -w/3 + rand(-randYBound, randYBound + 1), h + rand(-randXBound, randXBound + 1), w/3 + rand(-randYBound, randYBound + 1), 0, w/2);
    pop();
    float colorInc = 1 / step / 100;
    r -= colorInc;
    g -= colorInc;
    b -= colorInc;
    scaleSize -= 0.01;
  }
  pop();
}

void drawScales(float w, float h) {
  for (int i = (int) (width / h * 2.5) + 1; i >= -5; i--) {
    for (int j = (int) (height / w * 1.2) + 1; j >= -5; j--) {
      float x = i * (h/2.5);
      float y = j * (w/1.2) + (i % 2 * (w/2));
      drawScale(x, y, w, h);
    }
  }
}
