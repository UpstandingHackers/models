// This is all licensed as CC-BY-SA. See COPYING for details
// Note: these haven't been certified or anything. But they look about right

$fa = 1;
wall_thickness = 2;

// Units: mm
module schucko() {
  // results: origin is top min(x,y) corner
  // DIN 49440-1
  difference() {
    union() {
      translate(v=[0,0,-wall_thickness])
	cube(size=[(19.5 + wall_thickness) * 2, (19.5 + wall_thickness) * 2, wall_thickness]);
      translate(v=[19.5 + wall_thickness, 19.5 + wall_thickness,-17.5 - wall_thickness])
	cylinder(r=19.5 + wall_thickness, h=17.5 + wall_thickness);
    }
    
    
    translate(v=[21,21,-17.5]) {
      union() {
	intersection() {
	  cylinder(r=19.5, h=18);
	  union() {
	    cube(size = [33.5, 40, 70], center=true); // z=35, because we go way out the top
	    cube(size = [40, 5.5, 70], center = true);
	    translate(v=[0,0,17.5]) {
	      cube(size = [40, 40, 7.5], center = true);
	    }
	  }
	}
	// The holes
	translate(v=[-9.5,0,-20]) {
	  cylinder(r=2.75, h=21);
	}
	translate(v=[9.5,0,-20]) {
	  cylinder(r=2.75, h=21);
	}
	// The side bits...
	translate(v=[0,0,7.5]) {
	  cube(size=[2.3, 45, 15], center=true);
	}
	translate(v=[0,20,0]) {
	  cube(size=[2.3, 3, 4], center=true);
	}
	translate(v=[0,-20,0]) {
	  cube(size=[2.3, 3, 4], center=true);
	}
      }
    }
  }
}

module europlug() {
  translate(v=[19.5 + wall_thickness,8.5,0]) {
    difference() {
      union() {
	translate(v=[0,0,wall_thickness / 2])
	  cube(size=[(19.5 + wall_thickness) * 2, (17.5 + wall_thickness * 2), wall_thickness], center=true);
	//	cube(42, 17.5, 17.5);
	translate(v=[0,0,-8.75]) {
	  intersection() {
	    cube(size=[(19.5 + wall_thickness) * 2, 15.5 + wall_thickness * 2, 17.5], center=true);
	    rotate(a=[0,0,45])
	      cube(size=[30,28.5 + wall_thickness * 2,17.5], center=true);
	  }
	}
      }
      translate(v=[0,0,-6.5]) {
	intersection() {
	  cube(size=[42, 15.5, 18], center=true);
	  rotate(a=[0,0,45])
	    cube(size=[28.5, 28.5, 18], center=true);
	}
      }
      // The holes
      translate(v=[-9.5,0,-35]) {
	cylinder(r=2.75, h=21);
      }
      translate(v=[9.5,0,-35]) {
	cylinder(r=2.75, h=21);
      }
      
    }
  }
}

difference() {
  union() {
    
    schucko();
    
    translate(v=[0, 50, -2]) { // 45 is lined up.
      europlug();
    }
  }

  //cube(size=[42,160,160], center=true);
}
