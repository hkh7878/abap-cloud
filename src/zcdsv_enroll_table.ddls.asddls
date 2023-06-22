@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View on StudentEnroll table'
define root view entity ZCDSV_ENROLL_TABLE as select from
zstudent_enroll
association  [0..*] to  zcourse_table as _course on  _course.courseid   = $projection.Courseid
association [0..*] to  zstudent_table as _student on  _student.studentid   = $projection.Studentid
{
    key studentid as Studentid,
    key courseid as Courseid,
    status as Status,
    marks as Marks,
      // associations
    _student,
    _course
}
