import processing.serial.*;
import apsync.*;
AP_Sync streamer;

public int dispenseGif;
public String distance;
public String lastPercent;

PFont font1;
PFont font2;
PFont font3;
//image + gif found here: https://lottiefiles.com/34218-loading-42-sanitizer
PImage purell;
PImage[] gif = new PImage[85];
String txt1 = "Place hand under dispenser";
String txt2 = "Dispensing in progress...";
String txt3 = "100% of sanitizer left";
String activeTxt = "Active";

void setup() 
{
  size(1000, 800);
  streamer = new AP_Sync(this, Serial.list() [2], 9600);
  rectMode(CENTER);
  rect(width/2, height/2, 800, 400);
  rect(width/2, height/2, 200, 50);
  font1 = loadFont("Inter-MediumItalic-16.vlw");
  font2 = loadFont("Inter-SemiBold-26.vlw");
  font3 = loadFont("Inter-Bold-12.vlw");
  //great reference I found to use gifs: http://www.science.smith.edu/dftwiki/index.php/Processing_Tutorial_--_Showing_Animated_Gifs
  purell = loadImage( "purell.png" );
  gif[0] = loadImage( "frame_00_delay-0.02s.gif" );
  gif[1] = loadImage( "frame_01_delay-0.02s.gif" );
  gif[2] = loadImage( "frame_02_delay-0.02s.gif" );
  gif[3] = loadImage( "frame_03_delay-0.02s.gif" );
  gif[4] = loadImage( "frame_04_delay-0.02s.gif" );
  gif[5] = loadImage( "frame_05_delay-0.02s.gif" );
  gif[6] = loadImage( "frame_06_delay-0.02s.gif" );
  gif[7] = loadImage( "frame_07_delay-0.02s.gif" );
  gif[8] = loadImage( "frame_08_delay-0.02s.gif" );
  gif[9] = loadImage( "frame_09_delay-0.02s.gif" );
  gif[10] = loadImage( "frame_10_delay-0.02s.gif" );
  gif[11] = loadImage( "frame_11_delay-0.02s.gif" );
  gif[12] = loadImage( "frame_12_delay-0.02s.gif" );
  gif[13] = loadImage( "frame_13_delay-0.02s.gif" );
  gif[14] = loadImage( "frame_14_delay-0.02s.gif" );
  gif[15] = loadImage( "frame_15_delay-0.02s.gif" );
  gif[16] = loadImage( "frame_16_delay-0.02s.gif" );
  gif[17] = loadImage( "frame_17_delay-0.02s.gif" );
  gif[18] = loadImage( "frame_18_delay-0.02s.gif" );
  gif[19] = loadImage( "frame_19_delay-0.02s.gif" );
  gif[20] = loadImage( "frame_20_delay-0.02s.gif" );
  gif[21] = loadImage( "frame_21_delay-0.02s.gif" );
  gif[22] = loadImage( "frame_22_delay-0.02s.gif" );
  gif[23] = loadImage( "frame_23_delay-0.02s.gif" );
  gif[24] = loadImage( "frame_24_delay-0.02s.gif" );
  gif[25] = loadImage( "frame_25_delay-0.02s.gif" );
  gif[26] = loadImage( "frame_26_delay-0.02s.gif" );
  gif[27] = loadImage( "frame_27_delay-0.02s.gif" );
  gif[28] = loadImage( "frame_28_delay-0.02s.gif" );
  gif[29] = loadImage( "frame_29_delay-0.02s.gif" );
  gif[30] = loadImage( "frame_30_delay-0.02s.gif" );
  gif[31] = loadImage( "frame_31_delay-0.02s.gif" );
  gif[32] = loadImage( "frame_32_delay-0.02s.gif" );
  gif[33] = loadImage( "frame_33_delay-0.02s.gif" );
  gif[34] = loadImage( "frame_34_delay-0.02s.gif" );
  gif[35] = loadImage( "frame_35_delay-0.02s.gif" );
  gif[36] = loadImage( "frame_36_delay-0.02s.gif" );
  gif[37] = loadImage( "frame_37_delay-0.02s.gif" );
  gif[38] = loadImage( "frame_38_delay-0.02s.gif" );
  gif[39] = loadImage( "frame_39_delay-0.02s.gif" );
  gif[40] = loadImage( "frame_40_delay-0.02s.gif" );
  gif[41] = loadImage( "frame_41_delay-0.02s.gif" );
  gif[42] = loadImage( "frame_42_delay-0.02s.gif" );
  gif[43] = loadImage( "frame_43_delay-0.02s.gif" );
  gif[44] = loadImage( "frame_44_delay-0.02s.gif" );
  gif[45] = loadImage( "frame_45_delay-0.02s.gif" );
  gif[46] = loadImage( "frame_46_delay-0.02s.gif" );
  gif[47] = loadImage( "frame_47_delay-0.02s.gif" );
  gif[48] = loadImage( "frame_48_delay-0.02s.gif" );
  gif[49] = loadImage( "frame_49_delay-0.02s.gif" );
  gif[50] = loadImage( "frame_50_delay-0.02s.gif" );
  gif[51] = loadImage( "frame_51_delay-0.02s.gif" );
  gif[52] = loadImage( "frame_52_delay-0.02s.gif" );
  gif[53] = loadImage( "frame_53_delay-0.02s.gif" );
  gif[54] = loadImage( "frame_54_delay-0.02s.gif" );
  gif[55] = loadImage( "frame_55_delay-0.02s.gif" );
  gif[56] = loadImage( "frame_56_delay-0.02s.gif" );
  gif[57] = loadImage( "frame_57_delay-0.02s.gif" );
  gif[58] = loadImage( "frame_58_delay-0.02s.gif" );
  gif[59] = loadImage( "frame_59_delay-0.02s.gif" );
  gif[60] = loadImage( "frame_60_delay-0.02s.gif" );
  gif[61] = loadImage( "frame_61_delay-0.02s.gif" );
  gif[62] = loadImage( "frame_62_delay-0.02s.gif" );
  gif[63] = loadImage( "frame_63_delay-0.02s.gif" );
  gif[64] = loadImage( "frame_64_delay-0.02s.gif" );
  gif[65] = loadImage( "frame_65_delay-0.02s.gif" );
  gif[66] = loadImage( "frame_66_delay-0.02s.gif" );
  gif[67] = loadImage( "frame_67_delay-0.02s.gif" );
  gif[68] = loadImage( "frame_68_delay-0.02s.gif" );
  gif[69] = loadImage( "frame_69_delay-0.02s.gif" );
  gif[70] = loadImage( "frame_70_delay-0.02s.gif" );
  gif[71] = loadImage( "frame_71_delay-0.02s.gif" );
  gif[72] = loadImage( "frame_72_delay-0.02s.gif" );
  gif[73] = loadImage( "frame_73_delay-0.02s.gif" );
  gif[74] = loadImage( "frame_74_delay-0.02s.gif" );
  gif[75] = loadImage( "frame_75_delay-0.02s.gif" );
  gif[76] = loadImage( "frame_76_delay-0.02s.gif" );
  gif[77] = loadImage( "frame_77_delay-0.02s.gif" );
  gif[78] = loadImage( "frame_78_delay-0.02s.gif" );
  gif[79] = loadImage( "frame_79_delay-0.02s.gif" );
  gif[80] = loadImage( "frame_80_delay-0.02s.gif" );
  gif[81] = loadImage( "frame_81_delay-0.02s.gif" );
  gif[82] = loadImage( "frame_82_delay-0.02s.gif" );
  gif[83] = loadImage( "frame_83_delay-0.02s.gif" );
  gif[84] = loadImage( "frame_84_delay-0.02s.gif" );
}


