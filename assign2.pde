/* please implement your assign1 code in this file. */
final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_WIN=2;
final int GAME_OVER=3;
int gameState;

PImage fighter,hp,treasure,enemy,bg1,bg2;
PImage start1,start2,end1,end2;
int x = 0 ,bgx1,bgx2 = 0;
int shipx,shipy;
float a,tx,ty,hpy,enemyx,enemyy;
float speed = 8;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
    size(640,480) ;  // must use this size.
    start1 = loadImage("img/start1.png");
    start2 = loadImage("img/start2.png");
    end1 = loadImage("img/end1.png");
    end2 = loadImage("img/end2.png");
    
    
    shipx = width-50;
    shipy = height/2;
    fighter = loadImage("img/fighter.png");
    a = random(430);
    
    hp = loadImage("img/hp.png");
    hpy = 40;
    fill(255,0,0);
    noStroke();
  
    treasure = loadImage("img/treasure.png");
    tx = random(600);
    ty = random(440);
    
    enemyy = random(415);
    enemy = loadImage("img/enemy.png");
    
    bg1 = loadImage("img/bg1.png");
    bg2 = loadImage("img/bg2.png");
    gameState = GAME_START;
    //image (start1,0,0);
}

void draw() {
  switch(gameState){
    case GAME_START:
      image(start2,0,0);
      if(mouseX > 205 && mouseX <455){
        if(mouseY >380 && mouseY <415){
          image(start1,0,0);
            if(mousePressed){
              gameState = GAME_RUN;
            }
        }
      }
      break;
    case GAME_RUN:
      image (bg1,bgx1,0);
      image (bg2,bgx2-640,0);
      bgx1 = bgx1 +1;
      if(bgx1==640){
        bgx1=-640;
      }
      bgx1 = bgx1 % 641;
      bgx2 = bgx2 +1;
      if(bgx2==1280){
        bgx2=0;
      }
      bgx2 = bgx2 % 1281;
      
      image(treasure,tx,ty);
      image(fighter,shipx,shipy);
      image(enemy,x,enemyy);
      if(x==640){
        enemyy=random(415);
      }
      x = x+4;
      x = x%640;
      if(enemyy>shipy){
        enemyy =enemyy-2;
      }
      if(enemyy<shipy){
        enemyy =enemyy+2;
      }
      rect(18, 13, hpy, 20);
      image(hp,10,10); 
      
      if(upPressed){
        shipy -= speed;
      }
      if(downPressed){
        shipy += speed;
      }
      if(leftPressed){
        shipx -= speed;
      }
      if(rightPressed){
        shipx += speed;
      }
      if(shipx>=width-50){
        shipx = width-50;
      }
      if(shipx<=0){
        shipx = 0;
      }
      if(shipy>=height-50){
        shipy = height-50;
      }
      if(shipy<=0){
        shipy = 0;
      }
      if(shipx<=x+50 && shipx>=x-50){
        if(shipy<=enemyy+50 && shipy>=enemyy-50){
          hpy=hpy-40;
          x=0;
          if(x==0){
            enemyy=random(415);
          }
          if(hpy<=0){
             gameState = GAME_OVER;
             hpy=40;
          }
        }
      }
      if(shipx<=tx+50 && shipx>=tx-50){
        if(shipy<=ty+50 && shipy>=ty-50){
          hpy=hpy+20;
          if(hpy>=200){
            hpy=200;
          }
          tx = random(600);
          ty = random(440);
        }        
      } 
      break;
    
    
    case GAME_OVER:
      image(end2,0,0);
      if(mouseX > 205 && mouseX <440){
        if(mouseY >305 && mouseY <350){
          image(end1,0,0);
            if(mousePressed){
              gameState = GAME_RUN;
              shipx = width-50;
              shipy = height/2;
            }
        }
      }
      break;
  }
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
