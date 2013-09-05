int BarColor=184;
float FrameWeight=1.5;
int ButtonSelect=12;
int ButtonNoSelect=2;
LeftBar LB=new LeftBar();
int LB_Button=0;
Paper PaperFrame;
RightBar RB=new RightBar();
int RB_Size=5;
int RB_Color=8;
int[][] Color={{255,0,0},
              {255,165,0},
              {255,255,0},
              {0,255,0},
              {0,0,255},
              {106,90,205},
              {165,0,255},
              {255,255,255},
              {0,0,0}};
int[] Size={20,17,14,11,8,5};
int ClickNum;
float x1=0;
float y1=0;

void setup(){
  size(160*4+50*4,155*4);
  smooth();
  strokeJoin(ROUND);
  background(218);
  PaperFrame=new Paper();
  textSize(16);
}

void draw(){
  /////////////////////////////////////////////////
  LB_Button=LB.GetButton(LB_Button);//Choose Tool
  RB_Size=RB.GetSize(RB_Size);//Choose Size
  RB_Color=RB.GetColor(RB_Color);//Choose Color
  LB.DrawBar();//Draw left menu
  RB.DrawBar();//Draw right menu
  //Draw Help (must be in the last)
  LB.DrawHelp();
  RB.DrawHelp();
  //////////////////////////////////////////////////
  PaperFrame.Draw(LB_Button,RB_Size,RB_Color);
  ////////////////////////////////////////////////
  if(keyPressed){
        if(key=='e' || key=='E'){
          ClickNum=0;
        }else if(key=='r' ||key=='R'){
          PaperFrame=new Paper();
        }
      }
}

