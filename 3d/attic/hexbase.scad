$fn = 90;

module hexbase() {


    difference() {
	cylinder( d = 31, h = 5, $fn = 6 );
	translate( [ -8, -15, 1 ] ) cube( [ 16, 30, 6 ] );
    }

    difference() {
	cylinder( d = 34, h = 7, $fn = 6 );
	translate( [ 0, 0, -.5 ] ) cylinder( d = 31, h = 8, $fn = 6 );
	translate( [ -8, 0, 5 ] ) cube( [ 16, 15, 8 ] );
    }

}

difference() {
    hexbase();
}

