
# Get the current environment
UNAME_S = $(shell uname -s)
UNAME_M = $(shell uname -m)

ifeq ($(UNAME_S), Linux)
    LIB_EX=so
    LD_OPTIONS=-shared
    CXX_OPTIONS=-fPIC
endif

ifeq ($(UNAME_S), Darwin)
    LIB_EX=dylib
    LD_OPTIONS=-dylib -arch $(UNAME_M)
endif

# Directories
BIN	=   bin
SRC	=   src
LIB	=   lib
INCLUDE	=   include
OBJ	=   obj
SOURCES	=   $(wildcard $(SRC)/*.c)
OBJS	=   $(addprefix $(OBJ)/, $(notdir $(SOURCES:.c=.o)))

# Targets
LIST_LIB_SHARED = liblist.$(LIB_EX)
LIST_LIB_STATIC = liblist.a


# Commands
CD	=   cd
CC	=   gcc
CXX	=   g++
AR	=   ar -rv
LD	=   ld $(LD_OPTIONS)
MV	=   mv
RM	=   rm -rf
MAKE	=   make
MD	=   mkdir -p

CFLAGS=-I$(INCLUDE) -Wall -O3 -c
LDFLAGS=-L$(LIB) -llist \
	-L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib \
	-lSystem

all : dirs $(LIST_LIB_STATIC) $(LIST_LIB_SHARED) main #$(LIST_LIB_SHARED)

dirs :
	if [ ! -d "./$(LIB)" ]; then	\
	    $(MD) $(LIB);		\
	fi
	if [ ! -d "./$(OBJ)" ]; then	\
	    $(MD) $(OBJ);		\
	fi


main: $(LIST_LIB_STATIC) $(OBJ)/main.o
	$(LD) $(LDFLAGS) -o $(BIN)/main $(OBJ)/main.o

$(LIST_LIB_STATIC) : $(OBJS)
	$(AR) $(LIST_LIB_STATIC) $(OBJS)
	$(MV) $(LIST_LIB_STATIC) $(LIB)

$(LIST_LIB_SHARED) : $(OBJS)
	$(LD) $(LDFLAGS) -o $(LIST_LIB_SHARED) $(OBJS)
	$(MV) $(LIST_LIB_SHARED) $(LIB)

$(OBJ)/%.o : $(SRC)/%.c
	@echo Creating $@ with $^
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	@echo Cleaning all objects...
	$(RM) $(OBJS)
	$(RM) $(LIB)
	$(RM) $(BIN)

clean_objects:
	$(RM) $(OBJ)/*
	$(RM) $(OBJ)/*.*~

