$fn = 90;

module zum() {
        square( [ 71.5, 54.0 ] );
}

module zum_clearance() {

    polygon( [
        [  5.0,  1.0 ],
        [ 68.0,  1.0 ],
        [ 68.0,  4.5 ],
        [ 70.5,  4.5 ],
        [ 70.5, 38.0 ],
        [ 68.0, 38.0 ],
        [ 68.0, 53.0 ],
        [  5.0, 53.0 ],
        [  5.0, 39.0 ],
        [ 62.0, 39.0 ],
        [ 62.0, 15.0 ],
        [  5.0, 15.0 ]
        
    ] );
    
/*
    offset( r = -1 ) offset( r = 1 ) {
        polygon( [
            [ 19, 53.5 - 1 ],
            [ 19, 53.5 - 4  ],
            [ 29, 53.5 - 4 ],
            [ 29, 53.5 - 13 ],
            [ 67, 53.5 - 13 ],
            [ 67, 53.5 - 1 ]
        ] );
        polygon( [ 
            [ 65, 32 ],
            [ 65, 24 ],
            [ 70, 24 ],
            [ 70, 32 ]
        ] );
        polygon( [ 
            [ 64, 19.5 ],
            [ 64, 10 ],
            [ 70, 10 ],
            [ 70, 19.5 ]
        ] );
        polygon( [
            [ 29.5, 1 ],
            [ 29.5, 4  ],
            [ 48, 4 ],
            [ 48, 13 ],
            [ 63, 13 ],
            [ 63, 4 ],
            [ 67, 4 ],            
            [ 67, 1 ]
        ] );
        polygon( [ 
            [ 20, 6 ],
            [ 20, 4 ],
            [ 27, 4 ],
            [ 27, 6 ]
        ] );
        
        hull() {
            translate( [ 11,  3.5 ] ) circle( d = 6 );
            translate( [ 14.5, 7 ] ) circle( d= 6 );
            translate( [ 9, 7 ] ) circle( d = 6 );
        }
    }
*/
}

module zum_base() {
    difference() { 
        cube( [ 66 + 5 + 3, 53.5 + 3, 7 ] );
        translate( [ 1.5, 1.5, 1 ] ) linear_extrude( height = 10 ) zum_clearance();
        translate( [ 1.5, 1.5, 5 ] ) linear_extrude( height = 10 ) zum();
        translate( [ 65 + 1.5, 14.5 - 5 + 1.5, 5 ] ) cube( [ 10, 10, 10 ] ); 
        translate( [ -1, 5, 5 ] ) cube( [ 20, 10, 15 ] ); 
        translate( [ -1, 1.5 + 25.5 - 6, 5 ] ) cube( [ 12, 12, 6 ] );
        translate( [ 1.5 + 24 - 6, -1 , 5 ] ) cube( [ 12, 12, 6 ] );
    }
}

zum_base();

//difference() {
//    translate( [ 0, 0, -4 ] ) zum_base();
//    translate( [ -10, -10, -10 ] ) cube( [ 100, 100, 10 ] );
//}