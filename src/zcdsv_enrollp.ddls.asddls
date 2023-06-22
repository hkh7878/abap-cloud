@EndUserText.label: 'Projection for ZCDSV_ENROLLD'
@AccessControl.authorizationCheck: #CHECK
define view entity ZCDSV_ENROLLP as projection on ZCDSV_ENROLLD {
    key EnrollUuid,
    Courseuuid,
    Studentid,
    Status,
    Marks,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Course: redirected to parent ZCDSV_COURSEDP,
    _Student
}
