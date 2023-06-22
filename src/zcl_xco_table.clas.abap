class ZCL_XCO_TABLE definition
  public
  final
  create public .

public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_XCO_TABLE IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
DATA(lo_package) = xco_cp_abap_repository=>package->for( '<package>' ).

** Get the instance of the transport target.
    DATA(lv_transport_target) = lo_package->read(
      )-property-transport_layer->get_transport_target( )->value.

** Create the handler instance to create repository objects
    DATA(lo_put_operation) = xco_cp_generation=>environment->dev_system(
      '<req_number>' "lo_transport_request->value
     )->create_put_operation(  ) .

     DATA(lo_database_table) = lo_put_operation->for-tabl-for-database_table->add_object( 'ZVAX_TP1_REPORT'
      )->set_package( lo_package->name
      )->create_form_specification( ).
    lo_database_table->set_short_description( 'Report Protocol' ).
    lo_database_table->set_delivery_class( xco_cp_database_table=>delivery_class->l ).
    lo_database_table->set_data_maintenance( xco_cp_database_table=>data_maintenance->allowed ).

     lo_database_table->add_field( 'MANDT'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>built_in_type->char(  3 )
      )->set_not_null( ).


       lo_database_table->add_field( 'VKORG'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>built_in_type->char( 4 )
      )->set_not_null( ).

       lo_database_table->add_field( 'PRDHA'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>built_in_type->char( 18 )
      )->set_not_null( ).

       lo_database_table->add_field( 'VTEXT'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>data_element('ZVAX_TP1C_VTEXT')
      )->set_not_null( ).

       lo_database_table->add_field( 'WERKS'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>built_in_type->char( 4 )
      )->set_not_null( ).

       lo_database_table->add_field( 'NAME1'
      )->set_key_indicator(
      )->set_type( xco_cp_abap_dictionary=>data_element('ZVAX_TP1C_WNAME')
      )->set_not_null( ).

       lo_database_table->add_field( 'VALUE_3RDP'
      )->set_type( xco_cp_abap_dictionary=>data_element('ZVAX_TP1Q_3RDPVALUE') ).


      lo_put_operation->execute( ).

endmethod.
ENDCLASS.
