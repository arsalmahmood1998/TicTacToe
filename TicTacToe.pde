int colCount = 3, rowCount = 3;
PVector blockSize;
boolean isPlayerX;
char[][] isOccupied;
boolean isEnd;

void setup(){
  size(600, 600);
  blockSize = new PVector(width/colCount, height/rowCount);
  isOccupied = new char[rowCount][colCount];
  drawBoardAndSetupGame();
}

void drawBoardAndSetupGame(){
  background(255);
  for(int i=1; i<colCount; i++){
    float xCoord = blockSize.x * i;
    line(xCoord, 0, xCoord, height);
  }
  
  for(int i=1; i<rowCount; i++){
    float yCoord = blockSize.y * i;
    line(0, yCoord, width, yCoord);
  }
  
  for(int i=0; i<isOccupied.length; i++){
    for(int j=0; j<isOccupied[i].length; j++){
      isOccupied[i][j] = 'a';
    }
  }
  isEnd = false;
  isPlayerX = false;
}

void draw(){
}
