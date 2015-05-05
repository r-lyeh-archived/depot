#include <fstream>
#include <iostream>
#include <cassert>

#include <sstream>
template<typename T>
std::string hex( const T &t ) {
    char buf[16];
    sprintf( buf, "0x%02x", int(t) );
    return buf;
}

static unsigned char reverse8(unsigned char v) {
    return (v * 0x0202020202ULL & 0x010884422010ULL) % 1023;
}

static std::string lower( std::string a ) {
    for( char &ch : a ) {
        if( ch >= 'A' && ch <= 'Z' ) ch = ch - 'A' + 'a';
    }
    return a;
}

int main( int argc, const char **argv ) {

    std::string arg = ( argc >= 2 ? argv[1] : "Namco.fon" );

    unsigned chars;
    unsigned skip = 512 + 16 + 8 + 2;
    unsigned char *buffer;

    /**/ if( lower(arg) == "namco.fon" ) skip += 0;
    else if( lower(arg) == "cbm64.fon" ) skip += 880 + 192;
    else skip += 192;

    std::cout << lower(arg) << std::endl;

    {
    std::ifstream ifs( arg.c_str(), std::ios::binary );
    if( !ifs.good() ) return -1;
    ifs.seekg( 0, std::ios_base::end );
    chars = ifs.tellg();
    chars -= skip;
    ifs.seekg( skip, std::ios_base::beg );
    buffer = new unsigned char [chars];
    ifs.read( (char *)buffer, chars );

    for( unsigned x = 0; x < chars; ++x ) {
        buffer[x] = reverse8(buffer[x]);
    }

    //std::ofstream ofs( "namco2.fon", std::ios::binary );
    //ofs.write( (char *)buffer, chars );
    }

    for( unsigned ch = 0; ch < chars / 8; ++ch ) {
        std::cout << (32+ch) << std::endl;
        for( unsigned y = 0; y < 8; ++y ) {
            unsigned char b = buffer[ ch * 8 + y ];
            for( unsigned char x = 0; x < 8; ++x ) {
                std::cout << ( b & (1<<x) ? 'x' : '.' );
            }
            std::cout << " " << hex(b) << " [" << (ch*8+y) << "] " << std::endl;
        }
    }

    return 0;
}
