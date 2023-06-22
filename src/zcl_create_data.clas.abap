CLASS zcl_create_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_CREATE_DATA IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: it_delv      TYPE TABLE OF zlikp,
          it_delv_item TYPE TABLE OF zlips,
          it_mat       TYPE TABLE of zmara.
***********************Delivery Header Data***************************
    it_delv = VALUE #(
        ( vbeln  = '80000279' vstel = 'US01' vkorg = '0001' lfart = 'NLCC'
          bzrik = 'TX0001' vsbed = '02' vsart = '01' kunag = '2345678' kunnr = '678905'
          lddat = '20190601' lfdat = '20190601' kodat = '20190602' lprio = '01' lstel = '03'
          fkdat = '20190605' route = 'US001' wadat = '20190602' kostk = 'X' )
       ( vbeln  = '80000280' vstel = 'CA01' vkorg = '0002' lfart = 'NLCC'
          bzrik = 'TX0001' vsbed = '02' vsart = '01' kunag = '2345678' kunnr = '678905'
          lddat = '20190601' lfdat = '20190601' kodat = '20190602' lprio = '01' lstel = '03'
          fkdat = '20190605' route = 'US001' wadat = '20190602' kostk = 'X' )
          ).
**Update or Insert the table entries
    MODIFY zlikp FROM TABLE @it_delv.
    out->write( 'Data inserted into LIKP table successfully!').
**********************************************************************
***********************Delivery Item Data*****************************
it_delv_item = VALUE #(
    (  vbeln = '80000279' posnr = '000001' matnr = 'XX-F01' lfimg = 25 meins = 'PC')
    (  vbeln = '80000279' posnr = '000002' matnr = 'YY-F01' lfimg = 50 meins = 'PC')
    (  vbeln = '80000280' posnr = '000001' matnr = 'XX-F01' lfimg = 10 meins = 'PC')
    (  vbeln = '80000280' posnr = '000002' matnr = 'YY-F01' lfimg = 12 meins = 'PC')
    (  vbeln = '80000280' posnr = '000003' matnr = 'ZZ-F01' lfimg = 30 meins = 'PC')
).
**Update or Insert the table entries
    MODIFY zlips FROM TABLE @it_delv_item.
    out->write( 'Data inserted into LIPS table successfully!').
**************************************************************************
***********************Material Master Data*******************************
it_mat = value #(
**Trading Goods - Non Packaging materials
    (  matnr = 'XX-F01' mtart = 'HAWA' laeng = 10 breit = 10 hoehe = 10 meins = 'CM' )
    (  matnr = 'YY-F01' mtart = 'HAWA' laeng =  8 breit =  8 hoehe =  8 meins = 'CM' )
    (  matnr = 'ZZ-F01' mtart = 'HAWA' laeng = 15 breit = 10 hoehe = 12 meins = 'CM' )
**Packaging materials
    (  matnr = 'PACK-16' mtart = 'VERP' laeng = 30 breit = 30 hoehe = 30 meins = 'CM' )
    (  matnr = 'PACK-17' mtart = 'VERP' laeng = 25 breit = 25 hoehe = 25 meins = 'CM' )
    (  matnr = 'PACK-21' mtart = 'VERP' laeng = 20 breit = 20 hoehe = 20 meins = 'CM' )
).
**Update or Insert the table entries
    MODIFY zmara FROM TABLE @it_mat.
    out->write( 'Data inserted into MARA table successfully!').
**************************************************************************
  ENDMETHOD.
ENDCLASS.

