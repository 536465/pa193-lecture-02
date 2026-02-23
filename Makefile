CC = gcc
TARGET = BufferOverflow
SRC = BufferOverflow.cpp
CFLAGS = -Wall -Wextra -O0 -g -fno-omit-frame-pointer

all: no_protect

no_protect:
	$(CC) $(CFLAGS) -fno-stack-protector $(SRC) -o $(TARGET)

protect:
	$(CC) $(CFLAGS) -fstack-protector-all $(SRC) -o $(TARGET)
	# $(CC) $(CFLAGS) $SRC) -o $(TARGET)

run: no_protect
	./$(TARGET)

debug: no_protect
	gdb ./$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all no_protect protect clean
