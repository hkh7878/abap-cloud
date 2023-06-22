@AbapCatalog.sqlViewName: 'ZBO_DELIVERY'
@EndUserText.label: 'Delivery Details'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
define root view ZBO_DEL as select from zlikp as del
composition [0..*] of ZBO_ITEM as _item
{
key vbeln,
@UI.lineItem: [{ position: 20 }]
@EndUserText.label: 'Shipping Point'
vstel,
@UI.lineItem: [{ position: 30 }]
@EndUserText.label: 'Sales Org'
vkorg,
@UI.lineItem: [{ position: 40 }]
@EndUserText.label: 'Delivery Type'
lfart,
@UI.lineItem: [{ position: 50 }]
@EndUserText.label: 'Sales Region'
bzrik ,
@UI.lineItem: [{ position: 60 }]
@EndUserText.label: 'Shipping Condition'
vsbed,
@UI.lineItem: [{ position: 70 }]
@EndUserText.label: 'Shipping Type'
vsart,
@UI.lineItem: [{ position: 80 }]
@EndUserText.label: 'Sold to Party'
kunag,
@UI.lineItem: [{ position: 90 }]
@EndUserText.label: 'Ship to Party'
kunnr,
@UI.lineItem: [{ position: 100 }]
@EndUserText.label: 'Loading Date'
lddat,
@UI.lineItem: [{ position: 100 }]
@EndUserText.label: 'Delivery Date'
lfdat,
@UI.lineItem: [{ position: 110 }]
@EndUserText.label: 'Picking Date'
kodat ,
@UI.lineItem: [{ position: 120 }]
@EndUserText.label: 'Delivery Priority'
lprio,
@UI.lineItem: [{ position: 130 }]
@EndUserText.label: 'Loading Point'
lstel,
@UI.lineItem: [{ position: 140 }]
@EndUserText.label: 'Billing Date'
fkdat,
@UI.lineItem: [{ position: 150 }]
@EndUserText.label: 'Route'
route,
@UI.lineItem: [{ position: 160 }]
@EndUserText.label: 'PGI Date'
wadat,
@UI.lineItem: [{ position: 170 }]
@EndUserText.label: 'Picking Status'
kostk,
_item 
}
