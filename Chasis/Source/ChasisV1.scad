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


module Pata() {
 include <pata.scad>
}

lonArm = 40;
grosor = 4;

module Arm() {
difference() {
  hull() {
   translate([ lonArm / 2,0,0]) cylinder(r=12.5,h=grosor,$fn=150, center=true);
   translate([-lonArm / 2,0,0]) cube([25,25,grosor], center=true);
  }
  translate([ lonArm / 2,0, grosor/2]) cylinder(r=10,h=1.5,$fn=150, center=true);
  translate([ lonArm / 2,0,grosor-1.5])   cylinder(r=3 ,h=grosor*3,$fn=150, center=true);
 }
}

// BASE
module base() {

  hull() {
   translate([50,0,0]) cylinder(r=40,h=grosor,$fn=50, center=true);
   translate([-30,0,0]) cylinder(r=40,h=grosor,$fn=50, center=true);
   translate([-70,0,0]) cylinder(r=20,h=grosor,$fn=50, center=true);
  }
  
  

}

module Caderas() {
translate([70,40,0]) rotate([0,0,60]) Arm();
translate([20,40,0]) rotate([0,0,90]) Arm();
translate([-30,40,0]) rotate([0,0,120]) Arm();

translate([70,-40,0]) rotate([0,0,-60]) Arm();
translate([20,-40,0]) rotate([0,0,-90]) Arm();
translate([-30,-40,0]) rotate([0,0,-120]) Arm();
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
  translate([0,0,0]) cube([10,70,grosor], center=true);
  translate([50,0,0]) cube([10,70,grosor], center=true);
  translate([-55,0,0]) cube([10,40,grosor], center=true);
  translate([0,0,0]) cube([100,10,grosor], center=true);
}

module patas() {
 translate([-68,-170,20]) rotate([0,0,70]) Pata();
 translate([ 20,-180,20]) rotate([0,0,90]) Pata();
 translate([130,-160,20]) rotate([0,0,120]) Pata();

 translate([-68, 170,20]) rotate([0,0,-70]) Pata();
 translate([ 20, 180,20]) rotate([0,0,-90]) Pata();
 translate([130, 160,20]) rotate([0,0,-120]) Pata();
}

%translate([0, 0,-3]) cube([200,200,2], center=true);

baseCompleta();
//patas();

