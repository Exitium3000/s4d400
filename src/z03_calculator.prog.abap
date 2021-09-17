*&---------------------------------------------------------------------*
*& Report z03_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_calculator.

PARAMETERS: gv_int1 TYPE i,  gv_int2 TYPE i, gv_op TYPE c LENGTH 1.
DATA result TYPE p LENGTH 16 DECIMALS 2.
DATA gv_output TYPE string.



CASE gv_op.
    WHEN '+'.
        result = gv_int1 + gv_int2.
        gv_output = result.
    WHEN '-'.
        result = gv_int1 - gv_int2.
        gv_output = result.
    WHEN '/'.
        result = gv_int1 / gv_int2.
        gv_output = result.
            IF gv_int1 = 0.
                EXIT. ENDIF.
    WHEN '*'.
        result = gv_int1 * gv_int2.
        gv_output = result.
    WHEN OTHERS.
ENDCASE.

WRITE gv_output.
