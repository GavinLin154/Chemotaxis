minionWalker[] family = new minionWalker[150];
int bananaX, bananaY;
banana eats;

void setup() {
  size(1000,1000); 
  for(int i = 0; i < family.length; i++) {
    family[i] = new minionWalker(); 
  }
}

void draw() {
  background(255);
  for(int i = 0; i < family.length; i++) {
    family[i].show();
    family[i].walk();
  }
  if (mousePressed) {
    bananaX = mouseX;
    bananaY = mouseY;
    eats = new banana(bananaX, bananaY);
    eats.show();
  } else {
    bananaX = 0;
    bananaY = 0;
  }
}  

class minionWalker {
  
  int myX, myY, myColor, minionShape;
  
  minionWalker() {
    myX = (int)(Math.random() * 1001);
    myY = (int)(Math.random() * 1001);
    myColor = (int)(Math.random() * 2);
    if (myColor == 0) {
      myColor = color(111,48,194);
    } else {
      myColor = color(255,255,0); 
    }  
    minionShape = (int)(Math.random() * 2);
  }  
  
  void walk() {
    
    if (bananaX == 0 && bananaY == 0) {
      myX += ((int)(Math.random() * 15) - 7);
      myY += ((int)(Math.random() * 15) - 7);
    } else if (mouseX > myX && mouseY > myY) {
      myX += ((int)(Math.random() * 7) - 2);
      myY += ((int)(Math.random() * 7) - 2);
    } else if (mouseX > myX && mouseY < myY) {
      myX += ((int)(Math.random() * 7) - 2);
      myY += ((int)(Math.random() * 7) - 4);
    } else if (mouseX < myX && mouseY > myY) {
      myX += ((int)(Math.random() * 7) - 4);
      myY += ((int)(Math.random() * 7) - 2);
    } else if (mouseX < myX && mouseY < myY){
      myX += ((int)(Math.random() * 7) - 4);
      myY += ((int)(Math.random() * 7) - 4);
    } else if (mouseX > myX && mouseY == myY) {
      myX += (int)(Math.random() * 7);
      myY += ((int)(Math.random() * 11) - 5);
    } else if (mouseX < myX && mouseY == myY) {
      myX += (int)(Math.random() * 7);
      myY += ((int)(Math.random() * 11) - 5);
    } else if (mouseX == myX && mouseY > myY) {
      myX += ((int)(Math.random() * 11) - 5);
      myY += (int)(Math.random() * 7);
    } else if (mouseX == myX && mouseY < myY) {
      myX += ((int)(Math.random() * 11) - 5);
      myY += (int)(Math.random() * 7);
    }  
  }  
  
  void show() {
    if (minionShape == 0) {
      //Minion (Two Eyed)
      strokeWeight(1);
      fill(myColor);
      ellipse(myX,myY,50,50);
      fill(68,109,146);
      arc(myX,myY + 8,48,32,2*PI,3*PI);
      fill(0);
      strokeWeight(8);
      line(myX - 20,myY - 7,myX + 20,myY - 7);
      fill(211, 211, 211);
      strokeWeight(1);
      ellipse(myX - 7.5,myY - 7,15,15);
      ellipse(myX + 7.5,myY - 7,15,15);
      fill(0);
      ellipse(myX - 7.5,myY - 7,5,5);
      ellipse(myX + 7.5,myY - 7,5,5);
      strokeWeight(2);
      line(myX - 5,myY + 4,myX + 5,myY + 4);  
    } else if (minionShape == 1) {
      //Minion (One Eyed)
      strokeWeight(1);
      fill(myColor);
      ellipse(myX,myY,50,50);
      fill(68,109,146);
      arc(myX,myY + 8,48,32,2*PI,3*PI);
      fill(0);
      strokeWeight(8);
      line(myX - 20,myY - 7,myX + 20,myY - 7);
      fill(211, 211, 211);
      strokeWeight(1);
      ellipse(myX,myY - 7,17,17);
      fill(0);
      ellipse(myX,myY - 7,5.5,5.5);
      strokeWeight(2);
      line(myX - 5,myY + 5,myX + 5,myY + 5);
    }  
  }  
  
  
} //end of minion class  

class banana {
  
  int myX, myY;
  
  banana(int x, int y) {
    myX = x;
    myY = y;
  }
  
  void show() {
    fill(255,255,0);
    strokeWeight(2);
    beginShape();
    bezier(myX-30,myY-60,myX-20,myY-45,myX+15,myY+30,myX+110,myY+50);
    bezier(myX-30,myY-60,myX-40,myY-30,myX,myY+60,myX+70,myY+60);
    bezier(myX-30,myY-60,myX-70,myY-55,myX-40,myY+60,myX+25,myY+70);
    endShape();
    line(myX-30,myY-60,myX+110,myY+50);
    fill(150,75,0);
    rect(myX-42,myY-68,20,10);
    fill(0);
  }  
} //end of banana class  
