@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection view on Student table'
@UI: { headerInfo: { title.label: 'Student Information',title.type: #STANDARD,
typeName: 'Student ',typeNamePlural: 'Students'}}
define root view entity ZSTUDENT_C as projection on
ZCDSV_STUDENT_TABLE
{
@UI.facet: [{ id: 'studentid',position: 10,label: 'Student Id',type:
#IDENTIFICATION_REFERENCE }]
@UI.lineItem: [{position: 10,type: #STANDARD }]
@UI.identification: [{position: 10,type: #STANDARD }]
key studentid,
@UI.lineItem: [{position: 20,type: #STANDARD,label: 'FNAME' }]
@UI.identification: [{position: 20,type: #STANDARD,label: 'FNAME' }]
fname,
@UI.lineItem: [{position: 30,type: #STANDARD,label: 'LNAME' }]
@UI.identification: [{position: 30,type: #STANDARD,label: 'LNAME' }]
lname,
@UI.lineItem: [{position: 40,type: #STANDARD,label: 'MNAME' }]
@UI.identification: [{position: 40,type: #STANDARD,label: 'MNAME' }]
mname,
@UI.lineItem: [{position: 50,type: #STANDARD,label: 'DOB' }]
@UI.identification: [{position: 50,type: #STANDARD,label: 'DOB' }]
dob,
@UI.lineItem: [{position: 60,type: #STANDARD,label: 'GENDER' }]
@UI.identification: [{position: 60,type: #STANDARD,label: 'GENDER' }]
gender
}
