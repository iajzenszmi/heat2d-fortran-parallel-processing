module utils
  implicit none
contains
  subroutine allocate_grid(nx_global, ny, rank, size, T, Tnew)
    integer, intent(in) :: nx_global, ny, rank, size
    real(8), allocatable, intent(out) :: T(:,:), Tnew(:,:)
    integer :: nx_local

    nx_local = nx_global / size + 2
    allocate(T(nx_local, ny+2))
    allocate(Tnew(nx_local, ny+2))
    T = 0.0d0
    Tnew = 0.0d0
  end subroutine

  subroutine initialize(T, rank)
    real(8), intent(inout) :: T(:,:)
    integer, intent(in) :: rank
    if (rank == 0) T(size(T,1)/2, size(T,2)/2) = 100.0d0
  end subroutine

  subroutine finalize_grid(T, Tnew)
    real(8), allocatable, intent(inout) :: T(:,:), Tnew(:,:)
    deallocate(T)
    deallocate(Tnew)
  end subroutine
end module
