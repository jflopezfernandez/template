
vpath %.c src

TARGET = template

all: $(TARGET)

$(TARGET): main.c

.PHONY: clean
clean:
	rm -f *.o $(TARGET)
