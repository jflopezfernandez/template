
vpath %.c mem

all: tests

tests: mem

mem: safe_free
	$(foreach test,$^,./$(test))

safe_free: safe_free.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -I ../include    -o $@ $^ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -I ../include -c -o $@ $^

.PHONY: clean
clean:
	$(RM) *.o safe_free
