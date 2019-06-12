/*
 this agent can move with user's face
 and face to the use's face.
 It also has the act of spacing
 and when press the k key then the agent become big
 so the user can feel that the agent is closing to the user.
 Now aimming to let user feel there is a space in the wall,
 the virture agent was put in a room image. 
 */


import hypermedia.net.*;
UDP udp;

import processing.net.*;
Client myClient;

String word = "";


float easing = 0.01;
float horizontalRadian; //horizontal axis (ear to ear)
float verticalRadian; //vertical axis (up through head)

float[] moveRadians_horizontal = new float[60];
float[] moveRadians_vertical = new float[60];

float x = 0.0; //position of agent's x
float y = 0.0; //position of agent's y
int i = 0;

int value = 0; //initial value of zoom in, for judging when to zoom in

head theHead;
body theBody;
arm theArm;
leg theLeg;


void setup() {
  frameRate(60);
  udp = new UDP( this, 29129 );
  udp.listen( true );
  size(1300, 760, P3D);  //fit on my display.
  smooth();

  myClient = new Client(this, "localhost", 10500);

  theHead = new head();
  theBody = new body();
  theArm = new arm();
  theLeg = new leg();
}

void draw() {
  background(144);

  textSize(30);
  fill(0, 0, 0);
  text('1', 450, 300);
  text('2', 850, 300);
  text('3', 450, 600);
  text('4', 850, 600);

  //wall line
  line(0, 760, 333, 150);
  line(333, 0, 333, 150);
  line(333, 150, 967, 150);
  line(1300, 760, 967, 150);
  line(967, 0, 967, 150);

  //put the origin on the middle of the canvas
  translate(width/2, height/2, 0);
  //put the data of user's face into arrays
  moveRadians_horizontal[40] = horizontalRadian;
  moveRadians_vertical[40] =  verticalRadian;
  for (int i = 0; i <= 40; i++) {
    moveRadians_vertical[i] = moveRadians_vertical[i+1];
    moveRadians_horizontal[i] = moveRadians_horizontal[i+1];
  }

  //tan(angle)
  x = x + ((450*tan((PI/180)*moveRadians_horizontal[0]))-x) * easing;
  y = y + ((350*tan((PI/180)*moveRadians_vertical[0]))-y) * easing;

  //It's about the direction of face
  float upDown = ((PI/180)*moveRadians_vertical[0]); 
  float leftRight = ((PI/180)*moveRadians_horizontal[0]);

  rotateX(-upDown);//control up and down
  rotateY(leftRight);//control left and right

  //if value equal 0, won't move,
  //And it will make agent zoom in if value changed.
  
  userVoiceContext();
  
  if (value ==0) {
    translate(-x, -y, 50);
  } else {
    if (i<=300) {
      value = i;
    }
    translate(-x, -y, 50+value);
    i += 1;
  }

  lights();
  //shininess(10.0);
  theHead.agent_head();
  translate(0, 0, 98);
  theHead.agent_eyeSocket();
  theHead.agent_eyeShine();
  theHead.agent_check();
  theHead.agent_mouth();

  translate(0, 100, -98);
  theBody.agent_body();
  translate(0, 40, 10);
  theArm.agent_arm();
  translate(0, 0, 0);
  theLeg.agent_left_spacing();
  theLeg.agent_right_spacing();
}

class head {
  float i = 0.0;

  void agent_head() {
    noStroke();
    fill(255, 255, 0);
    sphere(100);//randians 100
  }

  void agent_eyeSocket() {
    fill(0);
    ellipse(-31, 0, 26, 26);
    ellipse(31, 0, 26, 26);
  }

  void agent_eyeShine() {
    fill(255);
    ellipse(-33, 5, 6, 6);
    ellipse(33, 5, 6, 6);
  }

  void agent_check() {
    fill(252, 98, 93);
    ellipse(-45, 20, 28, 13);
    ellipse(45, 20, 28, 13);
  }

  void agent_mouth() {
    fill(220, 0, 0);
    arc(0, 22, 50, 50, radians(45), radians(135), OPEN);
  }
}

class body {
  void agent_body() {
    fill(255, 230, 0);
    //box(w, h, d)
    box(100, 120, 80);
  }
}

class arm {
  void agent_arm() {
    stroke(0);
    strokeWeight(10);
    noFill();
    arc(0, 0, 145, 125, PI+QUARTER_PI, TWO_PI);
    arc(0, 0, 145, 125, PI, PI+QUARTER_PI);
  }
}

class leg {
  int i = 0;//control the speed of left leg spacing
  int j = 0;//control the speed of right leg spacing

  void agent_leg() {
    stroke(0);
    strokeWeight(10);
    line(-30, 0, -30, 85);
    line(30, 0, 30, 85);
  }
  void agent_left_spacing() {
    stroke(0);
    strokeWeight(10);

    if (i%100<=40) {
      line(-30, 0, -30, 85);
    } else {
      line(-30, 0, -30, 110);
    }
    i++;
  }
  void agent_right_spacing() {
    stroke(0);
    strokeWeight(10);

    if (j%100<=40) {
      line(30, 0, 30, 110);
    } else {
      line(30, 0, 30, 85);
    }
    j++;
  }
}

void userVoiceContext() {
  String tmpword = getWord();
  if (tmpword.indexOf("おはよう") != -1) {
    //if press A or a it will make agent zoom in
    if (value == 0) {
      value = 1;
    } else if(tmpword.indexOf("いやだ") != -1){
      value = 0;
    }
  }
}

void receive( byte[] data) {
  //get data from faceAPI
  String message = new String(data);
  String[] message2 = splitTokens(message, " "); 
  //Something wrong in "println(message2);"

  //get the vertival radian
  verticalRadian = Float.parseFloat(message2[3]);
  //get the horizontal radian
  horizontalRadian = Float.parseFloat(message2[4]);
}

String getWord() {
  String word = "";
  if (myClient.available()>0) {
    String dataIn = myClient.readString();
    String[] sList = split(dataIn, "WORD");
    for (int i=1; i<sList.length; i++) {
      String tmp = sList[i];
      String[] tList = split(tmp, '"');
      word += tList[1];
    }
  }
  if (word != "") {
    println(word);
  }
  return word;
}
