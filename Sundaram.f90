!@name Sieve of Sundaram
!@author Robert Streetman
!@date   2014-01-07
!@desc   Implements Sieve of Sundaram to generate all primes below given integer, then returns the largest prime.
!
PROGRAM sundaram
IMPLICIT NONE

INTEGER :: lim                                 !Limit of prime generation
LOGICAL, ALLOCATABLE,DIMENSION(:) :: primes    !Array of booleans representing integers 0-limit
INTEGER :: mid,i,j,curr_index                  !Utility counters/placeholders

!Prompt user for limit
PRINT *, 'Enter an integer n to find all primes 0 - n and return the largest: '
READ *, lim

ALLOCATE(primes(lim))
primes(1:lim) = .TRUE.	!Fortran requires variables to be explicitly initiated
mid = lim / 2

!Generate primes
DO j = 1,mid
    i = 1
    DO WHILE (i.LE.j)
        curr_index = i + j + (2 * i * j)
        !If true, this candidate will not produce a prime
        IF (curr_index.LE.lim) THEN
            primes(curr_index) = .FALSE.
        END IF
        i = i + 1
    ENDDO
END DO

!Find first number still prime below lim
i = mid
DO WHILE (.NOT.primes(i))
    i = i - 1
ENDDO

!Take the candidate, multiply by 2, add 1, and you have a prime
PRINT *, 'Prime Found: ', (i * 2) + 1
END PROGRAM sundaram
