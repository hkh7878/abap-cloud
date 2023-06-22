@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View on AUFM table'
define root view entity ZCDS_AUFM
as select from zaufm as a
{
@UI.facet: [{ id: 'mblnr',position: 10,label: 'Material Doc Number',type:
#IDENTIFICATION_REFERENCE }]
@UI.lineItem: [{position: 10,type: #STANDARD }]
@UI.identification: [{position: 10,type: #STANDARD }]
key a.mblnr ,
@UI.lineItem: [{position: 20,type: #STANDARD,label: 'Material Doc Year'
}]
@UI.identification: [{position: 20,type: #STANDARD,label: 'Material Doc
Year' }]
key a.mjahr ,
@UI.lineItem: [{position: 30,type: #STANDARD,label: 'Material Doc Item'
}]
@UI.identification: [{position: 30,type: #STANDARD,label: 'Material Doc
Item' }]
key a.zeile ,
@UI.lineItem: [{position: 40,type: #STANDARD,label: 'Doc Date' }]
@UI.identification: [{position: 40,type: #STANDARD,label: 'Doc Date' }]
a.bldat ,
@UI.lineItem: [{position: 50,type: #STANDARD,label: 'Doc Posting Date' }]
@UI.identification: [{position: 50,type: #STANDARD,label: 'Doc Posting
Date' }]
a.budat ,
@UI.lineItem: [{position: 60,type: #STANDARD,label: 'Movement Type' }]
@UI.identification: [{position: 60,type: #STANDARD,label: 'Movement
Type' }]
a.bwart ,
@UI.lineItem: [{position: 70,type: #STANDARD,label: 'Material Number' }]
@UI.identification: [{position: 70,type: #STANDARD,label: 'Material
Number' }]
a.matnr ,
@UI.lineItem: [{position: 80,type: #STANDARD,label: 'Plant' }]
@UI.identification: [{position: 80,type: #STANDARD,label: 'Plant' }]
a.werks ,
@UI.lineItem: [{position: 90,type: #STANDARD,label: 'Storage Location' }]
@UI.identification: [{position: 90,type: #STANDARD,label: 'Storage
Loacation' }]
a.lgort
}
