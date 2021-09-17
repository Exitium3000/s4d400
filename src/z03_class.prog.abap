*&---------------------------------------------------------------------*
*& Report z03_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z03_class.

CLASS lcl_airplane DEFINITION.

    PUBLIC SECTION.
        TYPES: BEGIN OF ts_attribute,
                attribute TYPE  string,
                value     TYPE string,
               END OF ts_attribute,

               tt_attributes TYPE STANDARD TABLE OF ts_attribute
                WITH NON-UNIQUE KEY attribute.

         METHODS set_attributes
                IMPORTING
                    iv_name TYPE string
                    iv_planetype TYPE saplane-planetype.

         METHODS get_attributes
                EXPORTING
                    et_attributes TYPE tt_attributes.


        CLASS-METHODS get_n_o_airplanes
          EXPORTING
          ev_number TYPE i.





    PRIVATE SECTION.
        DATA mv_name                  TYPE string.
        DATA mv_planetype             TYPE saplane-planetype.
        CLASS-DATA gv_n_o_airplanes   TYPE i.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD get_n_o_airplanes.
    ev_number = gv_n_o_airplanes.

  ENDMETHOD.

  METHOD set_attributes.
       mv_name = iv_name.
       mv_planetype = iv_name.
       gv_n_o_airplanes = gv_n_o_airplanes + 1.


  ENDMETHOD.

  METHOD get_attributes.
   et_attributes = value #(  (  attribute = 'NAME' value = mv_name  )
                              ( attribute = 'PLANETYPE' value = mv_planetype ) ).

  ENDMETHOD.

ENDCLASS.

*Here begins a new exercise (Unit10,Ex16)
DATA: go_airplane TYPE REF TO lcl_airplane,
      gt_airplanes TYPE TABLE OF REF TO lcl_airplane.

      START-OF-SELECTION.
      go_airplane = NEW #(  ).
       gt_airplanes = VALUE #( BASE gt_airplanes ( go_airplane ) ).

*Here begins a new exercise (Unit10,Ex17)

DATA: gt_attributes     TYPE lcl_airplane=>tt_attributes,
      gt_output         TYPE lcl_airplane=>tt_attributes.



START-OF-SELECTION.

  go_airplane = NEW #(  ).
  go_airplane->set_attributes(
    EXPORTING
      iv_name      = 'Plane 1'
      iv_planetype = '747-400'
  ).
  gt_airplanes = VALUE #(  BASE gt_airplanes ( go_airplane ) ).

  go_airplane = NEW #(  ).
  go_airplane->set_attributes(
    EXPORTING
      iv_name      = 'Plane 2'
      iv_planetype = 'A319'
  ).
  gt_airplanes = VALUE #(  BASE gt_airplanes ( go_airplane ) ).

  go_airplane = NEW #(  ).
  go_airplane->set_attributes(
    EXPORTING
      iv_name      = 'Plane 3'
      iv_planetype = '146-200'
  ).
  gt_airplanes = VALUE #(  BASE gt_airplanes ( go_airplane ) ).

  LOOP AT gt_airplanes into go_airplane.
  go_airplane->get_attributes(
    IMPORTING
      et_attributes = gt_attributes
  ).

  gt_output = corresponding #(  base ( gt_output  ) gt_attributes ).
  ENDLOOP.

  cl_s4d_output=>display_table(  gt_output ).
