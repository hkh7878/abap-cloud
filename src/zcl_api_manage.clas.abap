class ZCL_API_MANAGE definition
  public
  final
  create public.

public section.
methods : constructor,
     get_salesorder_details RETURNING VALUE(msg) TYPE string.
protected section.
private section.
DATA: gv_url TYPE string value 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap'.
DATA: go_http_client TYPE REF TO if_web_http_client.
ENDCLASS.

CLASS ZCL_API_MANAGE IMPLEMENTATION.
method constructor.
go_http_client = cl_web_http_client_manager=>create_by_http_destination(
 i_destination = cl_http_destination_provider=>create_by_url( gv_url ) ).
endmethod.

method get_salesorder_details.
DATA(lo_request) = go_http_client->get_http_request(  ).
lo_request->set_header_fields( VALUE
#( ( name = 'Accept' value = 'application/json'   )
   ( name = 'Accept' value = 'application/json'   )
   ( name = 'APIKey' value = '<key>' ) ) ).
 lo_request->set_uri_path(
 i_uri_path = gv_url && '/API_SALES_ORDER_WITHOUT_CHARGE_SRV/A_SalesOrderWithoutCharge?$top=20&$format=json' ).
TRY.
DATA(lv_response) = go_http_client->execute( i_method = go_http_client->get )->get_text( ) .
CATCH cx_web_http_client_error.
ENDTRY.
msg = lv_response.
endmethod.
ENDCLASS.

