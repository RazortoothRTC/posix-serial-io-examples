/**
#
#
**/
#include <stdio.h>      // standard input / output functions
#include <stdlib.h>
#include <string.h>     // string function definitions
#include <unistd.h>     // UNIX standard function definitions
#include <fcntl.h>      // File control definitions
#include <errno.h>      // Error number definitions
#include <termios.h>    // POSIX terminal control definitions


extern int
set_interface_attribs (int fd, int speed, int parity);

extern void
set_blocking (int fd, int should_block);

//
//
//
extern int serialio_init(const char* portname, int speed, int parity, int blocking);

int main()
{
    int fd;

    if ((fd = serialio_init("/dev/ttyUSB0", B115200, 0, 0)) < 0) {
        perror("Couldn't init  serial io");
        exit(-1);
    }

    write(fd, "AT+N\r\n", 6);           // send 7 character greeting
    // usleep ((7 + 25) * 100);             // sleep enough to transmit the 7 plus
    char buf [100];
    int n = read(fd, buf, sizeof buf);  // read up to 100 characters if ready to readj
    printf("Read %d bytes\n", n);
    printf("read data: %s\n", buf);
    return 0;
}
