$fn=90;

module post() {
    cylinder( d = 3.0, h = 7 );
}

module zum() {
    difference() {
        cube( [ 73, 56, 7 ] );
        translate( [ 1, 1, 5 ] ) cube( [ 71, 54, 10 ] );
        translate( [ 2, 2, 1 ] ) cube( [ 69, 52, 10 ] );
        translate( [ 41, 50, 6 ] ) cube( [ 12, 10, 10 ] );
        translate( [ 70, 23, 6 ] ) cube( [ 10, 32, 10 ] );
        translate( [ -5, 34, 6 ] ) cube( [ 10, 10, 10 ] );
    }
    cube( [  ] );
}

*zum();

difference() {
    translate( [ 0, 0, -4 ] ) zum();
    translate( [ -5, -5, -10 ] ) cube( [ 100, 100, 10 ] );
}