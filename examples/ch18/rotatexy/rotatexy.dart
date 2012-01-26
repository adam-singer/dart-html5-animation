#import('dart:html');
#import('../../include/utilslib.dart', prefix:'utilslib');
#source('../classes/ball3d.dart');

class rotatexy {

  rotatexy() {
  }

  void run() {
    CanvasElement canvas = document.query('#canvas');
    var context = canvas.getContext('2d');
    var mouse = utilslib.Utils.captureMouse(canvas);
    var balls = [],
        numBalls = 50,
        fl = 250,
        vpX = canvas.width / 2,
        vpY = canvas.height / 2,
        angleX = 0, 
        angleY = 0;
    
    for (var ball, i = 0; i < numBalls; i++) {
      ball = new Ball3d.withRadius(15);
      ball.xpos = Math.random() * 200 - 100;
      ball.ypos = Math.random() * 200 - 100;
      ball.zpos = Math.random() * 200 - 100;
      balls.add(ball);
    }
    
    matrixMultiply (matrixA, matrixB) {
      var result = [];
      result.add( matrixA[0] * matrixB[0][0] +
                  matrixA[1] * matrixB[1][0] +
                  matrixA[2] * matrixB[2][0]);

      result.add( matrixA[0] * matrixB[0][1] +
                  matrixA[1] * matrixB[1][1] +
                  matrixA[2] * matrixB[2][1]);

      result.add( matrixA[0] * matrixB[0][2] +
                  matrixA[1] * matrixB[1][2] +
                  matrixA[2] * matrixB[2][2]);
      return result;
    }
    
    rotateX (ball, angle) {                      
      var position = [ball.xpos, ball.ypos, ball.zpos],
          sin = Math.sin(angle),
          cos = Math.cos(angle),
          xRotMatrix = [];
      
      xRotMatrix.add([1,    0,   0]);
      xRotMatrix.add([0,  cos, sin]);
      xRotMatrix.add([0, -sin, cos]);
      
      var result = matrixMultiply(position, xRotMatrix);
      ball.xpos = result[0];
      ball.ypos = result[1];
      ball.zpos = result[2];
    }
    
    rotateY (ball, angle) {
      var position = [ball.xpos, ball.ypos, ball.zpos],
          sin = Math.sin(angle),
          cos = Math.cos(angle),
          yRotMatrix = [];
      
      yRotMatrix.add([ cos, 0, sin]);
      yRotMatrix.add([   0, 1,   0]);
      yRotMatrix.add([-sin, 0, cos]);
      
      var result = matrixMultiply(position, yRotMatrix);
      ball.xpos = result[0];
      ball.ypos = result[1];
      ball.zpos = result[2];
    }



    setPerspective (ball) {
      if (ball.zpos > -fl) {
        var scale = fl / (fl + ball.zpos);
        ball.scaleX = ball.scaleY = scale;
        ball.x = vpX + ball.xpos * scale;
        ball.y = vpY + ball.ypos * scale;
        ball.visible = true;
      } else {
        ball.visible = false;
      }
    }

    move (ball) {
      rotateX(ball, angleX);
      rotateY(ball, angleY);
      setPerspective(ball);
    }

    zSort (a, b) {
      return (b.zpos - a.zpos);
    }
    
    draw (ball) {
      if (ball.visible) {
        ball.draw(context);
      }
    }

    drawFrame(int t) {
      document.window.webkitRequestAnimationFrame(drawFrame, canvas);
      context.clearRect(0, 0, canvas.width, canvas.height);

      angleX = (mouse.y - vpY) * 0.001;
      angleY = (mouse.x - vpX) * 0.001;
      balls.forEach(move);
      balls.sort(zSort);
      balls.forEach(draw);
    
    }
    drawFrame(0);
    
  }
}

void main() {
  new rotatexy().run();
}
