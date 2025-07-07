module heat_solver
  implicit none
contains
  subroutine update_heat(T, Tnew, nx, ny)
    real(8), intent(in) :: T(:,:)
    real(8), intent(out) :: Tnew(:,:)
    integer, intent(in) :: nx, ny
    integer :: i, j

    !$omp parallel do private(i,j) shared(T,Tnew)
    do i = 2, nx-1
      do j = 2, ny-1
        Tnew(i,j) = 0.25d0 * (T(i-1,j) + T(i+1,j) + T(i,j-1) + T(i,j+1))
      end do
    end do
    !$omp end parallel do
  end subroutine

  subroutine swap(A, B)
    real(8), allocatable, intent(inout) :: A(:,:), B(:,:)
    real(8), allocatable :: tmp(:,:)
    tmp => A
    A => B
    B => tmp
  end subroutine
end module
