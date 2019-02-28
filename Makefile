#
#
#---------------------------------------------------------------------------
#
# DESCRIPTION:
# ------------
# Build serialio lib and a tester.
#
#===========================================================================
#
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#	
CC ?= gcc
CFLAGS = -c -Wall
LDFLAGS= -g -lm

COMMON_SOURCES = serialio.c
TARGET_SOURCES = test-serialio.c
APP_SOURCES =
COMMON_OBJECTS = $(COMMON_SOURCES:.c=.o)
TARGET_OBJECTS = $(TARGET_SOURCES:.c=.o)
APP_OBJECTS = $(APP_SOURCES:.c=.o)
EXECUTABLE = test-serialio
TEST_EXECUTABLE = 


all: $(COMMON_OBJECTS) serialio

serialio: $(EXECUTABLE)

$(EXECUTABLE): $(COMMON_OBJECTS) $(TARGET_OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

$(TEST_EXECUTABLE):  $(APP_OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@
	
#
# This removes the executable file, as well as old .o object
# files and *~ backup files:
#
clean: 
	$(RM) *.o *~ $(EXECUTABLE) $(TEST_EXECUTABLE) a.out

