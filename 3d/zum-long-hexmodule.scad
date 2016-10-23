// zum module 1
// hexagonal module

$fn = 90;
drill = 2;

module holes() {
    d = 32;
    translate( [ -d/2, 0, -1 ] ) cylinder( d = drill, h = 11 );
    translate( [ d/2, 0, -1 ] ) cylinder( d = drill, h = 11 );
}

module hexagon( ) {
    h = 27;
    b = 36.5;
    
    intersection() {
        square( [ 100, h ], center = true );
        rotate( 60 ) square( [ 100, b ], center = true );
        rotate( -60 ) square( [ 100, b ], center = true );
    }
    
}

module zum_hexmodule_clearance( h = 27 ) {
    ri = h/2;
    ro = ri / ( 0.5 * sqrt(3) );
    translate( [ -ro/2, -ri, -2 ] ) cube( [ ro, ri * 2, 2 ] );
    translate( [ -ro/2, ri/2, 1 ] ) cube( [ ro, ri, 8 ] );
    
    intersection () {
        translate( [ 0, 0, -3 ] ) linear_extrude( height = 15 ) hexagon();
        translate( [ -13, -10, -2 ] ) cylinder( d = 8, h = 10 );
    }
}

module zum_hexmodule() {
    difference() {
        linear_extrude( height = 5 ) offset( r = 1 ) hexagon();
        translate( [ 0, 0, 3 ] ) {
            linear_extrude( height = 5 ) hexagon();
            zum_hexmodule_clearance();
        }
        holes();
    }
}

zum_hexmodule();

