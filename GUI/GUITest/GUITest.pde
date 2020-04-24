void setup() {
  size(1600, 900);
}

int gray = 0;

void draw() {
  background(gray);
} 

void mousePressed() {
  gray += 20;
}
