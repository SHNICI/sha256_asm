OUT = libsha256x8664.a
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

OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SDIR)/%.S
	$(CC) -c $(INC) -o $@ $^ $(CFLAGS) 

$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c $(INC) -o $@ $^ $(CFLAGS) 

$(OUT): $(OBJS) 
	ar rvs $(OUT) $^

$(DEPS):
.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(OUT)
	
copy:
	cp -f $(DEPS) $(GLOBAL_LIBDIR)
	cp -f $(OUT) $(GLOBAL_LIBDIR)