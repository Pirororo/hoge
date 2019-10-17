

//violet 400~435
//blue       
//green            
//yellow
//orange
//red

import codeanticode.syphon.*;
PGraphics canvas;
SyphonServer server;


int num =120;//玉の個数
  PVector [] cirLoc = new PVector[num]; //はじめに並べてある玉の位置 
  int radius; 
  float theta;
  float startTheta;
  float thetaSpeed;
  float r;
  //float lifespan;
  float hacho;

void setup(){

  
  size(800,600,P3D);
  canvas = createGraphics(800,600, P3D);
  server = new SyphonServer(this, "Processing Syphon");
  
  //size(900,600);
  colorMode(HSB,360,100,100,100);

    for(int i=0; i<num; i++ ){
      cirLoc[i] = new PVector(width/num*(i+1), height/2);
    }
    radius =6; 
    theta=0;
    startTheta=0;
    thetaSpeed = 1;
    //lifespan = 2000; 
    r = 100;
    
  
 
}

void draw(){
  
  update();
  //displey();
  
  canvas.beginDraw();
    
    canvas.background(0);
    //始めに並べてある玉
    float hue = map(hacho,90,720,0,280);
    canvas.fill(hue,100,100,100); 
    for(int i =1; i<num; i++){    
        canvas.ellipse(cirLoc[i].x,cirLoc[i].y,radius,radius);
    } 
    
  canvas.endDraw();
  server.sendImage(canvas);
} 
  
  void update(){
  
    
    theta+= thetaSpeed;
    
    for(int i=0; i<num; i++ ){
      //hacho = map(mouseX, 0, width, 90, 720);
      //startTheta = map(cirLoc[i].x, width/5*0, width/5*1, 0, hacho);
      startTheta = map(cirLoc[i].x, width/5*0, width/5*1, 0, 360);
    
      
      ////startTheta = hacho;
      cirLoc[i].y = r * sin(radians(theta+ startTheta))+(height/2);
    }
    
    if(theta>= 360){
        theta=0;
    }
    
  }

  //void displey(){    
  //  canvas.beginDraw();
    
  //  //始めに並べてある玉
  //  float hue = map(hacho,90,720,0,280);
  //  canvas.fill(hue,100,100,100); 
  //  for(int i =1; i<num; i++){    
  //      canvas.ellipse(cirLoc[i].x,cirLoc[i].y,radius,radius);
  //  } 
    
  //  canvas.endDraw();
  //  server.sendImage(canvas);
  //}

  
