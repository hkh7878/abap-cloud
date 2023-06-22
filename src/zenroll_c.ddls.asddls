@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection view on Enroll table'
@UI: { headerInfo: { title.label: 'Course Enrollment Details',title.type:
#STANDARD,
typeName: 'Enroll',typeNamePlural: 'Enrolls'}}
define root view entity ZENROLL_C as projection on
ZCDSV_ENROLL_TABLE
{
@UI.facet: [{ id: 'studentid',position: 10,label: 'Student Id',type:
#IDENTIFICATION_REFERENCE }]
@UI.lineItem: [{position: 10,type: #STANDARD }]
@UI.identification: [{position: 10,type: #STANDARD }]
key Studentid,
@UI.lineItem: [{position: 20,type: #STANDARD,label: 'Course Id' }]
@UI.identification: [{position: 20,type: #STANDARD,label: 'Course Id' }]
key Courseid,
@UI.lineItem: [{position: 30,type: #STANDARD,label: 'Status' }]
@UI.identification: [{position: 30,type: #STANDARD,label: 'Status' }]
Status,
@UI.lineItem: [{position: 40,type: #STANDARD,label: 'Marks' }]
@UI.identification: [{position: 40,type: #STANDARD,label: 'Marks' }]
Marks
}
