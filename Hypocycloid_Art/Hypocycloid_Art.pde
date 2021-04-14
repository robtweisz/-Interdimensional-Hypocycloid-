// "Hypocycloid"
// Robert Weisz 2020 ©
static final int NUM_LINES = 161; 
float t, i = 0, j = 0; 
float fr = 240;      // fixed circle radius
float fx = width/2;
float fy = height/2;
float n = 5.1; //good n = 3.9
float cr = 0.9*fr/n;  
float an;

float qn;

void setup() {
  background(255); 
  size(1000, 1000);
} 
void draw() {
  an = cr+(interactX()+275); 
  qn = n;
  //qn = n + interactY();



  n+=0.0002;
  if (n>5.9) {
    n = 5.14159;
  }
  t += 0.0003333;
 // print(qn+" ");
  background(0);  

  stroke(i+10, i, i+20); 

  strokeWeight(2); 
  translate(width/2, height/2); 

  for (int i = 0; i < NUM_LINES; i++) { 
    strokeWeight(2);
    stroke(255);
    line(x1(t +i), y1(t+i), x2(t + i), y2(t + i));
    stroke(0);
    strokeWeight(2);
    point(x2(t + i+20), y2(t + i+20));
    point(x1(t + i), y1(t + i));
  } 


  if (i == 255) {
    j = 1;
  }
  if (i == 0) {
    j = 0;
  }
  if (j == 0) {
    i++;
  } else if (j == 1) {
    i--;
  }
}

float x1(float t) { 
  return 161*cos(t);
} 

float y1(float t) { 
  return 161*sin(t);
} 

float x2(float t) { 
  return an * (qn - 1) * cos(t) - an * cos((qn-1)*t);
} 

float y2(float t) { 
  return  an * (qn - 1) * sin(t) - an * sin((qn-1)*t);
}


float interactX() {
  if (mouseX!=0) {
    return (mouseX/2-500);
  } else {
    return 1;
  }
}

float interactY() {
  if (mouseY!=0) {
    return (mouseY/1000-1);
  } else {
    return 1;
  }
}
