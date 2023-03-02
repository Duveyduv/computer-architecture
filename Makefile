# Linux makefile
# Use with make 
#

AS		:= nasm
ASFLAGS := -f elf -F dwarf
CFLAGS	:= -m32
LDFLAGS := -m32
CC		:= gcc
CXX		:= g++
CXXFLAGS := -m32
TARGETS := control_structures loops max conditionals project05_brandon_dove second_exercise project04_brandon_dove first_exercise skel prime math sub1 sub2 sub3 sub4 sub5 sub6 first memex dmaxt fprime quadt test_big_int
DEP := driver.o asm_io.o

.PHONY: clean


%.o: %.asm
	$(AS) $(ASFLAGS) $< 

all: $(TARGETS)

first_exercise: $(DEP)

second_exercise: $(DEP)

project04_brandon_dove: $(DEP)

project05_brandon_dove: $(DEP)

control_structures: $(DEP)

conditionals: $(DEP)

loops: $(DEP)

max: $(DEP)

skel: $(DEP) 

prime: $(DEP)

math: $(DEP)

first: $(DEP)

sub1: $(DEP)

sub2: $(DEP)

sub3: $(DEP)

sub4: $(DEP) main4.o

sub5: main5.o asm_io.o

sub6: main6.o

asm_io.o: asm_io.asm
	$(AS) $(ASFLAGS) -d ELF_TYPE asm_io.asm

array1: driver.o array1c.o

memex: memory.o

dmaxt: dmax.o

quadt: quad.o

readt: read.o

fprime: prime2.o

test_big_int : test_big_int.o big_int.o big_math.o
	$(CXX) $(CXXFLAGS) -otest_big_int test_big_int.o big_int.o big_math.o

big_int.o: big_int.hpp

test_big_int.o: big_int.hpp

project04_brandon_dove.o: asm_io.inc

project05_brandon_dove.o: asm_io.inc

conditionals.o: asm_io.inc

first_exercise.o: asm_io.inc

second_exercise.o: asm_io.inc

loops.o: asm_io.inc

control_structures.o: asm_io.inc

max.o: asm_io.inc

first.o: asm_io.inc

sub1.o: asm_io.inc

sub2.o: asm_io.inc

sub3.o: asm_io.inc

sub4.o: asm_io.inc

main4.o: asm_io.inc

prime.o: asm_io.inc 

clean :
	rm -f *.o $(TARGETS)
