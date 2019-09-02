
vpath %.c src

OBJS = $(patsubst %.c,%.o,$(notdir $(wildcard src/*.c)))

TARGET = template

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include    -o $@ $^ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include -c -o $@ $^ $(LDFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f *.o $(TARGET)
