@AbapCatalog.sqlViewName: 'ZCDS_ENROLL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view on ENROLL Table'
define view ZCDSENROLL as select from zenroll {
key zenroll.trainingid as TRNGID,
key zenroll.studentid as STUDENTID,
zenroll.status as STATUS,
zenroll.marks as MARKS,
zenroll.note as NOTE
}
