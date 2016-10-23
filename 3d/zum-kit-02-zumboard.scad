$fn = 90;

drill = 2;

module holes( d = drill ) {
    translate( [  0, 20 ] ) circle( d = d );
    translate( [  0,  0 ] ) circle( d = d );
    translate( [ 20,  0 ] ) circle( d = d );
    translate( [ 20, 20 ] ) circle( d = d );
}

module zum_inside() {
   
    offset( r = 2 ) offset( r = -2 )
        square( [ 66.5, 53.5 ] );
    
    offset( r = 1 ) offset( r = -1 )
        offset( r = -1 ) offset( r = 1 )
    
            polygon( [
            [ - 2.5, 53.5-  5.0 ],
            [   0.0, 53.5-  2.5 ],
            [   0.0, 53.5-  2.0 ],
            [  66.5, 53.5-  2.0 ],
            [  66.5, 53.5- 12.5 ],
            [  69.0, 53.5- 12.5 ],
            [  69.0, 53.5- 51.0 ],
            [  66.5, 53.5- 51.0 ],
            [  66.5, 53.5- 51.5 ],
            [   0.0, 53.5- 51.5 ],
            [   0.0, 53.5- 22.5 ],
            [ - 2.5, 53.5- 20.0 ]
            ] );
}

module zum_outside() {        
    offset( r = 1 ) translate( [ -2.5, 0 ] ) square( [ 71.5, 53.5 ] );
}

difference() {
    union() {
        difference() {
            linear_extrude( height = 5 ) zum_outside();
            translate( [ 0, 0, 3 ] ) linear_extrude( height = 5 ) zum_inside();
            
            // clearance 
            translate( [ -5, 3, 4 ] ) cube( [ 10, 10, 10 ] ); 
            translate( [ -5, 20.5, 4 ] ) cube( [ 10, 10, 10 ] );
            translate( [ 14, -5, 4 ] ) cube( [ 14, 10, 10 ] );
            translate( [ 0, 0, 1 ] ) linear_extrude( height = 3 ) offset( r = -1 ) zum_inside();

        }
        hull() linear_extrude( height = 4 ) translate( [ 24.5, 16.5 ] ) holes( d = 5 );
    }
    // holes
    linear_extrude( height = 10 ) translate( [ 24.5, 16.5 ] ) holes();
}