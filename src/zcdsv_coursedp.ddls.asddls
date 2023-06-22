@EndUserText.label: 'Projection for ZCDSV_COURSED'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZCDSV_COURSEDP as projection on ZCDSV_COURSED {
    key Courseuuid,
    Courseid,
    Coursename,
    Virtualpossible,
    Ishandson,
    Totalmarks,
    Cutofmarks,
    StartDate,
    EndDate,
    Iscomplete,
    Capacity,
    LastChangedBy,
    LastChangedAt,
    ChangedAt,
    /* Associations */
    _Enroll : redirected to composition child ZCDSV_ENROLLP
}
