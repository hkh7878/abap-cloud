class ZCL_CUST_GETLIST definition
      public
 final
create public .
public section.
interfaces if_rap_query_provider.
protected section.
private section.

ENDCLASS.

CLASS ZCL_CUST_GETLIST IMPLEMENTATION.

METHOD if_rap_query_provider~select.

"variables needed to call BAPI's
    DATA lt_cust TYPE STANDARD TABLE OF  ZCE_CUST_VIA_RFC .
    data ls_cust type ZCE_CUST_VIA_RFC.
    DATA lt_result TYPE STANDARD TABLE OF  ZCE_CUST_VIA_RFC .
    DATA ls_product TYPE ZCE_CUST_VIA_RFC .

    "key for BAPI_GET_DETAIL
    TYPES : BEGIN OF cust_rfc_key_type,
              customerid TYPE ZCE_CUST_VIA_RFC-customerid,
            END OF cust_rfc_key_type.
    DATA ls_cust_rfc_key TYPE cust_rfc_key_type.

"select options
    DATA lt_filter_ranges_customerid TYPE RANGE OF ZCE_CUST_VIA_RFC-customerid.
    DATA ls_filter_ranges_customerid LIKE LINE OF lt_filter_ranges_customerid.

    " ABAP source code for type definition for BAPIRET2
    TYPES : BEGIN OF ty_bapiret2,
              type      TYPE c LENGTH 1,
              id        TYPE c LENGTH 20,
              number    TYPE n LENGTH 3,
              message   TYPE c LENGTH 220,
              logno     TYPE c LENGTH 20,
              logmsgno  TYPE n LENGTH 6,
              messagev1 TYPE c LENGTH 50,
              messagev2 TYPE c LENGTH 50,
              messagev3 TYPE c LENGTH 50,
              messagev4 TYPE c LENGTH 50,
              parameter TYPE c LENGTH 32,
              row       TYPE i,
              field     TYPE c LENGTH 30,
              system    TYPE c LENGTH 10,
            END OF ty_bapiret2.

    "DATA lt_return   TYPE STANDARD TABLE OF bapiret2.
    DATA lt_return   TYPE STANDARD TABLE OF ty_bapiret2.
    "variables generic for implementation of custom entity
    DATA lv_details_read TYPE abap_bool.
    "DATA ls_sel_opt TYPE /iwbep/s_cod_select_option.

*   ensure: in case of a single record is requested (e.g. data for a detail page),
* only one record is returned and SET_TOTAL_NUMBER_OF_RECORDS = 1
    DATA lv_orderby_string TYPE string.
    DATA lv_select_string TYPE string.
    DATA(lv_abap_trial) = abap_true.

  IF lv_abap_trial = abap_false.

      TRY.
          DATA(lo_rfc_dest) = cl_rfc_destination_provider=>create_by_cloud_destination(
                                   i_name = |CP8_RFC_ABAP| ).
          DATA(lv_rfc_dest_name) = lo_rfc_dest->get_destination_name( ).

        CATCH cx_rfc_dest_provider_error INTO DATA(lx_dest).

        CALL FUNCTION 'BAPI_FLCUST_GETLIST'
             DESTINATION lv_rfc_dest_name
               tables
               customer_list  = lt_cust.

            io_response->set_total_number_of_records( lines( lt_cust ) ).
            io_response->set_data( lt_cust ).
      ENDTRY.
    ENDIF.
ENDMETHOD.
ENDCLASS.

