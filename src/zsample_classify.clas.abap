CLASS zsample_classify DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZSAMPLE_CLASSIFY IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
* uncomment once SDK is installed
*   data:
*     lv_image type string.
*    concatenate '<binary_data>' into lv_image.
*    data:
*      lo_vr type ref to zcl_ibmc_visual_recognition_v3.
*    try.
*        zcl_ibmc_service_ext=>get_instance(
*          exporting
*            i_instance_id     = 'UT_VISUAL_RECOGNITION_V3'
*            "i_auth_method     = 'NONE'
*            "i_host             = 'http://postman-echo.com/post'
*            i_version         = '2018-03-19'
*          importing
*            eo_instance = lo_vr ).
*      catch zcx_ibmc_service_exception into data(go_service_exception).
*        out->write( `ERROR: get_instance`).
*        return.
*    endtry.
*
*    data i_owners type zcl_ibmc_service=>tt_string.
*    append 'me' to i_owners.
*    append 'IBM' to i_owners.
*        try.
*    data(lx_imagesfile) = zcl_ibmc_service=>base64_decode( lv_image ).
*    lo_vr->classify(
*      exporting
*        i_images_file = lx_imagesfile
*        i_images_file_content_type = `image/png`
*        i_owners = i_owners
*      importing
*        e_response = data(l_response) ).
*   catch zcx_ibmc_service_exception into go_service_exception.
*     out->write( `ERROR: classify: ` && go_service_exception->get_text(  ) ).
*     return.
*   endtry.
*
*     loop at l_response-images into data(l_image).
*       loop at l_image-classifiers into data(l_classifier).
*         loop at l_classifier-classes into data(l_class).
*           out->write( `Classifier: ` && l_classifier-name && `  Class: ` && l_class-class && `  Score: ` && l_class-score ).
*         endloop.
*       endloop.
*     endloop.
*     out->write( `DONE!` ).
ENDMETHOD.
ENDCLASS.

