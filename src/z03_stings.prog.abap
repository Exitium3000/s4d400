*&---------------------------------------------------------------------*
*& Report z03_stings
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_stings.

PARAMETERS: e_String TYPE string.
DATA begLet TYPE c.
begLet = substring( val = e_string off = 0 len = 1 ).

case begLet.
  WHEN 'A'.
    write to_lower( e_String ).
*  WHEN ...
*    e_String reverse.
ENDCASE.
