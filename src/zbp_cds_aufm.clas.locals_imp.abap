CLASS lhc_ZCDS_AUFM DEFINITION INHERITING FROM cl_abap_behavior_handler.


  PRIVATE SECTION.
    METHODS validateAufm FOR VALIDATE ON SAVE
      ZCDS_AUFM_INPUT  FOR ZCDS_AUFM~validateAufm.



ENDCLASS.

CLASS lhc_ZCDS_AUFM IMPLEMENTATION.

  METHOD validateAufm.

  read entity ZCDS_AUFM
  fields ( MBLNR  )
  with corresponding #( ZCDS_AUFM_INPUT )
  result DATA(lt_values).

  read table lt_values into data(ls_values) index 1.

  if sy-subrc is initial.

  append value #( %key = ls_values-%key
                  %msg = new_message( id = 'ZSY_MSG_CLASS'
                                      number = '001'
                                      severity = if_abap_behv_message=>severity-error )

                   ) to reported-ZCDS_AUFM.

  endif.

  ENDMETHOD.

ENDCLASS.
