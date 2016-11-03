// zum module 1
// hexagonal module

$fn = 90;
$drill = 2;

module holes( d = 20 ) {
    translate( [ -d/2, 0 ] ) circle( d = $drill );
    translate( [ d/2, 0  ] ) circle( d = $drill );
}

module hexagon( 
    h = 26.5,
    ccw = 26.5,
    cw = 26.5,
) {
    intersection() {
        square( [ ccw + cw, h ], center = true );
        rotate( 60 ) square( [ h + cw, ccw ], center = true );
        rotate( -60 ) square( [ h + ccw, cw ], center = true );
    }   
}

module zum_hexmodule(
    h = 26,
    ccw = 26,
    cw = 26,
    d = 20
) {
    difference() {
        union() {
            difference() {
                linear_extrude( height = 5 ) offset( r = 1 ) hexagon( h, ccw, cw );
                translate( [ 0, 0, 1 ] )
                    linear_extrude( height = 5 ) offset( r = -1 ) hexagon( h, ccw, cw );
                translate( [ 0, 0, 3 ] )
                    linear_extrude( height = 5 ) hexagon( h, ccw, cw ); 
            }
            linear_extrude( height = 3 ) offset( r = ( 6 - $drill ) /2 ) holes( d );
        }
        linear_extrude( height = 5 ) holes( d );
        translate( [ -ccw / 4, 0, 4 ] ) cube( [ ccw / 2, h / 2 + 5, 5 ] ); 
    }
}

*zum_hexmodule(
    h = 26,
    ccw = 26,
    cw = 26,
    d = 20
);

*zum_hexmodule(
    h = 26.5,
    ccw = 36.25,
    cw = 36.25,
    d = 32
);

zum_hexmodule(
    h = 36.15,
    ccw = 38.25,
    cw = 38.25,
    d = 32
);
