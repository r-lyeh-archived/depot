// compact binary to C string tool; r-lyeh, public domain
#include <stdio.h>
#include <vector>
int main(int argc, char **argv) {
    std::vector<unsigned char> buf;
    FILE *fp = argc > 1 ? fopen(argv[1], "rb") : 0;
    for( int ch; (ch = fgetc(argc > 1 ? fp : stdin)) != EOF; buf.push_back(ch) ) ;
    for( auto end = buf.size(), it = end - end; it < end; ++it ) {
        printf( &"\"\\x%02x%s"[ !!(it % 16) ], buf[it], &"\"\n\0\";\n"[ (1+it) < end ? 2 * !!((1+it) % 16) : 3 ] );
    }
}
