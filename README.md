# 2D Heat Diffusion (Parallel Fortran Demo)

## Description
Simulates heat propagation in a 2D plate using MPI + OpenMP hybrid parallelism.

## Requirements
- MPI (e.g., MPICH or OpenMPI)
- OpenMP
- Fortran 90 compiler (e.g., `gfortran` with MPI wrappers)

## Build
```bash
make
```

## Run
```bash
mpirun -np 4 ./heat2d
```

## Output
Terminal progress every 50 steps. Can be extended to write VTK/CSV output.
