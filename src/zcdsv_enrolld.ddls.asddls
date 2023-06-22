@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Enroll CDS view for draft scenario'
define view entity ZCDSV_ENROLLD as select from zenroll_d 
//    association to parent ZCDSV_STUDENTD as _Student on $projection.Studentuuid = _Student.Studentuuid
    association to parent ZCDSV_COURSED as _Course on $projection.Courseuuid = _Course.Courseuuid
    
    association [1..1] to ZCDSV_STUDENT_TABLE as _Student on $projection.Studentid = _Student.studentid
{
    key enroll_uuid as EnrollUuid,
    courseuuid as Courseuuid,
    studentid as Studentid,
    status as Status,
    marks as Marks,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    //local ETag field --> OData ETag
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    //Associations
    _Course,
    _Student
}
