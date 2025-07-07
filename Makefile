FC = mpif90
FFLAGS = -O3 -fopenmp

all: heat2d

heat2d: main.o heat_solver.o utils.o
	$(FC) $(FFLAGS) -o heat2d main.o heat_solver.o utils.o

%.o: %.f90
	$(FC) $(FFLAGS) -c $<

clean:
	rm -f *.o *.mod heat2d