class LeftBar{
  int gap;
  int ButtonL;
  int ButtonNum;
  int[] ButtonChoose={1,0,0,0,0,0};
  //Variable define
  LeftBar(){
    gap=20;
    ButtonL=80;
    ButtonNum=6;
  }
  //Draw Left bar
  void DrawBar(){
    //Draw Left bar background
    strokeWeight(FrameWeight);
    fill(BarColor);
    rect(0,0,gap*2+ButtonL,(gap+ButtonL)*ButtonNum+gap);
    //Draw Button frame
    for(int i=0;i<ButtonNum;i++){
      if (ButtonChoose[i]==1){
        strokeWeight(ButtonSelect);//be selected
      }else{
        strokeWeight(ButtonNoSelect);//not be selected
      }
      fill(255);
      rect(gap,i*(gap+ButtonL)+gap,ButtonL,ButtonL);
      strokeWeight(1.5);
      switch(i){
        case 0:
          PenButton(gap,i*(gap+ButtonL)+gap);
          break;
        case 1:
          EraserButton(gap,i*(gap+ButtonL)+gap);
          break;
        case 2:
          LineButton(gap,i*(gap+ButtonL)+gap);
          break;
        case 3:
          SquareButton(gap,i*(gap+ButtonL)+gap);
          break;
        case 4:
          CircleButton(gap,i*(gap+ButtonL)+gap);
          break;
        case 5:
          QuadButton(gap,i*(gap+ButtonL)+gap);
          break;
        default:
          break;
      }
    }
  }
  //Button pictures
  void PenButton(int x,int y){
      beginShape();
      vertex(x+10+ButtonL-20-10,y+10);
      vertex(x+10,y+10+ButtonL-20-10);
      vertex(x+10,y+10+ButtonL-20);
      vertex(x+10+10,y+10+ButtonL-20);
      vertex(x+10+ButtonL-20,y+10+10);
      vertex(x+10+ButtonL-20-10,y+10);
      endShape();
      beginShape();
      vertex(x+10,y+10+ButtonL-20-10);
      vertex(x+10+10,y+10+ButtonL-20);
      endShape();
    }
    void EraserButton(int x,int y){
      ellipse((x+10+x+10+25)/2,(y+10+ButtonL-20-25+y+10+ButtonL-20)/2,(x+10+25)-(x+10)+5,(y+10+ButtonL-20)-(y+10+ButtonL-20-25)+5);
      beginShape();
      vertex(x+10+ButtonL-20-25,y+10);
      vertex(x+10,y+10+ButtonL-20-25);
      vertex(x+10+25,y+10+ButtonL-20);
      vertex(x+10+ButtonL-20,y+10+25);
      vertex(x+10+ButtonL-20-25,y+10);
      endShape();
    }
    void LineButton(int x,int y){
      line(x+ButtonL-5,y+5,x+5,y+ButtonL-5);
    }
    void SquareButton(int x,int y){
      rect(x+10,y+10,ButtonL-20,ButtonL-20);
    }
    void CircleButton(int x,int y){
      ellipse(x+ButtonL/2,y+ButtonL/2,ButtonL-20,ButtonL-20);
    }
    void QuadButton(int x,int y){
      quad(x+10,y+10,x+ButtonL-10,y+10,x+ButtonL-20,y+ButtonL-10,x+20,y+ButtonL-15);
    }
    //Click Button
    int GetButton(int k){
      if (mousePressed){
        if (mouseX>gap && mouseX<gap+ButtonL && mouseY>0*(gap+ButtonL)+gap && mouseY<1*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[0]=1;
          k=0;
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>1*(gap+ButtonL)+gap && mouseY<2*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[1]=1;
          k=1;
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>2*(gap+ButtonL)+gap && mouseY<3*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[2]=1;
          k=2;
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>3*(gap+ButtonL)+gap && mouseY<4*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[3]=1;
          k=3;
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>4*(gap+ButtonL)+gap && mouseY<5*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[4]=1;
          k=4;
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>5*(gap+ButtonL)+gap && mouseY<6*(gap+ButtonL)){
          for (int i=0;i<ButtonNum;i++){ButtonChoose[i]=0;}
          ButtonChoose[5]=1;
          k=5;
        }
      }
      return k;
    }
    //Draw Help
    void DrawHelp(){
      textAlign(RIGHT);
      fill(255,0,0);
      if (mouseX>gap && mouseX<gap+ButtonL && mouseY>0*(gap+ButtonL)+gap && mouseY<1*(gap+ButtonL)){
          text("Pen",mouseX,mouseY);
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>1*(gap+ButtonL)+gap && mouseY<2*(gap+ButtonL)){
          text("Eraser",mouseX,mouseY);
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>2*(gap+ButtonL)+gap && mouseY<3*(gap+ButtonL)){
          text("Line",mouseX,mouseY);
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>3*(gap+ButtonL)+gap && mouseY<4*(gap+ButtonL)){
          text("Square",mouseX,mouseY);
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>4*(gap+ButtonL)+gap && mouseY<5*(gap+ButtonL)){
          text("Circle",mouseX,mouseY);
        }else if(mouseX>gap && mouseX<gap+ButtonL && mouseY>5*(gap+ButtonL)+gap && mouseY<6*(gap+ButtonL)){
          text("Shape",mouseX,mouseY);
        }
    }
}

