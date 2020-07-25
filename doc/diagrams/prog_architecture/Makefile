.POSIX:
.SILENT:
.PHONY: all clean

all: clean build

build: dests

dests: $(patsubst %.dot, %.png, $(wildcard *.dot))

%.png: %.dot
	dot -Tpng $< -o $@

clean:
	rm -f *.{png}
