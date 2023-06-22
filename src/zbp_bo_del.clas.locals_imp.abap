CLASS lhc_Delivery DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Delivery.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Delivery.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Delivery.

    METHODS read FOR READ
      IMPORTING keys FOR READ Delivery RESULT result.

    METHODS cba_item FOR MODIFY
      IMPORTING entities_cba FOR CREATE Delivery\_item.

    METHODS rba_item FOR READ
      IMPORTING keys_rba FOR READ Delivery\_item FULL result_requested RESULT result LINK association_links.

*    METHODS set_status_del FOR MODIFY
*      IMPORTING keys FOR ACTION Delivery~set_status_del RESULT result.

     METHODS lock FOR LOCK
        IMPORTING lt_del FOR LOCK DELIVERY.


ENDCLASS.

CLASS lhc_Delivery IMPLEMENTATION.

  METHOD create.

  data: lt_del type table of ZLIKP.

        LT_DEL = value #(  FOR LS_DEL  IN ENTITIES

         (
            VBELN  = LS_DEL-vbeln
            VSTEL  = LS_DEL-vstel
            VKORG  = LS_DEL-vkorg
            LFART  = LS_DEL-lfart
            BZRIK  = LS_DEL-bzrik
            VSBED  = LS_DEL-vsbed
            Vsart  = LS_DEL-vsart
            KUNAG  = LS_DEL-kunag
            KUNNR  = LS_DEL-kunnr
            LDDAT  = LS_DEL-LDDAT
            LFDAT  = LS_DEL-LFDAT
            KODAT  = LS_DEL-kodat
            LPRIO  = LS_DEL-LPRIO
            LSTEL  = LS_DEL-LSTEL
            FKDAT  = LS_DEL-fkdat
            ROUTE  = LS_DEL-ROUTE
            WADAT  = LS_DEL-wadat
            KOSTK  = LS_DEL-KOSTK
         ) ).
 INSERT ZLIKP FROM TABLE @LT_DEL.

  ENDMETHOD.

  METHOD delete.

  data: lt_del type RANGE OF CHAR10.
        lt_del = VALUE #(
        FOR ls_del IN keys
        (
            sign  = 'I'
            option = 'EQ'
            low = ls_del-vbeln
        )
    ).

    DELETE FROM ZLIKP WHERE VBELN IN @lt_del.

  ENDMETHOD.

  METHOD update.

  data: lt_del type table of ZLIKP.

        LT_DEL = value #(  FOR LS_DEL  IN ENTITIES

         (
            VBELN  = LS_DEL-vbeln
            VSTEL  = LS_DEL-vstel
            VKORG  = LS_DEL-vkorg
            LFART  = LS_DEL-lfart
            BZRIK  = LS_DEL-bzrik
            VSBED  = LS_DEL-vsbed
            Vsart  = LS_DEL-vsart
            KUNAG  = LS_DEL-kunag
            KUNNR  = LS_DEL-kunnr
            LDDAT  = LS_DEL-LDDAT
            LFDAT  = LS_DEL-LFDAT
            KODAT  = LS_DEL-kodat
            LPRIO  = LS_DEL-LPRIO
            LSTEL  = LS_DEL-LSTEL
            FKDAT  = LS_DEL-fkdat
            ROUTE  = LS_DEL-ROUTE
            WADAT  = LS_DEL-wadat
            KOSTK  = LS_DEL-KOSTK
         ) ).

         UPDATE ZLIKP FROM table @lt_del.

  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD cba_item.

  data: lt_item type table of ZLIPS.

        LT_ITEM = value #(
        for ls_entity in entities_cba
         FOR ls_item IN ls_entity-%target
         (
           VBELN = ls_item-vbeln
           POSNR = ls_item-posnr
           MATNR = ls_item-matnr
           LFIMG = ls_item-lfimg
           MEINS = ls_item-meins
        )
        ).
        insert ZLIPS FROM TABLE @LT_ITEM.
  ENDMETHOD.

  METHOD rba_item.
  ENDMETHOD.

*  METHOD set_status_del.
*  ENDMETHOD.

 METHOD lock.
    TRY.
    "Instantiate lock object
    DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'ZBO_DEL' ).
      CATCH cx_abap_lock_failure INTO DATA(lr_exp).
        RAISE SHORTDUMP lr_exp.
    ENDTRY.

    LOOP AT lt_del  ASSIGNING FIELD-SYMBOL(<fs_del>).
      TRY.
          "enqueue travel instance
          lock->enqueue(
              it_parameter  = VALUE #( (  name = 'DELIVERY' value = REF #( <fs_del>-vbeln ) ) )
          ).


        CATCH cx_abap_lock_failure into lr_exp.
          RAISE SHORTDUMP lr_exp.
      ENDTRY.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
