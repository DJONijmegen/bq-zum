$fn = 90;

/*

HEXAGON:
d = diameter (afstand overstaande hoeken)
b = breedte (afstand overstaande zijden)
z = zijde (lengte van een zijde)

d
    b = 0.5 * sqrt(3) * d
    z = 0.5 * d
b
    d = b / ( 0.5 * sqrt(3) )
    z = b / sqrt(3)
z
    d = 2 * z
    b = sqrt(3) * z

*/

module hexagon( 
    d = -1,
    b = -1,
    z = -1
) {
    if ( d > 0 ) {
        polygon( [
            [ 0.5 * d, 0 ],
            [ 0.5 * d / 2, 0.5 * sqrt(3) * d / 2 ],
            [ -0.5 * d / 2, 0.5 * sqrt(3) * d / 2 ],
            [ -0.5 * d, 0 ],
            [ -0.5 * d / 2, -0.5 * sqrt(3) * d / 2 ],
            [ 0.5 * d / 2, -0.5 * sqrt(3) * d / 2 ],
        ] );
    }
    if ( b > 0 ) {
        polygon( [
            [ b / ( 0.5 * sqrt(3) ) / 2, 0 ],
            [ b / sqrt(3) / 2, b / 2 ],
            [ -b / sqrt(3) / 2, b / 2 ],
            [ -b / ( 0.5 * sqrt(3) ) / 2, 0 ],
            [ -b / sqrt(3) / 2, -b / 2 ],
            [ b / sqrt(3) / 2, -b / 2 ],
        ] );
    }
    if ( z > 0 ) {
        polygon( [
            [ z, 0 ],
            [ z / 2, z * sqrt(3) / 2 ],
            [ -z / 2, z * sqrt(3) / 2 ],
            [ -z, 0 ],
            [ -z / 2, -z * sqrt(3) / 2 ],
            [ z / 2, -z * sqrt(3) / 2 ],
        ] );
    }
}

translate( [ -12, 0 ] ) {
    color( "Red" ) cylinder( d = 1, h = 5 );
    hexagon( d = 10 );
}

color( "Red" ) cylinder( d = 1, h = 5 );
hexagon( b = 8 );

translate( [ 12, 0 ] ) {
    color( "Red" ) cylinder( d = 1, h = 5 );
    hexagon( z = 5 );
}


/*

ROUNDED_HEXAGON:
d = diameter (afstand overstaande hoeken)
b = breedte (afstand overstaande zijden)
z = zijde (lengte van een zijde)
r = radius (radius van de hoek)

D = d - r
B = b - r

b, d -> r:

    r = b - 0.5 * sqrt(3) * (d - r)

    r = b - 0.5 * sqrt(3) * d - 0.5 * sqrt(3) * r

    r + 0.5*sqrt(3) * r = b - ( 0.5*sqrt(3)*d)
    ( 1 + 0.5*sqrt(3)) * r = b - ( 0.5*sqrt(3)*d)
         ( b - ( 0.5 * sqrt(3) * d )
    r = ------------------------------
          ( 1 + ( 0.5 * sqrt(3) )

               ____
   /|         |    | |\
1 / | sin60   |    | | \ 1
 /__|         |____| |__\
  cos60        1       c60
  
 cos(60) = 0.5
 sin(60) = sqrt(3) / 2
 
z = d / 2;
 
d = z * cos(60) + z + z * cos(60) = z * (.5 + 1 + .5) = z * 2
b = z * sin(60) * 2 
  = z * sqrt(3) / 2 * 2 
  = z * sqrt(3)
  = d  * .5 * sqrt(3)


z = b / sqrt(3)
d = z * 2 = 2 * b * 1/sqrt(3)

B = b + r; b = B - r
D = d + r;
r?
d = D - r;
r = B - b;

r = B - ( d * .5 * sqrt(3) )
  = B - ( ( D - r ) * .5 * sqrt(3) )
  = B - ( D * .5 * sqrt(3) ) - ( r * .5 * sqrt(3) ) 
r + ( r * .5 * sqrt(3) ) = B - ( D * .5 * sqrt(3) )

r * ( 1 + ( .5 * sqrt(3) ) = B - ( D * .5 * sqrt(3) )


 
 
*/