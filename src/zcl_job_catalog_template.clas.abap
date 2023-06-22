class ZCL_JOB_CATALOG_TEMPLATE definition
  public
  final
  create public .

public section.
  interfaces if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_JOB_CATALOG_TEMPLATE IMPLEMENTATION.
  METHOD IF_OO_ADT_CLASSRUN~MAIN.
    CONSTANTS lc_catalog_name      TYPE cl_apj_dt_create_content=>ty_catalog_name  VALUE 'ZCAT_DEMO'.
    CONSTANTS lc_catalog_text      TYPE cl_apj_dt_create_content=>ty_text          VALUE 'Application job'.
    CONSTANTS lc_class_name        TYPE cl_apj_dt_create_content=>ty_class_name    VALUE 'ZCL_JOB_LOGIC'.

    CONSTANTS lc_template_name     TYPE cl_apj_dt_create_content=>ty_template_name VALUE 'ZCL_JOBDEMO_TEMPL'.
    CONSTANTS lc_template_text     TYPE cl_apj_dt_create_content=>ty_text          VALUE 'Steampunk - Demo job template'.

    CONSTANTS lc_transport_request TYPE cl_apj_dt_create_content=>ty_transport_request VALUE 'DS1K900196'.
    CONSTANTS lc_package           TYPE cl_apj_dt_create_content=>ty_package           VALUE 'ZSCP_ABAP'.

    DATA(lo_dt) = cl_apj_dt_create_content=>get_instance( ).


    TRY.
    "Create Job catalog entry
        lo_dt->create_job_cat_entry(
            iv_catalog_name       = lc_catalog_name
            iv_class_name         = lc_class_name
            iv_text               = lc_catalog_text
            iv_catalog_entry_type = cl_apj_dt_create_content=>class_based
            iv_transport_request  = lc_transport_request
            iv_package            = lc_package
        ).
        out->write( |Job catalog entry created successfully| ).

      CATCH cx_apj_dt_content INTO DATA(lx_apj_dt_content).
        out->write( |Creation of job catalog entry failed: { lx_apj_dt_content->get_text( ) }| ).
    ENDTRY.

    " Create a job template
    DATA lt_parameters TYPE if_apj_dt_exec_object=>tt_templ_val.
    " Create an instance of the business logic and get the parameter details
    NEW zcl_job_logic( )->if_apj_dt_exec_object~get_parameters(
      IMPORTING
        et_parameter_val = lt_parameters
    ).

    TRY.
        lo_dt->create_job_template_entry(
            iv_template_name     = lc_template_name
            iv_catalog_name      = lc_catalog_name
            iv_text              = lc_template_text
            it_parameters        = lt_parameters
            iv_transport_request = lc_transport_request
            iv_package           = lc_package
        ).
        out->write( |Job template created successfully| ).

      CATCH cx_apj_dt_content INTO lx_apj_dt_content.
        out->write( |Creation of job template failed: { lx_apj_dt_content->get_text( ) }| ).
        RETURN.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
