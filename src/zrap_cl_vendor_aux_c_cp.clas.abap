CLASS zrap_cl_vendor_aux_c_cp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    interfaces:
       if_oo_adt_classrun.
    CLASS-METHODS:
     get_http_client  RETURNING VALUE(http_client) TYPE REF TO if_web_http_client
                       RAISING  cx_web_http_client_error
                                cx_http_dest_provider_error .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZRAP_CL_VENDOR_AUX_C_CP IMPLEMENTATION.
  METHOD get_http_client.

DATA(http_destination) = cl_http_destination_provider=>create_by_cloud_destination(
 i_name = 'S19_HTTP_ABAP'
 i_authn_mode = if_a4c_cp_service=>service_specific
 ).
    http_client = cl_web_http_client_manager=>create_by_http_destination( http_destination ).
  ENDMETHOD.
  METHOD IF_OO_ADT_CLASSRUN~MAIN.
    try.
        DATA(http_test_client) = zrap_cl_vendor_aux_c_cp=>get_http_client( ).
      catch cx_web_http_client_error cx_http_dest_provider_error.
        "handle exception
    endtry.
  ENDMETHOD.
ENDCLASS.

