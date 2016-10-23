use <zum_hexmodule.scad>;

$fn  = 90;

difference() {
    zum_hexmodule();
    translate( [ 0, -27.5/2 + 7, 5 ] ) 
        rotate( [ 90, 0, 0 ] )
            cylinder( d = 10, h = 10 );
}