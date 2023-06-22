class ZCL_XCO_DATAELEMENT definition
  public
  final
  create public .

public section.
 INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_XCO_DATAELEMENT IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.

DATA(lo_package) = xco_cp_abap_repository=>package->for( '<package>' ).
** Create the handler instance to create repository objects
    DATA(lo_put_operation) = xco_cp_generation=>environment->dev_system(
      '<req_number>' "lo_transport_request->value
     )->create_put_operation(  ).
DATA(lo_specification) = lo_put_operation->for-dtel->add_object( 'ZVAX_TP1Q_3RDPVALUE'
  )->set_package( '<package>'
  )->create_form_specification( ).
lo_specification->set_short_description( '3rd party value' ).
lo_specification->set_data_type( xco_cp_abap_dictionary=>built_in_type->char( 30 ) ).
lo_specification->field_label-short->set_text( '3rd party value' ).
lo_specification->field_label-medium->set_text( '3rd party value' ).
lo_specification->field_label-long->set_text( '3rd party value' ).
lo_specification->field_label-heading->set_text( '3rd party value' ).


DATA(lo_specific) = lo_put_operation->for-dtel->add_object( 'ZVAX_TP1C_VTEXT'
  )->set_package( '<package>'
  )->create_form_specification( ).
lo_specific->set_short_description( 'PH Name' ).
lo_specific->set_data_type( xco_cp_abap_dictionary=>built_in_type->char( 40 ) ).
lo_specific->field_label-short->set_text( 'PH Name' ).
lo_specific->field_label-medium->set_text( 'PH Name' ).
lo_specific->field_label-long->set_text( 'PH Name' ).
lo_specific->field_label-heading->set_text( 'PH Name' ).

DATA(li_specific) = lo_put_operation->for-dtel->add_object( 'ZVAX_TP1C_WNAME'
  )->set_package( '<package>'
  )->create_form_specification( ).
li_specific->set_short_description( 'Plant Name' ).
li_specific->set_data_type( xco_cp_abap_dictionary=>built_in_type->char( 30 ) ).
li_specific->field_label-short->set_text( 'Plant Name' ).
li_specific->field_label-medium->set_text( 'Plant Name' ).
li_specific->field_label-long->set_text( 'Plant Name' ).
li_specific->field_label-heading->set_text( 'Plant Name' ).

lo_put_operation->execute( ).

endmethod.
ENDCLASS.
