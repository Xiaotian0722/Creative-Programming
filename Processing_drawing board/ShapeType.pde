class ShapeType{
  String shape_name;
  ShapeType(String pic_name){
    shape_name=pic_name;
  }

  public void drawShape(){
    if(shape_name=="line"){
      frameRate(300);
      strokeWeight(strokeSize);
      stroke(strokeColor);
      if(mousePressed&&mouseY>140){
        line(mouseX,mouseY,pmouseX,pmouseY);
      }
    }
    
    if(shape_name=="random_circle"){
      frameRate(8);                  
      noStroke();
      if(mousePressed&&(mouseButton==LEFT)&&mouseY>140){
        int r=(int)random(25,45);    
        int R=(int)random(0,255);    
        int G=(int)random(0,255);    
        int B=(int)random(0,255);    
        int A=(int)random(0,255);    
        fill(R,G,B,A);
        ellipse(mouseX,mouseY,r,r);
      }
    }
    
    if(shape_name=="move_circle"){
      frameRate(50);
      noStroke();    
      if(mouseY>140){
        if(mousePressed){
          move_circle_d=1;
        }else{
          if(move_circle_d==1){
             MoveCircle mc=new MoveCircle(mouseX,mouseY,strokeColor,strokeSize);
             mcs=(MoveCircle[])append(mcs,mc);    
          }
          move_circle_d=0;
        }
      }
      for(int i=0;i<mcs.length;i++){
         mcs[i].move();       
      }
    }
    
    if(shape_name=="rect"){   
      frameRate(30);
      noStroke();
      if(mouseY>140){
      if(mousePressed){
          d_=1;
          j2=0;
          if (j1==0) 
          {
            j1=1;
            x1=mouseX;
            y1=mouseY;
          }    
        }else{
          if (d_==1) {
            fill(strokeColor);
            j1=0;
            if (j2==0) 
            {
              j2=1;
              x2=mouseX;
              y2=mouseY;
            }
            quad(x1, y1, x1, y2, x2, y2, x2, y1);    
            d_=0;
          }
        } 
      } 
    }
    
    if(shape_name=="radius_rect"){
      frameRate(100);
      strokeWeight(strokeSize);
      stroke(strokeColor);
      if(mouseY>140){
      if(mousePressed){
          rcd_=1;
          rcj2=0;
          if (rcj1==0) 
          {
            rcj1=1;
            rcx1=mouseX;
            rcy1=mouseY;
          }
        }else{
          if (rcd_==1) {
            fill(255);
            rcj1=0;
            if (rcj2==0) 
            {
              rcj2=1;
              rcx2=mouseX;
              rcy2=mouseY;
            }

            float rcr=min(abs(rcx1-rcx2),abs(rcy1-rcy2))/3.0;    
            float rct;    

            if(rcx1>rcx2){
             rct=rcx1;rcx1=rcx2;rcx2=rct;
            }
            if(rcy1>rcy2){
             rct=rcy1;rcy1=rcy2;rcy2=rct; 
            }
            fill(strokeColor);
            arc(rcx1+rcr/2,rcy1+rcr/2,rcr,rcr,PI,PI+HALF_PI);
            arc(rcx2-rcr/2,rcy1+rcr/2,rcr,rcr,PI+HALF_PI,TWO_PI);
            arc(rcx2-rcr/2,rcy2-rcr/2,rcr,rcr,0,HALF_PI);
            arc(rcx1+rcr/2,rcy2-rcr/2,rcr,rcr,HALF_PI,PI);
            rect(rcx1,rcy1+rcr/2,rcx2-rcx1,rcy2-rcr-rcy1);
            rect(rcx1+rcr/2,rcy1,rcx2-rcr-rcx1,rcy2-rcy1);
            rcd_=0;
          }
        } 
      } 
    }
    
    if(shape_name=="center_shape"){
      frameRate(300);
      strokeWeight(strokeSize);
      stroke(strokeColor);
      if(mouseY>140){
        if(mousePressed){
          csd_=1;
          if(csj==0){
            csj=1;
            csx=mouseX;
            csy=mouseY;
          }
          translate(csx,csy);           
          if(dist(mouseX-csx,mouseY-csy,0,0)<(csy-140)){    
            for(int i=0;i<line_count;i++){  
                line(mouseX-csx,mouseY-csy,pmouseX-csx,pmouseY-csy);          
                rotate(TWO_PI/line_count);                     
              }
            }
        }else{
          if(csd_==1){
            csj=0;
          }
          csd_=0;
        }
      }
    }

    if(shape_name=="flower"){
      frameRate(15);
      if(mouseY>150){
        if(mousePressed){
            Flower f=new Flower(mouseX, mouseY);
            f.show();
        }else{
          flowerSize=50;
        }
      }
    }
    
    if(shape_name=="color_flower"){
      frameRate(10);
      if(mouseY>150){
        if(mousePressed){  
          translate(mouseX,mouseY);
          scale(flowerSize/100-0.3+size);
          s.beginShape();
          s.fill(strokeColor);
          s.endShape();
          if(size<=0.6&&mouseY-(132*(0.2+size))>120){
            for(int j=0;j<6;j++){       
              shape(s,0,0); 
              rotate(radians(72));
            }
            fill(colora);
            ellipse(0,0,40,40);
            size+=0.03;
          }
        }else{
          colora=color(random(0,120),random(0,120),random(0,100));
          size=0;
        }
      }
    }
    
  }
}
