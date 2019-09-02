
vpath %.c src

RM       := $(strip rm -f)

CC       := $(CC)
CFLAGS   := $(strip $(CFLAGS) -std=c17 -Wall -Wextra -Wpedantic)
CPPFLAGS := $(strip $(CPPFLAGS) -D_GNU_SOURCE -D_POSIX_C_SOURCE)
LDFLAGS  :=
LIBS     :=

OBJS     := $(patsubst %.c,%.o,$(notdir $(wildcard src/*.c)))

TESTDIR  := $(strip test)

TARGET   := template

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include    -o $@ $^ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -I include -c -o $@ $^ $(LDFLAGS) $(LIBS)

.PHONY: check
check: $(OBJS)
	$(MAKE) -C $(TESTDIR)

.PHONY: clean
clean:
	$(RM) *.o $(TARGET)
