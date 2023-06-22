class ZCL_JOB_LOGIC definition
  public
  final
  create public.

public section.
  interfaces: IF_APJ_DT_EXEC_OBJECT,
  IF_APJ_RT_EXEC_OBJECT.
protected section.
private section.
ENDCLASS.

CLASS ZCL_JOB_LOGIC IMPLEMENTATION.

  METHOD IF_APJ_DT_EXEC_OBJECT~GET_PARAMETERS.
   et_parameter_def = VALUE #(
      ( selname = 'S_CCODE'    kind = if_apj_dt_exec_object=>select_option datatype = 'C' length = 4 param_text = 'Company Code'                                      changeable_ind = abap_true )

    ).

    " Return the default parameters values here
    et_parameter_val = VALUE #(
      ( selname = 'S_CCODE'    kind = if_apj_dt_exec_object=>select_option sign = 'I' option = 'EQ' low = 'US99' )
    ).

  ENDMETHOD.

  METHOD IF_APJ_RT_EXEC_OBJECT~EXECUTE.
   types ty_ccode type c length 4.
   data s_ccode type range of ty_ccode.
   LOOP AT it_parameters INTO DATA(ls_parameter).
      CASE ls_parameter-selname.
        WHEN 'S_CCODE'.
          APPEND VALUE #( sign   = ls_parameter-sign
                          option = ls_parameter-option
                          low    = ls_parameter-low
                          high   = ls_parameter-high ) TO s_ccode.
      ENDCASE.
    ENDLOOP.
" Implement business logic
"e.g., call company code related API using the value s_ccode

  ENDMETHOD.
  ENDCLASS.

