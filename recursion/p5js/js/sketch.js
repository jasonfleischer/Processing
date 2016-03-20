// Jason Fleischer

var t = 0;
var vert = 2;
var horz = 2;
var stop = true;

function setup(){
  var dim = 600;
	canvas = createCanvas(dim,dim);
	canvas.parent('content');
	document.getElementById("content").style.width = dim+"px";
	background(0);
	fill(255);
	stroke(255);
	frameRate(24);
}

function draw() {
  background(0);
  if (!stop) {
    t=t+1;
    vert = (vert+1);
    if (vert>9) {
      vert = 2;
    }
    horz = (horz+1);
    if (horz>5) {
      horz = 2;
    }
  }
  translate(width/2, height/2);
  recurse(0, 0, height/2);
}

function recurse(p1, p2, d) {
  if (d < 4) {
    return;
  }
  fillRainbow(0, 2, 4, 127, 128);
  //down
  line(p1, p2, p1, p2+d);
  recurse((p1+p1)/2, (p2+p2+d)/2, d/vert);
  //up
  line(p1, p2, p1, p2-d);
  recurse((p1+p1)/2, (p2+p2-d)/2, d/vert);
  //right
  line(p1, p2, p1+d, p2);
  recurse((p1+p1+d)/2, (p2+p2)/2, d/horz);
  //left
  line(p1, p2, p1-d, p2);
  recurse((p1+p1-d)/2, (p2+p2)/2, d/horz);
}

//rainbow
var frequency = 0.07;
var red, blue, green;
var i=0;
function fillRainbow(phase1, phase2, phase3, center, wdth) {
  i=i-0.1;
  red   = sin(frequency*i + phase1) * wdth + center;
  green = sin(frequency*i + phase2) * wdth + center;
  blue  = sin(frequency*i + phase3) * wdth + center;
  stroke(red, green, blue);
}

function mousePressed() {
  stop = !stop;
}