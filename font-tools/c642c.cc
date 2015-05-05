#include <stdlib.h>
#include <fstream>

static unsigned char reverse8(unsigned char v) {
    return (v * 0x0202020202ULL & 0x010884422010ULL) % 1023;
}

int main() {
	unsigned char custom[ 256 * 8 ];

	std::ifstream ifs( "c64_lower.64c", std::ios::binary );
	ifs.read( (char *)custom, 256 * 8 );
	for( unsigned x = 0; x < 256 * 8; ++x ) custom[x] = reverse8( custom[x] );

	// compact hexdump binary to C string ~~ r-lyeh, public domain {
	for( auto end = 256 * 8, it = end - end; it < end; ++it ) {
	    printf( &"\"\\x%02x%s"[ !!(it % 16) ], custom[it], &"\"\n\0\";\n"[ (1+it) < end ? 2 * !!((1+it) % 16) : 3 ] );
	}
	// }
}
