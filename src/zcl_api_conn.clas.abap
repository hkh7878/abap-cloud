class ZCL_API_CONN definition
  public
  create public .
public section.
interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.

CLASS ZCL_API_CONN IMPLEMENTATION.
  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.
  DATA(lt_params) = request->get_form_fields( ).

  READ TABLE lt_params REFERENCE INTO DATA(lr_params) WITH KEY name = 'cmd'.

  IF SY-SUBRC <> 0.
   response->set_status( i_code = 400 i_reason = 'Bad Request' ).
   RETURN.
  ENDIF.

  CASE lr_params->value.
  WHEN 'salesorder'.
  response->set_text( new zcl_api_manage( )->get_salesorder_details( ) ).

  WHEN OTHERS.
  response->set_status( i_code = 400 i_reason = 'Bad Request').
  ENDCASE.
  endmethod.
ENDCLASS.

