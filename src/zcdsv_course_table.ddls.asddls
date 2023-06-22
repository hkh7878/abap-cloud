@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View on Course table'
define root view entity ZCDSV_COURSE_TABLE as select from
zcourse_table
{
key courseid ,
  coursename ,
  virtualpossible ,
  ishandson       ,
  totalmarks      ,
  cutofmarks ,
  start_date  ,
  end_date  ,
  iscomplete  ,
  capacity } 
