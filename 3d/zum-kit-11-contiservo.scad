$fn = 90;
drill = 2;

module holes( d = drill ) {

    x = ( 20 + 5 + 6 ) / 2;
    y = ( 40.0 - 5 ) / 2;

    translate( [ -x, -y ] ) circle( d = d );
    translate( [  x, -y ] ) circle( d = d );
    translate( [ -x,  y ] ) circle( d = d );
    translate( [  x,  y ] ) circle( d = d );
}

module servo() {
    difference() {
        union() {
            translate( [ -19/2, -7.5, 0 ] ) cube( [ 19, 56, 2.51 ] );
            translate( [ -20/2, 0, -29 ] ) cube( [ 20, 41 + 2, 40 ] );
            translate( [ 0, 31, 0 ] ) cylinder( d = 6, h = 16 );
        }
      *  translate( [ -5, -4, -1 ] ) cylinder( d = 4, h = 4 ); 
      *  translate( [  5, -4, -1 ] ) cylinder( d = 4, h = 4 ); 
      *  translate( [ -5, 45, -1 ] ) cylinder( d = 4, h = 4 ); 
      *  translate( [  5, 45, -1 ] ) cylinder( d = 4, h = 4 ); 
    }
}

module foot() {
    linear_extrude( height = 2 ) {
        difference() {
            hull() {
                holes( d = 5 );
            }
        holes();
        }
    }
}

module holder() {
    difference() {
        union() {
            foot();
            translate( [ -( 20+6 )/2, -12, 0 ] ) 
                cube( [ 20+6, 31.5, 41 + 15 + 2  ] );
        }
        translate( [ 0, -12+2.5 , 7.5 ] ) rotate( [ 90, 0, 0 ] ) {
            servo();
            translate( [ -5, 45, -5 ] ) cylinder( d = drill, h = 7 ); 
            translate( [  5, 45, -5 ] ) cylinder( d = drill, h = 7 ); 
        }
        hull() {
            translate( [ 0, 31.5 - 12, 31.5 - 5 + 2 ] ) {
                rotate( [ 0, 90, 0 ] ) cylinder( r = 31.5-5, h = 50, center = true );
            }
            translate( [ 0, 31.5 - 12, 41 + 15 + 2 ] ) {
                rotate( [ 0, 90, 0 ] ) cylinder( r = 31.5-5, h = 50, center = true );
            }
        }
    }
} 

holder();