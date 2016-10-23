$fn = 90;
drill = 2;

module holes() {
    
    y = 33.8 - 2.5;
    x = 77.6 - 2.5;
    translate( [ -x/2, y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ x/2, y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ x/2, -y/2, -1 ] ) cylinder( d = drill, h = 10 );
    translate( [ -x/2, -y/2, -1 ] ) cylinder( d = drill, h = 10 );
}

module rectangle( x = 80, y = 36, offset = 0 ) {
    translate( [ offset, 0 ] ) polygon( [
        [ -x/2, -y/2 ],
        [ -x/2,  y/2 ],
        [ x/2, y/2 ],
        [ x/2, -y/2 ]
    ] );
}

module clearance() {
    translate( [ -70/2, -25/2, -7 ] ) cube( [ 70, 25, 8 ] );
    translate( [ 80/2-9, -10, -4 ] ) cube( [ 10, 20, 8 ] );
    
    translate( [ -80/2 + 6, -36/2, -2 ] ) cube( [ 42, 10, 8 ] ); 
}

module frame() {
    difference() {
        linear_extrude( height = 8 ) offset( r = 1 ) rectangle( x = 81, offset = 0.5 );
        translate( [ 0, 0, 6 ] ) {
            linear_extrude( height = 8 ) rectangle();
            clearance();
        }
        holes();
        translate( [ -45, 0, 4 ] ) rotate( [ 0, 90, 0 ] ) cylinder( d = 4, h = 90 );
    }
}


module stand() {
    cylinder( d = 4, h = 4 );
    cylinder( d = 5, h = 3 );
    
    difference() {
        linear_extrude( height = 5 ) {
            offset( r = -5 ) offset( r = 5 ) { 
                polygon( [
                    [ 2.5, 0 ],
                    [ 2.5, -27 ],
                    [ 15, -27 ],
                    [ 15, -30 ],
                    [ -15, -30 ],
                    [ -15, -27 ],
                    [ -2.5, -27 ],
                    [ -2.5, 0 ]
                ] );
            }
        }
 
        hull() {
            translate( [ 0, 0, 8 ] ) 
                rotate( [ 0, 90, 0 ] ) 
                    cylinder( r = 5, h = 10, center = true );
            translate( [ 0, -20, 8 ] ) 
                rotate( [ 0, 90, 0 ] ) 
                    cylinder( r = 5, h = 10, center = true );
        }
      
        translate( [ -15 + 2.5, -33, 2.5 ] ) rotate( [ -90, 0, 0 ] ) cylinder( d = drill, h = 10 );
        translate( [ 15 - 2.5, -33, 2.5 ] ) rotate( [ -90, 0, 0 ] ) cylinder( d = drill, h = 10 );
        translate( [ -10 + 2.5, -33, 2.5 ] ) rotate( [ -90, 0, 0 ] ) cylinder( d = 4, h = 5 );
        translate( [ 10 - 2.5, -33, 2.5 ] ) rotate( [ -90, 0, 0 ] ) cylinder( d = 4, h = 5 );
    }

}

module foot() {
    difference() {
        translate( [ -( 81+6 )/2, -30/2, 0 ] ) cube( [ 81 + 6, 30, 1 ] );
        hull() {
            translate( [ -20, 0, 0 ] ) cylinder( d = 20, h = 2 );
            translate( [ 20, 0, 0 ] ) cylinder( d = 20, h = 2 );
        }
        translate( [ 81/2 + 3 - 2.5, -12.5, 0 ] ) cylinder( d = drill, h = 2 );
        translate( [ 81/2 + 3 - 2.5, 12.5, 0 ] ) cylinder( d = drill, h = 2 );
        translate( [ -81/2 - 3 + 2.5, -12.5, 0 ] ) cylinder( d = drill, h = 2 );
        translate( [ -81/2 - 3 + 2.5, 12.5, 0 ] ) cylinder( d = drill, h = 2 );
    }
    translate( [ 81/2 + 3 - 2.5, -7.5, 0 ] ) cylinder( d = 4, h = 2 );
    translate( [ 81/2 + 3 - 2.5, 7.5, 0 ] ) cylinder( d = 4, h = 2 );
    translate( [ -81/2 - 3 + 2.5, -7.5, 0 ] ) cylinder( d = 4, h = 2 );
    translate( [ -81/2 - 3 + 2.5, 7.5, 0 ] ) cylinder( d = 4, h = 2 );
}

translate( [ 0, 25, 0 ] ) frame();
translate( [ -20, 0, 0 ] ) stand();
translate( [ 20, 0, 0 ] ) stand();
translate( [ 0, -50, 0 ] ) foot();