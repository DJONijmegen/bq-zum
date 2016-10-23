$fn = 90;
drill = 2;


module holes() {
    
    y = 23.5;
    x = 49.5;
    translate( [ -x/2, y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ x/2, y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ x/2, -y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ -x/2, -y/2, -1 ] ) cylinder( d = drill, h = 10 );
}

module rectangle( x = 55, y = 29 ) {
    polygon( [
        [ -x/2, -y/2 ],
        [ -x/2,  y/2 ],
        [ x/2, y/2 ],
        [ x/2, -y/2 ]
    ] );
}

module clearance( x = 45, y = 27 ) {
    difference() {
        translate( [ -x/2, -y/2, -2 ] ) cube( [ x, y, 2 ] );
        translate( [ 0, 14.5/2, -2 ] ) cylinder( d = 8, h = 2 );
        hull() {
            translate( [ -14.5, 14.5/2, -2 ] ) cylinder( d = 8, h = 2 );
            translate( [ -14.5, -14.5/2, -2 ] ) cylinder( d = 8, h = 2 );
        }
        hull() {
            translate( [ 14.5, 14.5/2, -2 ] ) cylinder( d = 8, h = 2 );
            translate( [ 14.5, -14.5/2, -2 ] ) cylinder( d = 8, h = 2 );
        }
    }
    translate( [ -5, -y/2-5, 1 ] ) cube( [ 10, 10, 8 ] );
}

difference() {
    linear_extrude( height = 5 ) offset( r = 1 ) rectangle();
    translate( [ 0, 0, 3 ] ) {
        linear_extrude( height = 5 ) rectangle();
        clearance();
    }
    holes();
}
