
vpath %.c src

TARGET = template

all: $(TARGET)

$(TARGET): main.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include -o $@ $^ $(LDFLAGS) $(LIBS)

main.o: main.c

.PHONY: clean
clean:
	rm -f *.o $(TARGET)