void draw()
{
  background(220, 221, 225);
  //first rectangle
  fill(248, 248, 248);
  strokeWeight(0);
  stroke(200, 200, 200);
  rect(500, 400, 650, 650, 20);
  
  fill(255, 255, 255);
  rect(500, 152, 650, 152, 20, 20, 0, 0);
  strokeWeight(4);
  
  //second rectangle
  fill(239, 241, 246);
  strokeWeight(2);
  stroke(239, 241, 246);
  rect(500, 400, 400, 80, 100);
  
  //active background
  fill(227, 246, 231);
  strokeWeight(0);
  rect(223, 250, 74, 22, 50);
  
  //active
  fill(116, 190, 133);
  noStroke();
  ellipse(200, 250, 6, 6);
  textFont(font3, 12);
  text(activeTxt, 230, 250, 100, 500);
  
  //distance
  fill(150, 150, 150);
  textFont(font3, 12);
  text(distance, 768, 250, 100, 500);
  
  //display if sanitizer is dispensed
  if(dispenseGif == 1) {
  image(gif[frameCount%85], 450, 85, 80, 80);
  textFont(font1, 16);
  textSize(16);
  fill(100, 100, 100);
  textAlign(CENTER,TOP);
  text(txt2, width/2, height/2, 800, 450);
  }
  
  else {
  //images under text
  //placeholder when not dispensed
  image(purell, 450, 85, 80, 80);
  textFont(font1, 16);
  textSize(16);
  fill(100, 100, 100);
  textAlign(CENTER, TOP);
  text(txt1, width/2, height/2, 800, 450);
}

  if (lastPercent != null) {
  textFont(font2, 26);
  textSize(26);
  fill(86, 113, 145);
  textAlign(CENTER, CENTER);
  text(lastPercent, width/2, height/2, 800, 100);
  }
}
