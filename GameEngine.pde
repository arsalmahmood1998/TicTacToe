 void playGame() {
  int col = (int)map(mouseX, 0, width, 0, colCount);
  int row = (int)map(mouseY, 0, height, 0, rowCount);
  float xCoord = blockSize.x/2.0 + col*blockSize.x;
  float yCoord = blockSize.y/2.0 + row*blockSize.y;
  char playerSign = 'O';
  if (isPlayerX) {
    playerSign = 'X';
  }
  fill(0);
  textSize(64);
  textAlign(CENTER, CENTER);

  if (isOccupied[row][col] == 'a') {
    text(playerSign, xCoord, yCoord);
    isPlayerX = !isPlayerX;
    isOccupied[row][col] = playerSign;
  }

  char gameResult = didAnyPlayerWin();
  if (gameResult != 'z' && gameResult != 'a') {
    fill(0, 0, 255);
    textSize(50);
    text("Player " + gameResult + " Wins!", width/2, height/2);
    isEnd = true;
  }
}

char didAnyPlayerWin() {
  char result = 'z';
  for (int i=0; i<isOccupied.length; i++) {
    int xCount = 0;
    int oCount = 0;
    for (int j=0; j<isOccupied[i].length; j++) {
      if (isOccupied[i][j] == 'X') {
        xCount++;
      } else if (isOccupied[i][j] == 'O') {
        oCount++;
      }
    }

    if (xCount == colCount) {
      result = 'X';
    } else if (oCount == colCount) {
      result = 'O';
    }
  }

  for (int i=0; i<isOccupied.length; i++) {
    int xCount = 0;
    int oCount = 0;
    for (int j=0; j<isOccupied[i].length; j++) {
      if (isOccupied[j][i] == 'X') {
        xCount++;
      } else if (isOccupied[j][i] == 'O') {
        oCount++;
      }
    }

    if (xCount == colCount) {
      result = 'X';
    } else if (oCount == colCount) {
      result = 'O';
    }
  }

  int xCount = 0;
  int oCount = 0;
  for (int i=0; i<isOccupied.length; i++) {
    if (isOccupied[i][i] == 'X') {
      xCount++;
    } else if (isOccupied[i][i] == 'O') {
      oCount++;
    }
  }
  if (xCount == colCount) {
    result = 'X';
  } else if (oCount == colCount) {
    result = 'O';
  }

  xCount = 0;
  oCount = 0;
  for (int i=0; i<isOccupied.length; i++) {
    if (isOccupied[i][isOccupied.length-1-i] == 'X') {
      xCount++;
    } else if (isOccupied[i][isOccupied.length-1-i] == 'O') {
      oCount++;
    }
  }
  if (xCount == colCount) {
    result = 'X';
  } else if (oCount == colCount) {
    result = 'O';
  }

  return result;
}
