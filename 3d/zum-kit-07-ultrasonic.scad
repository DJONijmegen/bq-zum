$fn = 90;
drill = 2;

module shape() {
    translate( [ -25, 0, 0 ] ) circle( d = 7 );
    translate( [ 25, 0, 0 ] ) circle( d = 7 );
    hull() {
        translate( [ -27/2, 0 ] ) circle( d = 20 );
        translate( [ 27/2, 0 ] ) circle( d = 20 );
    }
}

module holder() {
    translate( [ -25, 0, 0 ] ) cylinder( d = 7, h = 3 );
    translate( [ 25, 0, 0 ] ) cylinder( d = 7, h = 3 );
    
    translate( [ 0, -40, 3 ] ) 
        difference() {
            rotate( [ -90, 0, 0 ] ) cylinder( d = 27, h = 2 ); 
            translate( [ 0, 0, -10 ] ) cube( [ 30, 10, 14 ], center = true ); 
        }
    difference() {
        union() {
            linear_extrude( height = 5 ) offset( r = 1 ) shape();
            intersection() {
                union() {
                    translate( [ -27/2, -40, 0 ] ) cube( [ 27, 30, 5 ] );
                    translate( [ -27/2, -38, 3 ] ) cube( [ 27, 7.5, 7.5 ] ); 
                }
                translate( [ 0, -40, 3 ] ) rotate( [ -90, 0, 0 ] ) cylinder( d = 27, h = 30 );
            }
        }
        translate( [ 0, 0, 1 ] ) linear_extrude( height = 5 ) shape();
        hull() {
            translate( [ 0, -18, 10.5 ] ) rotate( [ 0, 90, 0 ] ) cylinder( d = 15, h = 50, center = true );
            translate( [ 0, -38+7.5, 10.5 ] ) rotate( [ 0, 90, 0 ] ) cylinder( d = 15, h = 50, center = true );
        }
    }
}

module drill() {
    translate( [ -25, 0, -1 ] ) cylinder( d = drill, h = 5 );
    translate( [ 25, 0, -1 ] ) cylinder( d = drill, h = 5 );
    hull() {
        translate( [ 0, -10, -1 ] ) cylinder( d = 15 , h = 10 ); 
        translate( [ 0, -38+7.5, 9 ] ) cube( [ 15, 15, 20 ], center = true );//cylinder( d = 15 , h = 10 ); 
    }
    translate( [ 0, -40, 3 ] ) 
        rotate( [ -90, 0, 0 ] ) cylinder( d = 4, h = 2 ); 

}

module foot() {
    difference() {
        union() {
            difference() {
                cylinder( d = 30, h = 3 );
                translate( [ 0, 0, 1 ] ) cylinder( d = 27, h = 3 );
            }
            cylinder( h = 3, d = 4 );
        }
        translate( [ 0, 0, -1 ] ) cylinder( h = 10, d = drill );
    }
}
    

module ultrasound() {
    difference() {
        holder();
        drill();
    }
}

ultrasound();
translate( [ 0, 30, 0 ] ) foot();

