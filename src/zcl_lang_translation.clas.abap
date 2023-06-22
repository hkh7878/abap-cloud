class ZCL_LANG_TRANSLATION definition
  public
  final
  create public .
public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.

CLASS ZCL_LANG_TRANSLATION IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
* uncomment the code once SDK is installed
*  data:
*    lv_apikey            type string value '<api_key>',
*    lo_lang_translator   type ref to zcl_ibmc_lang_translator_v3,
*    lo_service_exception type ref to zcx_ibmc_service_exception,
*    ls_request           type zcl_ibmc_lang_translator_v3=>t_translate_request,
*    lv_text              type string,
*    ls_trans             type zcl_ibmc_lang_translator_v3=>t_translation_result,
*    lv_response          type string.
*
*  " get Watson Language Translator service instance
*  zcl_ibmc_service_ext=>get_instance(
*    exporting
*      i_url =
* 'https://api.au-syd.language-translator.watson.cloud.ibm.com/instances/a8d0ad7c-1ef8-481e-acc0-f93257933dc0'
*      i_apikey   = lv_apikey
*      i_version  = '2018-05-01'
*    importing
*      eo_instance = lo_lang_translator ).
*
*  " store text to be translated into ls_request and set the languages
*  lv_text = 'Welcome to ABAP Cloud '.
*  append lv_text to ls_request-text.
*  ls_request-model_id = 'en-de'.
*  ls_request-source = 'EN'.
*  ls_request-target = 'DE'.
*
*  try.
*      lo_lang_translator->translate(
*        exporting
*          i_request     =   ls_request
*          i_contenttype = 'application/json'
*          i_accept      = 'application/json'
*        importing
*          e_response = ls_trans ).
*    catch zcx_ibmc_service_exception into lo_service_exception.
**      message lo_service_exception type 'E'.
*  endtry.
*           out->write( ls_trans ).
endmethod.
ENDCLASS.

