/*this agent can move with user's face
 and face to the use's face.
 It also has the act of spacing
 and when press the k key then the agent become big
 so the user can feel that the agent is closing to the user.
 Now aimming to let user feel there is a space in the wall,
 the virture agent was put in a room image.
 */


import hypermedia.net.*;
UDP udp;

float easing = 0.01;
float horizontalRadian; //horizontal axis (ear to ear)
float verticalRadian; //vertical axis (up through head)

float[] moveRadians_horizontal = {
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
};
float[] moveRadians_vertical = {
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
  0, 0, 0, 0, 0, 
};
float x = 0.0; //position of agent's x
float y = 0.0; //position of agent's y
int i = 0;

head theHead;
body theBody;
arm theArm;
leg theLeg;


void setup() {
  frameRate(60);
  udp = new UDP( this, 29129 );
  udp.listen( true );
  size(1260, 640, P3D);
  smooth();

  theHead = new head();
  theBody = new body();
  theArm = new arm();
  theLeg = new leg();
}

void draw() {
  background(144);
  line(0, 640, 280, 150);
  line(280, 0, 280, 150);
  line(280, 150, 980, 150);
  line(1260, 640, 980, 150);
  line(980, 0, 980, 150);
  
  translate(width/2, height/2, 0);

  //put the data of user's face into arrays
  moveRadians_horizontal[61] = horizontalRadian;
  moveRadians_vertical[61] =  verticalRadian;
  for (int i = 0; i <= 60; i++) {
    moveRadians_vertical[i] = moveRadians_vertical[i+1];
    moveRadians_horizontal[i] = moveRadians_horizontal[i+1];
  }
  //use "PI" to turn radians to angles
  //get the position of agent
  x = x + ((3*310*tan(PI/(180/moveRadians_horizontal[0])))-x) * easing;
  y = y + ((3*310*tan(PI/(180/moveRadians_vertical[0])))-y) * easing;

  translate(-x, -y, 0);

  float upDown = PI/(180/moveRadians_vertical[0]);
  float leftRight = PI/(180/moveRadians_horizontal[0]);

  //float upDown = map(y, -320, 320, -PI/6, PI/6);
  //float leftRight = map(x, -630, 630, PI/10, -PI/10);
  rotateX(-upDown);//control up and down
  rotateY(leftRight);//control left and right

  //if press the "k" key, the agent can move close to user.
  if (key == 'k') {
    if (i<=250) {
      translate(0, 0, i);
    }
    i += 1;
  }

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

  void headZoomIn() {
    noStroke();
    fill(255, 255, 0);
    sphere(100);//randians 100
    if (i <= 40) {
      sphere(100+i);
    }
    i += 0.1;
  }

  void agent_eyeSocket() {
    fill(0);
    ellipse(-31, 0, 26, 26);
    ellipse(31, 0, 26, 26);
  }

  void eyeSocketZoomIn() {
    fill(0);
    ellipse(-31, 0, 26, 26);
    ellipse(31, 0, 26, 26);
    if (i <= 40) {
      ellipse(-31+i, 0+i, 26+i, 26+i);
      ellipse(31+i, 0+i, 26+i, 26+i);
    }
    i+= 0.1;
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
    box(100, 120, 40);
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
      line(-30, 0, -30, 90);
    }
    i++;
  }
  void agent_right_spacing() {
    stroke(0);
    strokeWeight(10);

    if (j%100<=40) {
      line(30, 0, 30, 90);
    } else {
      line(30, 0, 30, 85);
    }
    j++;
  }
}

void receive( byte[] data) {
  //get data from faceAPI
  String message = new String(data);
  String[] message2 = splitTokens(message, " "); 
  //println(message2);

  //get the vertival radian
  verticalRadian = Float.parseFloat(message2[3]);
  //get the horizontal radian
  horizontalRadian = Float.parseFloat(message2[4]);
}
