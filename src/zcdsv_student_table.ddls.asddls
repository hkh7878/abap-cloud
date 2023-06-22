@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View on student table'
define root view entity ZCDSV_STUDENT_TABLE as select from
zstudent_table
{
key studentid ,
fname ,
lname ,
mname ,
dob ,
gender
}
