// zum module 1
// hexagonal module

$fn = 90;
drill = 2;

module holes() {
    translate( [ -10, 0, -1 ] ) cylinder( d = drill, h = 11 );
    translate( [ 10, 0, -1 ] ) cylinder( d = drill, h = 11 );
}

module hexagon( h = 27.5 ) {
    ri = h/2;
    ro = ri / ( 0.5 * sqrt(3) );
    polygon( [
        [ -ro, 0 ],
        [ -ro/2, ri ],
        [ ro/2, ri ],
        [ ro, 0 ],
        [ ro/2, -ri ],
        [ -ro/2, -ri ]
    ] );
}

module zum_hexmodule_clearance( h = 27.5 ) {
    ri = h/2;
    ro = ri / ( 0.5 * sqrt(3) );
    translate( [ -ro/2, -ri, -2 ] ) cube( [ ro, ri * 2, 2 ] );
    translate( [ -ro/2, ri/2, 1 ] ) cube( [ ro, ri, 8 ] );
    translate( [ -12/2, -h/2, -10 ] ) cube( [ 12, 8, 11 ] );
    translate( [ -40/2, -27.5/2-2, -12 ] ) cube( [ 40, 12, 10 ] );
}

module zum_hexmodule() {
    difference() {
        linear_extrude( height = 12 ) offset( r = 1 ) hexagon();
        translate( [ 0, 0, 12-2 ] ) {
            linear_extrude( height = 5 ) hexagon();
            zum_hexmodule_clearance();
        }
        holes();
    }
}

zum_hexmodule();

