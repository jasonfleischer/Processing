//Jason Fleischer
var numOfSpokes = 100;
var t =0;
var flip = true;

function setup(){
	var dim = 600;
	canvas = createCanvas(dim,dim);
	canvas.parent('content');
	document.getElementById("content").style.width = dim+"px";
	smooth();
	noStroke();
	mouseX=width/2;
	mouseY=height/2;
}

function draw(){
  
  t=t+0.01;
  if(flip){
    numOfSpokes--;
    if(numOfSpokes<50){
      flip = !flip;
    }
  }else{
    numOfSpokes++;
    if(numOfSpokes>150){
      flip = !flip;
    }
  }
  
  var c = color(noise(t)*255,noise(t+6)*255,noise(t+12)*255);
  colorMode(RGB);
  fill(c);
  colorMode(HSB);
  background(hue(c),saturation(c),brightness(c)+30); 
  
  push();
  translate(width/2, height/2);
  drawStar(numOfSpokes);
  pop();
  
  push();
  translate(constrain(mouseX, width/3, width*2/3), constrain(mouseY, height/3, height*2/3));
  rotate(TWO_PI * frameCount/800);
  drawStar(100);
  pop();
}

function drawStar(numSpokes){
  for(var i=0;i<numSpokes; i++){
    var t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
    var t1 = t0 + (TWO_PI/(2*numSpokes));
    arc(0,0,width*2,width*2,t0,t1);
  }
}
