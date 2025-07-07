program heat2d
  use mpi
  use heat_solver
  use utils
  implicit none

  integer :: ierr, rank, size, i
  integer :: nx_global = 100, ny = 100, steps = 500
  real(8), allocatable :: T(:,:), Tnew(:,:)

  call MPI_Init(ierr)
  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  call allocate_grid(nx_global, ny, rank, size, T, Tnew)
  call initialize(T, rank)

  do i = 1, steps
     call update_heat(T, Tnew, nx_global/size, ny)
     call swap(T, Tnew)
     if (mod(i,50)==0 .and. rank==0) print *, 'Step:', i
  end do

  call finalize_grid(T, Tnew)
  call MPI_Finalize(ierr)
end program
