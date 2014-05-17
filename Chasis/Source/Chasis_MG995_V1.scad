/* 
difference() {
  translate([0,0,0]) cylinder(r=40,h=25,$fn=150, center=true);
  translate([0,0,2]) cylinder(r=38,h=25,$fn=150, center=true);

}


lonArm = 40;
grosor = 4;

 difference() {
  hull() {
   translate([ lonArm / 2,0,0]) cylinder(r=12.5,h=grosor,$fn=150, center=true);
   translate([-lonArm / 2,0,0]) cylinder(r=12.5,h=grosor,$fn=150, center=true);
  }
  perforaciones();
 }

module perforaciones() {
 //Horn
 translate([ lonArm / 2,0, grosor/2]) cylinder(r=10,h=1.5,$fn=150, center=true);
 translate([-lonArm / 2,0, grosor/2]) cylinder(r=10,h=1.5,$fn=150, center=true);
 translate([ lonArm / 2,0,grosor-1.5])   cylinder(r=3 ,h=grosor*3,$fn=150, center=true);
 translate([-lonArm / 2,0,grosor-1.5])   cylinder(r=3 ,h=grosor*3,$fn=150, center=true); 
 

}
*/
module ServoG9() {
	color("LightBlue", 0.5) {
		cube([23.5,12.6,16.4]);
		translate([-4.65,0,16.3]) difference() {
			cube([32.8,12.6,2]);
			translate([2.65,6.3,-0.1]) cylinder(r=1,h=3,$fn=45);
			translate([32.8-2.65,6.3,-0.1]) cylinder(r=1,h=3,$fn=45);
		}
		translate([0,0,18.2]) cube([23.5,12.6,4.4]);
		translate([6.3,6.3,22.5]) cylinder(r=6.3,h=4.1,$fn=45);
		translate([6.3,6.3,26.5]) cylinder(r=2.25,h=2.8,$fn=45);
	}
}

module ServoMG995() {
	color("LightBlue", 0.5) {
		cube([40.5,20.0,37.7]);
		translate([-7,0,29.5]) difference() {
			cube([54.0,20.0,2.5]);
			translate([3.55, 14.0, -0.1]) cylinder(r=2,h=6,$fn=45);
			translate([3.55, 6.0, -0.1]) cylinder(r=2,h=6,$fn=45);
			translate([50.55, 14.0, -0.1]) cylinder(r=2,h=6,$fn=45);
			translate([50.55, 6.0, -0.1]) cylinder(r=2,h=6,$fn=45);
		}
		

     translate([10,10,37.0]) cylinder(r=6.0,h=1,$fn=45);
		translate([10,10,38.0]) cylinder(r=3,h=6,$fn=45);
	}
}

module Pata() {
 include <pata.scad>
}

lonArm = 30;
grosor = 3;

module Arm() {
difference() {
  hull() {
   translate([ lonArm / 2,0,0]) cylinder(r=18.5,h=grosor,$fn=150, center=true);
   translate([-lonArm / 2,0,0]) cube([40,40,grosor], center=true);
  }
  translate([ lonArm / 2,0, grosor/2]) cylinder(r=16,h=1.5,$fn=150, center=true);
  translate([ lonArm / 2,0,grosor-1.5])   cylinder(r=3 ,h=grosor*3,$fn=150, center=true);
 }
}

// BASE
module base() {

  hull() {
   translate([50,0,0]) cylinder(r=50,h=grosor,$fn=50, center=true);
   translate([-20,0,0]) cylinder(r=50,h=grosor,$fn=50, center=true);
   translate([-70,0,0]) cylinder(r=20,h=grosor,$fn=50, center=true);
  }
  
  

}

module Caderas() {
translate([70,50,0]) rotate([0,0,60]) Arm();
translate([20,50,0]) rotate([0,0,90]) Arm();
translate([-30,50,0]) rotate([0,0,110]) Arm();

translate([70,-50,0]) rotate([0,0,-60]) Arm();
translate([20,-50,0]) rotate([0,0,-90]) Arm();
translate([-30,-50,0]) rotate([0,0,-110]) Arm();
}


module baseCompleta() {
 difference() {
  union(){base(); Caderas(); }
  scale([0.6,0.8,1.2]) base();
  translate([70,40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([70,-40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([20,40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([20,-40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([-30,40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([-30,-40,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
 
  translate([-65,20,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
  translate([-65,-20,0]) cylinder(r=1,7,h=grosor*3,$fn=50, center=true);
 }
  translate([0,0,0]) cube([10,90,grosor], center=true);
  translate([55,0,0]) cube([10,70,grosor], center=true);
  translate([-55,0,0]) cube([10,40,grosor], center=true);
  translate([0,0,0]) cube([120,10,grosor], center=true);
}

module patas() {
 translate([-71,-160,43]) rotate([0,0,70]) Pata();
 translate([ 18,-167,43]) rotate([0,0,90]) Pata();
 translate([130,-150,43]) rotate([0,0,120]) Pata();

 translate([-71, 160,43]) rotate([0,0,-70]) Pata();
 translate([ 18, 167,43]) rotate([0,0,-90]) Pata();
 translate([130, 150,43]) rotate([0,0,-120]) Pata();
}

//%translate([0, 0,-3]) cube([200,200,2], center=true);

baseCompleta();
patas();
translate([0, 0,43]) baseCompleta();
