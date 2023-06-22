@EndUserText.label: 'Custom entity to get cus details via RFC'
@ObjectModel:{
    query: {
        implementedBy: 'ABAP:ZCL_CUST_GETLIST'
    }
}
define root custom entity ZCE_CUST_VIA_RFC 
{

 @UI.facet     : [
           {
             id     :       'Customer',
             purpose:  #STANDARD,
             type   :     #IDENTIFICATION_REFERENCE,
             label  :    'Customer',
             position  : 10 }
         ]
         @UI           : {
      lineItem      : [{position: 10, importance: #HIGH}],
      identification: [{position: 10}],
      selectionField: [{position: 10}]
      }
      
key CUSTOMERID     : abap.char( 8 );
      TypeCode      : abap.char( 2 );
      @UI           : {
      lineItem      : [{position: 20, importance: #HIGH}],
      identification: [{position: 20}],
      selectionField: [{position: 20}]
      }
      
     CUSTNAME       : abap.char( 25 );
      @UI           : {
      lineItem      : [{position: 30, importance: #HIGH}],
      identification: [{position: 30}]
      }
      FORM           : abap.char( 15 );
      @UI           : {
      identification: [{position: 40}]
      }
      STREET : abap.char( 30 ) ; 
      POBOX  : abap.char( 10 ) ;
      POSTCODE : abap.char ( 25 );
      CITY     : abap.char ( 25 ) ;
      COUNTR   : abap.char ( 3 ) ;
      COUNTR_ISO : abap.char ( 2 );
      REGION     : abap.char ( 3 );
      PHONE      : abap.char ( 30 );
      EMAIL      : abap.char ( 40 );
}
