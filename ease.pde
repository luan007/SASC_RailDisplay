float ease(float from, float to, float rate) {
  if(abs(from - to) < 0.00001) {
    return to;
  }
  return from + (to - from) * rate;
}

float scaler(float xOffset, float bleed) {
  return min(0.5, 1 - abs(xOffset - w / 2) / ( w / 2 )) * (0.5 + bleed) + 0.5;
}