
vpath %.c src

export RM       := $(strip rm -f)

export CC       := $(CC)
export CFLAGS   := $(strip $(CFLAGS) -std=c17 -Wall -Wextra -Wpedantic)
export CPPFLAGS := $(strip $(CPPFLAGS) -D_GNU_SOURCE -D_POSIX_C_SOURCE)
export LDFLAGS  :=
export LIBS     :=

OBJS     := $(patsubst %.c,%.o,$(notdir $(wildcard src/*.c)))

TESTDIR  := $(strip tests)

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

.PHONY: clean-test-dir
clean-test-dir:
	$(MAKE) -C $(TESTDIR) clean
