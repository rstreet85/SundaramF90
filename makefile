#
FC = gfortran

#These flags are for development only
#Flags:
FCFLAGS = -g3 -fbounds-check -fbacktrace -Wall -Wextra -pedantic
#Optimization flags
#FCFLAGS += -O3

Sundaram: Sundaram.o
	$(FC) $(FCFLAGS) -o Sundaram.exe Sundaram.o
Sundaram.o: Sundaram.f90
	$(FC) $(FCFLAGS) -c Sundaram.f90

#Cleanup
clean:
	rm -f *.o *.mod