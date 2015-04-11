CC=gcc
FLEX=flex
BISON=bison

FLEXFLAGS+=
BISONFLAGS+=
CFLAGS+=-O2 -Wall -Wextra -Werror -Wfloat-equal -Wformat=2 -g -std=c99
LDFLAGS+=-lm

%.o: %.c
	$(CC) -c -o $@ $<

%.c %.h: %.y
	$(BISON) --defines=$*.h --output=$@ $<

%.c: %.l
	$(FLEX) -d -o $@ $<

ciaw: src/parser.o src/lexer.o src/main.o
	$(CC) -o $@ $^

.PHONY: clean
clean:
	rm -f src/*.o src/{parser,lexer}.h src/{parser,lexer}.c compilerinaweek
