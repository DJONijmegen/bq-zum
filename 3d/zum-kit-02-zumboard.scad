$fn = 90;

drill = 2;

module holes( d = drill ) {
    translate( [  0, 20 ] ) circle( d = d );
    translate( [  0,  0 ] ) circle( d = d );
    translate( [ 20,  0 ] ) circle( d = d );
    translate( [ 20, 20 ] ) circle( d = d );
}

module zum_inside() {
 
    offset( r = 3 ) offset( r = -3 )
        translate( [ 2.5, 0 ] ) square( [ 65.85, 53.5 ] );
    offset( r = 1 ) offset( r = -1 )
        offset( r = -1 ) offset( r = 1 )
            translate( [ 68.3 - 2.5, 4.0 ] )
                union() {
                    square( [ 5.0 , 35.7 ] );
                    translate( [ 0, -1 ] ) square( [ 2.5,  37.7 ] );
                }
    
*    offset( r = 2 ) offset( r = -2 )
        square( [ 66.5, 53.5 ] );
    
    offset( r = 1 ) offset( r = -1 )
        offset( r = -1 ) offset( r = 1 )
        translate( [ 0, 31.0 ] )
            polygon( [
                [ 2.5,  0.0 ],
                [ 0.0,  2.5 ],
                [ 0.0, 17.5 ],
                [ 2.5, 20.0 ],
                [ 2.5, 21.0 ],
                [ 5.0, 21.0 ],
                [ 5.0, -1.0 ],
                [ 2.5, -1.0 ],
                  
 //           [  -2.5, 53.5-  5.0 ],
 //           [   0.0, 53.5-  2.5 ],
 //           [   0.0, 53.5-  2.0 ],
 //           [  66.5, 53.5-  2.0 ],
 //           [  66.5, 53.5- 12.5 ],
 //           [  69.0, 53.5- 12.5 ],
 //           [  69.0, 53.5- 51.0 ],
 //           [  66.5, 53.5- 51.0 ],
 //           [  66.5, 53.5- 51.5 ],
 //           [   0.0, 53.5- 51.5 ],
 //           [   0.0, 53.5- 22.5 ],
 //           [ - 2.5, 53.5- 20.0 ]
            ] );
}

difference() {
    union() {
        difference() {
            linear_extrude( height = 5 ) offset( r = 1 ) zum_inside();
            translate( [ 0, 0, 3 ] ) linear_extrude( height = 5 ) zum_inside();
            
            // clearance 
            translate( [ -5, 3, 4 ] ) cube( [ 10, 10, 10 ] ); 
            translate( [ -5, 20.5, 4 ] ) cube( [ 10, 10, 10 ] );
            translate( [ 14, -5, 4 ] ) cube( [ 14, 10, 10 ] );
            translate( [ 0, 0, 1 ] ) linear_extrude( height = 3 ) offset( r = -1 ) zum_inside();

        }
        hull() linear_extrude( height = 3 ) translate( [ 26.5, 16.5 ] ) holes( d = 5 );
    }
    // holes
    linear_extrude( height = 10 ) translate( [ 26.5, 16.5 ] ) holes();
}
