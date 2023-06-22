class ZCL_MATERIAL_ODATA_CALL definition
  public
  final
  create public .

public section.
interfaces IF_OO_ADT_CLASSRUN.
protected section.
private section.
ENDCLASS.

CLASS ZCL_MATERIAL_ODATA_CALL IMPLEMENTATION.

method if_oo_adt_classrun~main.
* uncomment once service consumption model is created
*DATA: lt_business_data  TYPE TABLE OF ZA_MATERIALDOCUMENTH856A03A9E0,
*      lo_http_client    TYPE REF TO if_web_http_client,
*      lo_client_proxy   TYPE REF TO /iwbep/if_cp_client_proxy,
*      lo_request        TYPE REF TO /iwbep/if_cp_request_read_list,
*      lo_response       TYPE REF TO /iwbep/if_cp_response_read_lst.
*  TRY.
*  DATA(http_destination) = cl_http_destination_provider=>create_by_cloud_destination(
*         i_name = 'CP8_HTTP_ABAP'
*         i_authn_mode = if_a4c_cp_service=>service_specific
*         ).
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( http_destination ).
*    lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*      EXPORTING
*        iv_service_definition_name = 'ZRAP_MATERIAL'
*        io_http_client             = lo_http_client
*        iv_relative_service_root   = '/sap/opu/odata/sap/API_MATERIAL_DOCUMENT_SRV' ).
*    " Navigate to the resource and create a request for the read operation
*    lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_MATERIALDOCUMENTHEADER' )->create_request_for_read( ).
*    lo_request->set_top( 1 )->set_skip( 0 ).
*    " Execute the request and retrieve the business data
*    lo_response = lo_request->execute( ).
*    lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
*
*    CATCH cx_web_http_client_error INTO DATA(lx_response).
*        out->write( lx_response->get_text(  ) ).
*
*      CATCH cx_http_dest_provider_error INTO DATA(lx_destexception).
*        out->write( lx_destexception->get_text(  ) ).
*
*  CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*    " Handle remote Exception
*    " It contains details about the problems of your http(s) connection
*
*  CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*    " Handle Exception
*ENDTRY.
ENDMETHOD .
ENDCLASS.

