OUT = libsha256_x8664.a
CC = gcc
ODIR = obj
SDIR = .
IDIR = .
INC = -Iinc
GLOBAL_LIBDIR = ..

_DEPS = sha256.h
_OBJ = sha256.o sha256_x8664.o
LIBS = -lm




DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

OBJS = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(OUT): $(OBJS) 
	ar rvs $(OUT) $^

$(ODIR)/sha256_x8664.o: $(SDIR)/sha256-x8664.S
	$(CC) -c $(INC) -o $@ $^ $(CFLAGS) 

$(ODIR)/sha256.o: $(SDIR)/sha256.c
	$(CC) -c $(INC) -o $@ $^ $(CFLAGS) 


$(DEPS):
.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(OUT)
	
copy:
	cp -f $(DEPS) $(GLOBAL_LIBDIR)
	cp -f $(OUT) $(GLOBAL_LIBDIR)