class RightBar{
  int RightBarX=(30+150)*4;
  int RightBarY=0;
  int RightBarL=30*4;
  int RightBarW=25*4*6+5*4;
  int[] SizeChoose={0,0,0,0,0,1};
  int SizeX=RightBarX+3*4;
  int SizeY=3*4;
  int SizeL=(30-3*2)*4;
  float SizeW=(6*6+1.5*2)*4;
  int[] ColorChoose={0,0,0,0,0,0,0,0,1};
  int ColorX=SizeX;
  float ColorY=SizeY+SizeW+5*4;
  int ColorL=SizeL;
  float ColorW=RightBarW-ColorY-5*4;
  RightBar(){}
  void DrawBar(){
    //background
    strokeWeight(FrameWeight);
    fill(BarColor);
    rect(RightBarX,RightBarY,RightBarL,RightBarW);
    //Size Choose Frame
    //Size Choose Frame Background
    fill(255);
    rect(SizeX,SizeY,SizeL,SizeW);
    //Size Choose Circle
    for(int i=0;i<6;i++){
      strokeWeight(0);
      if(SizeChoose[i]==1){
        fill(255,0,0);//Select
      }else{
        fill(0);//Not Select
      }
      int x;
      int y;
      if (i%2==0){x=0;}else{x=1;}//column
      if (i+1<3){y=0;}else if(i+1<5){y=1;}else{y=2;}//row
      ellipse(SizeX+1.5*4+6*4+x*12*4,SizeY+1.5*4+6*4+y*12*4,20-i*3,20-i*3);
    }
    //Color Choose
    //Color Choose Background
    strokeWeight(FrameWeight);
    fill(255);
    rect(ColorX,ColorY,ColorL,ColorW);
    //Color Choose Circle
    for (int i=0;i<9;i++){
      if(ColorChoose[i]==1){
        strokeWeight(5);//Select
      }
      else{
        strokeWeight(0);//not Select
      }
      int x;
      int y;
      if (i%2==0){x=0;}else{x=1;}//column
      if (i+1<3){y=0;}else if(i+1<5){y=1;}else if(i+1<7){y=2;}else if(i+1<9){y=3;}else{y=4;}
      fill(Color[i][0],Color[i][1],Color[i][2]);
      ellipse(ColorX+1.5*4+6*4+x*12*4,ColorY+1.5*4+6*4+y*12*4,20,20);
    }
  }
  int GetSize(int k){
    if(mousePressed){
      if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-0*3)/2) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-0*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+0*12*4)-(20-0*3)/2) && mouseY<((SizeY+1.5*4+6*4+0*12*4)+(20-0*3)/2)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=0;
           SizeChoose[k]=1;
         }else if(mouseX>((SizeX+1.5*4+6*4+1*12*4)-(20-1*3)/2) && mouseX<((SizeX+1.5*4+6*4+1*12*4)+(20-1*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+0*12*4)-(20-1*3)/2) && mouseY<((SizeY+1.5*4+6*4+0*12*4)+(20-1*3)/2)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=1;
           SizeChoose[k]=1;
         }else if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-2*3)/2) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-2*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+1*12*4)-(20-2*3)/2) && mouseY<((SizeY+1.5*4+6*4+1*12*4)+(20-2*3)/2)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=2;
           SizeChoose[k]=1;
         }else if(mouseX>((SizeX+1.5*4+6*4+1*12*4)-(20-3*3)/2) && mouseX<((SizeX+1.5*4+6*4+1*12*4)+(20-3*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+1*12*4)-(20-3*3)/2) && mouseY<((SizeY+1.5*4+6*4+1*12*4)+(20-3*3)/2)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=3;
           SizeChoose[k]=1;
         }else if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-4*3)/2-3) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-4*3)/2+3) &&
         mouseY>((SizeY+1.5*4+6*4+2*12*4)-(20-4*3)/2-3) && mouseY<((SizeY+1.5*4+6*4+2*12*4)+(20-4*3)/2+3)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=4;
           SizeChoose[k]=1;
         }else if(mouseX>=((SizeX+1.5*4+6*4+1*12*4)-(20-5*3)/2-3) && mouseX<=((SizeX+1.5*4+6*4+1*12*4)+(20-5*3)/2+3) &&
         mouseY>=((SizeY+1.5*4+6*4+2*12*4)-(20-5*3)/2-3) && mouseY<=((SizeY+1.5*4+6*4+2*12*4)+(20-5*3)/2+3)){
           for(int i=0;i<6;i++){SizeChoose[i]=0;}
           k=5;
           SizeChoose[k]=1;
         }
    }
    return k;
  }
  //ellipse(ColorX+1.5*4+6*4+x*12*4,ColorY+1.5*4+6*4+y*12*4,20,20);
  int GetColor(int k){
    if(mousePressed){
      if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+0*12*4-10
      && mouseY<ColorY+1.5*4+6*4+0*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=0;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+0*12*4-10
      && mouseY<ColorY+1.5*4+6*4+0*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=1;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+1*12*4-10
      && mouseY<ColorY+1.5*4+6*4+1*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=2;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+1*12*4-10
      && mouseY<ColorY+1.5*4+6*4+1*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=3;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+2*12*4-10
      && mouseY<ColorY+1.5*4+6*4+2*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=4;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+2*12*4-10
      && mouseY<ColorY+1.5*4+6*4+2*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=5;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+3*12*4-10
      && mouseY<ColorY+1.5*4+6*4+3*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=6;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+3*12*4-10
      && mouseY<ColorY+1.5*4+6*4+3*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=7;
        ColorChoose[k]=1;
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+4*12*4-10
      && mouseY<ColorY+1.5*4+6*4+4*12*4+10){
        for(int i=0;i<9;i++){
          ColorChoose[i]=0;
        }
        k=8;
        ColorChoose[k]=1;
      }
    }
    return k;
  }
  void DrawHelp(){
    textAlign(LEFT);
    fill(255,0,0);
    if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-0*3)/2) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-0*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+0*12*4)-(20-0*3)/2) && mouseY<((SizeY+1.5*4+6*4+0*12*4)+(20-0*3)/2)){
           text("20",mouseX,mouseY);
         }else if(mouseX>((SizeX+1.5*4+6*4+1*12*4)-(20-1*3)/2) && mouseX<((SizeX+1.5*4+6*4+1*12*4)+(20-1*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+0*12*4)-(20-1*3)/2) && mouseY<((SizeY+1.5*4+6*4+0*12*4)+(20-1*3)/2)){
           text("17",mouseX,mouseY);
         }else if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-2*3)/2) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-2*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+1*12*4)-(20-2*3)/2) && mouseY<((SizeY+1.5*4+6*4+1*12*4)+(20-2*3)/2)){
           text("14",mouseX,mouseY);
         }else if(mouseX>((SizeX+1.5*4+6*4+1*12*4)-(20-3*3)/2) && mouseX<((SizeX+1.5*4+6*4+1*12*4)+(20-3*3)/2) &&
         mouseY>((SizeY+1.5*4+6*4+1*12*4)-(20-3*3)/2) && mouseY<((SizeY+1.5*4+6*4+1*12*4)+(20-3*3)/2)){
           text("11",mouseX,mouseY);
         }else if(mouseX>((SizeX+1.5*4+6*4+0*12*4)-(20-4*3)/2-3) && mouseX<((SizeX+1.5*4+6*4+0*12*4)+(20-4*3)/2+3) &&
         mouseY>((SizeY+1.5*4+6*4+2*12*4)-(20-4*3)/2-3) && mouseY<((SizeY+1.5*4+6*4+2*12*4)+(20-4*3)/2+3)){
           text("8",mouseX,mouseY);
         }else if(mouseX>=((SizeX+1.5*4+6*4+1*12*4)-(20-5*3)/2-3) && mouseX<=((SizeX+1.5*4+6*4+1*12*4)+(20-5*3)/2+3) &&
         mouseY>=((SizeY+1.5*4+6*4+2*12*4)-(20-5*3)/2-3) && mouseY<=((SizeY+1.5*4+6*4+2*12*4)+(20-5*3)/2+3)){
           text("5",mouseX,mouseY);
         }
    if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+0*12*4-10
      && mouseY<ColorY+1.5*4+6*4+0*12*4+10){
        text("Red",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+0*12*4-10
      && mouseY<ColorY+1.5*4+6*4+0*12*4+10){
        text("Orign",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+1*12*4-10
      && mouseY<ColorY+1.5*4+6*4+1*12*4+10){
        text("Yello",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+1*12*4-10
      && mouseY<ColorY+1.5*4+6*4+1*12*4+10){
        text("Green",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+2*12*4-10
      && mouseY<ColorY+1.5*4+6*4+2*12*4+10){
        text("Blue",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+2*12*4-10
      && mouseY<ColorY+1.5*4+6*4+2*12*4+10){
        text("Indigo",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+3*12*4-10
      && mouseY<ColorY+1.5*4+6*4+3*12*4+10){
        text("Purple",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+1*12*4-10 && mouseX<ColorX+1.5*4+6*4+1*12*4+10 && mouseY>ColorY+1.5*4+6*4+3*12*4-10
      && mouseY<ColorY+1.5*4+6*4+3*12*4+10){
        text("White",mouseX,mouseY);
      }else if(mouseX>ColorX+1.5*4+6*4+0*12*4-10 && mouseX<ColorX+1.5*4+6*4+0*12*4+10 && mouseY>ColorY+1.5*4+6*4+4*12*4-10
      && mouseY<ColorY+1.5*4+6*4+4*12*4+10){
        text("Black",mouseX,mouseY);
      }
  }
}

class Paper{
  int PaperX=30*4;
  int PaperY=0;
  int PaperL=100*4+50*4;
  int PaperW=25*4*6+5*4;
  Paper(){
    strokeWeight(FrameWeight);
    fill(255);
    rect(PaperX,PaperY,PaperL,PaperW);
    strokeWeight(1.5);
    ClickNum=0;
  }
  
  void Draw(int LB_Button,int RB_Size,int RB_Color){
    strokeWeight(Size[RB_Size]);
    fill(Color[RB_Color][0],Color[RB_Color][1],Color[RB_Color][2]);
    if (mouseX>PaperX && mouseX<PaperX+PaperL && mouseY>PaperY && mouseY<PaperY+PaperW){
      if(LB_Button==0){
        //Pen
        stroke(Color[RB_Color][0],Color[RB_Color][1],Color[RB_Color][2]);
        if(mousePressed){
          line(mouseX,mouseY,pmouseX,pmouseY);
        }
        stroke(0,0,0);
      }else if(LB_Button==1){
        //Erase
        stroke(255,255,255);
        if(mousePressed){
          line(mouseX,mouseY,pmouseX,pmouseY);
        }
        stroke(0,0,0);
      }else if(LB_Button==2){
        //Line
      }
      else if(LB_Button==3){
        //Square
      }else if(LB_Button==4){
        //Circle
      }else if(LB_Button==5){
        //shape
      }
    }
  }
}

void mouseClicked(){
  int PaperX=30*4;
  int PaperY=0;
  int PaperL=100*4+50*4;
  int PaperW=25*4*6+5*4;
  strokeWeight(Size[RB_Size]);
  fill(Color[RB_Color][0],Color[RB_Color][1],Color[RB_Color][2]);
  stroke(Color[RB_Color][0],Color[RB_Color][1],Color[RB_Color][2]);
  if (mouseX>PaperX && mouseX<PaperX+PaperL && mouseY>PaperY && mouseY<PaperY+PaperW){
    if(LB_Button==2){
      if(ClickNum==0){
        x1=mouseX;
        y1=mouseY;
        ClickNum++;
      }else{
        line(x1,y1,mouseX,mouseY);
        ClickNum=0;
      }
    }else if(LB_Button==3){
      if(ClickNum==0){
        x1=mouseX;y1=mouseY;ClickNum++;
      }else{
        rect(x1,y1,mouseX-x1,mouseY-y1);
        ClickNum=0;
      }
    }else if(LB_Button==4){
      if(ClickNum==0){
        x1=mouseX;y1=mouseY;ClickNum++;
      }else{
        ellipse(x1,y1,(mouseX-x1)*2,(mouseY-y1)*2);
        ClickNum=0;
      }
    }else if(LB_Button==5){
      if(ClickNum==0){
        x1=mouseX;y1=mouseY;ClickNum++;
      }else{
        line(x1,y1,mouseX,mouseY);
        x1=mouseX;
        y1=mouseY;
      }
    }
  }
  stroke(0,0,0);
}
