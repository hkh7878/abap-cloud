@AbapCatalog.sqlViewName: 'ZBO_DEL_ITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery Item Details'
define view ZBO_ITEM as select from zlips
association to parent ZBO_DEL as _del
on $projection.vbeln = _del.vbeln
{
key vbeln,
key posnr,
matnr,
lfimg,
meins,
_del // Make association public
}
