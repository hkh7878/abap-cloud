@AbapCatalog.sqlViewName: 'ZCDS_TRAINING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view on training table'
define view ZCDSTRAINING as select from ztraining_tbl as TRAINING
{
key TRAINING.trainingid as TRAININGID,
TRAINING.title as TITLE,
TRAINING.courseid as COURSEID,
TRAINING.startdate as STDATE,
TRAINING.enddate as ENDDATE,
TRAINING.iscomplete as STATUS,
TRAINING.capacity as CAPACITY }
