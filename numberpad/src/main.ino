byte pins[] = { 11, 10, 9, 8, 7, 6, 5 };

byte rows[] = { 11, 10, 9, 8 };
byte cols[] = { 7, 6, 5 };


void set_input( byte pin ) { 
	pinMode( pins[ pin ], INPUT_PULLUP );
}

void set_output( byte pin ) {
	pinMode( pins[ pin ], OUTPUT );
	digitalWrite( pins[ pin ], LOW );
}

byte get_input( byte pin ) {
	return digitalRead( pins[ pin ] );
}

void setup( void ) {
	Serial.begin( 115200 );
	for ( byte i = 0; i < 7; i++ ) {
		set_input( i );
	}
}

void loop( void ) {

	Serial.println( "\e[H\e[2J\t1\t2\t3\t4\t5\t6\t7" );
	for ( byte row = 0; row < 7; row++ ) {
		Serial.print( row + 1 );
		set_output( row );
		for ( byte col = 0; col < 7; col++ ) {
			if ( get_input( col ) ) {
				Serial.print( "\t1" );
			} else {
				Serial.print( "\t0" );
			}
		}
		Serial.println();
		set_input( row );
	}
	delay( 1000 );
}
