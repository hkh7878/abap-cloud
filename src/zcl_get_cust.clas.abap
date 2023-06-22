class ZCL_GET_CUST definition

public
 final
create public .
public section.

INTERFACES if_oo_adt_classrun.
protected section.
private section.

ENDCLASS.

CLASS ZCL_GET_CUST IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
try.
DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination(
                               i_name = |CP8_RFC_ABAP| ).
DATA(lv_destination) = lo_rfc_dest->get_destination_name( ).
          TYPES : BEGIN OF ty_cust,
                    CUSTOMERID type C LENGTH 8 ,
                    CUSTNAME type c length 25 ,
                    FORM type c length 15,
                    STREET type c length 30,
                    POBOX type c length 10,
                    POSTCODe type c length 10,
                    CITY type c length 25,
                    COUNTR type c length 3,
                    COUNTR_ISO type c length 2,
                    REGION type c length 3,
                    PHONE type c length 30,
                    EMAIL type c length 40,
             END OF ty_cust.
     DATA: msg TYPE c LENGTH 255.
     DATA lt_cust TYPE STANDARD TABLE OF ty_cust.
     DATA ls_cust TYPE ty_cust.

     CALL FUNCTION 'BAPI_FLCUST_GETLIST'
             DESTINATION lv_destination
               tables
               customer_list  = lt_cust.
        CASE sy-subrc.
           WHEN 0.
             LOOP AT lt_cust INTO ls_cust.
              out->write( ls_cust-customerid && ',' &&  ls_cust-custname && ',' && ls_cust-street && ',' &&  ls_cust-postcode && ',' && ls_cust-city ).
             ENDLOOP.
           WHEN 1.
             out->write( |EXCEPTION SYSTEM_FAILURE | && msg ).
           WHEN 2.
             out->write( |EXCEPTION COMMUNICATION_FAILURE |               && msg ).
           WHEN 3.
             out->write( |EXCEPTION OTHERS| ).
         ENDCASE.

CATCH cx_root INTO DATA(lx_root).
         out->write( lx_root->get_text( ) ).
endtry.

endmethod.
ENDCLASS.

