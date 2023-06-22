@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Course CDS view for draft scenario'
define root view entity ZCDSV_COURSED as select from zcourse_d 
    composition [0..*] of ZCDSV_ENROLLD as _Enroll
{
    key courseuuid as Courseuuid,
    courseid as Courseid,
    coursename as Coursename,
    virtualpossible as Virtualpossible,
    ishandson as Ishandson,
    totalmarks as Totalmarks,
    cutofmarks as Cutofmarks,
    start_date as StartDate,
    end_date as EndDate,
    iscomplete as Iscomplete,
    capacity as Capacity,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    //local ETag field --> OData ETag
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    last_changed_at as LastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
    //Associations
    _Enroll
}
