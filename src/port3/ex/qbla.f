C$TEST QBLA
C TO RUN AS A MAIN PROGRAM REMOVE NEXT LINE
      SUBROUTINE QBLA
C***********************************************************************
C
C  EXAMPLE OF USE OF THE PORT PROGRAM RQUAD
C
C***********************************************************************
      EXTERNAL F
      COMMON /COUNTS/NMEVAL
      INTEGER NMEVAL,IWRITE,I1MACH
      REAL F,RESULT,ERROR
C
C  INITIALIZE COUNT TO ZERO
      NMEVAL = 0
C
C  SET OUTPUT UNIT TO IWRITE
      IWRITE = I1MACH(2)
C
      CALL RQUAD(F, 0.0, 1.0, 0.0, 1.0E-7, RESULT, ERROR)
C
      WRITE (IWRITE, 9996)
 9996 FORMAT(13X, 42H THE INTEGRAL OF EXP(X) BETWEEN 0 AND 1 IS)
      WRITE (IWRITE, 9997) RESULT, ERROR
 9997 FORMAT(1H0,11X, 1PE15.8, 20H WITH RELATIVE ERROR, 1PE9.2)
      WRITE (IWRITE,9998) NMEVAL
 9998 FORMAT(1H0, 13X,1H(,I2,38H FUNCTION EVALUATIONS WERE REQUIRED TO)
      WRITE (IWRITE,9999)
 9999 FORMAT(17X, 26H   PERFORM THE QUADRATURE) )
      STOP
      END
      REAL FUNCTION F(X)
      COMMON /COUNTS/NMEVAL
      INTEGER NMEVAL
      REAL X
C
C  COMPUTE THE INTEGRAND
      F = EXP( X )
C
C  COUNT THE NUMBER OF TIMES F WAS CALLED
      NMEVAL = NMEVAL + 1
      RETURN
      END
