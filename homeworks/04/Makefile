# Makefile
CC = arm-none-eabi-gcc
CFLAGS = -g -O0  
# ENDIAN = -mbe32

SRCS = $(wildcard *.s)

TARGETS = $(SRCS:.s=.exe)

all:$(TARGETS)

%.exe: %.s
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(TARGETS)

.PHONY: all clean
