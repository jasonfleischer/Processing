void setup(){
  size(600,400);
  noStroke();
  frameRate(2);
  handleBox(0,0,600,400,128);
}
void handleBox(float ulx, float uly, float wid, float hgt, int gray){
  fill(color(noise(hgt)*255, noise(wid)*255, noise(uly)*255));
  if(random(1)>0.5)
    rect(ulx,uly, wid, hgt);
  //else
   // ellipse(ulx,uly, wid, hgt);
  int minSide = 20;
  if((wid<minSide)||(hgt<minSide)){
    return;
  }
  if(wid>hgt){
    float wid2 = wid * random(0.25, 0.75);
    handleBox(ulx,uly,wid2,hgt,gray-10);
    handleBox(ulx+wid2,uly,wid-wid2,hgt,gray+10);
  }else{
    float hgt2 = hgt * random(0.25, 0.75);
    handleBox(ulx,uly,wid,hgt2,gray-10);
    handleBox(ulx,uly+hgt2,wid,hgt-hgt2,gray+10);
  }
}