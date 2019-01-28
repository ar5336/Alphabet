char[] alphabet;



void setup(){
  size(1080,1920);
  alphabet = new char[]{'A','B','C','D','E','F','G','H','I','J',
                        'K','L','M','N','O','P','Q','R','S','T',
                        'U','V','W','X','Y','Z'};

}

float horMargin = width*.05;
float vertMargin = height*.30;
float rectHeight = height*.10;

void mousePressed(){
  showingCounter = 30;
  if(mouseButton == LEFT){
    //Update();
  }
  startX = mouseX;
}

void Update(){
  int newLetter = (int)random(0,26);
  while(currentLetter == newLetter){
    newLetter = (int)random(0,26);
  }
  currentLetter = newLetter;
}

boolean IsShowing = false;
int showingCounter = 0;
int currentLetter = (int)random(0,26);
int startX = 0;
void draw(){
  float horMargin = width*.05;
  float vertMargin = height*.30;
  float rectHeight = height*.10;
  background(color(250));
  
  //normally, there's just a rectangle with a letter above it.
  //DRAWING LETTER
  textSize(height*.2);
  fill(0, 0, 0);
  text(alphabet[currentLetter],height*.3,height*.25);
  
  //DRAWING RECTANGLE
  strokeWeight(2);
  stroke(color(0));
  fill(color(200));
  rect(horMargin,vertMargin,width - 2*horMargin,rectHeight);
  strokeWeight(1);
  //When the user clicks somewhere, the rectangle is sectioned,
  
  float step = (width-(2*horMargin))/26;
  fill(color(0));
  //line(10,10,40,40);
  showingCounter--;
  if(showingCounter > 0){
    for(int i = 1; i < 26; i++){
      //line(20,20,50,50);
      line(i*3+40,10,i*3+40,20);
      stroke(color(0));
      line(horMargin+step*i,vertMargin,horMargin+step*i,vertMargin+rectHeight);
    }
    //draw line to correct letter
    stroke(color(200,0,0));
    strokeWeight(5);
    line(startX, vertMargin+rectHeight+20, (horMargin+((width - 2*horMargin)/26*currentLetter)) + step/2, vertMargin+rectHeight+20);
    strokeWeight(15);
    line((horMargin+((width - 2*horMargin)/26*currentLetter)) + step/2, vertMargin+rectHeight+20,(horMargin+((width - 2*horMargin)/26*currentLetter)) + step/2, vertMargin+rectHeight+20);
    
    //draw letters above their respective squares
    textSize(30);
    fill(0, 0, 0);
    for(int i = 0; i < 26; i++){
      if(i == currentLetter){
        fill(200, 0, 0);
      } else{
        fill(0, 0, 0);
      }
      text(alphabet[i],(horMargin+((width - 2*horMargin)/26*i))+10, vertMargin-15);
    }
    fill(color(200,150,150));
    stroke(color(0));
    strokeWeight(1);
    rect(horMargin+step*currentLetter,vertMargin,step,rectHeight);
  }else if(showingCounter == 0){
    Update();
  }
  //letters are drawn, the correct letter is highlighted
  //A score is given and is stored.
}