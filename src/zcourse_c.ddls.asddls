@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection view on Course table'
@UI: { headerInfo: { title.label: 'Course Details',title.type: #STANDARD,
typeName: 'Course',typeNamePlural: 'Courses'}}
define root view entity ZCOURSE_C as projection on
ZCDSV_COURSE_TABLE
{
  @UI.facet: [{ id: 'courseid',position: 10,label: 'Course Id',type: #IDENTIFICATION_REFERENCE }] 
  @UI.lineItem: [{position: 10,type: #STANDARD }]
  @UI.identification: [{position: 10,type: #STANDARD }]   
  key courseid,
  @UI.lineItem: [{position: 20,type: #STANDARD,label: 'coursename' }]
  @UI.identification: [{position: 20,type: #STANDARD,label: 'Course Name' }]
      coursename,
      @UI.lineItem: [{position: 30,type: #STANDARD,label: 'VirtualPossible' }]
      @UI.identification: [{position: 30,type: #STANDARD,label: 'VirtualPossible' }]
      virtualpossible,
      @UI.lineItem: [{position: 40,type: #STANDARD,label: 'IsHandsOn' }]
      @UI.identification: [{position: 40,type: #STANDARD,label: 'IsHandsOn' }]
      ishandson,
      @UI.lineItem: [{position: 50,type: #STANDARD,label: 'Total Marks' }]
      @UI.identification: [{position: 50,type: #STANDARD,label: 'Total Marks' }]
      totalmarks,
      @UI.lineItem: [{position: 60,type: #STANDARD,label: 'Cut of Marks' }]
      @UI.identification: [{position: 60,type: #STANDARD,label: 'Cut of Marks' }]
      cutofmarks ,
      @UI.lineItem: [{position: 70,type: #STANDARD,label: 'Start Date' }]
      @UI.identification: [{position: 70,type: #STANDARD,label: 'Start Date' }]
      start_date,
      @UI.lineItem: [{position: 80,type: #STANDARD,label: 'End Date' }]
      @UI.identification: [{position: 80,type: #STANDARD,label: 'End Date' }]
      end_date,
      @UI.lineItem: [{position: 90,type: #STANDARD,label: 'IsComplete' }]
      @UI.identification: [{position: 90,type: #STANDARD,label: 'IsComplete' }]
      iscomplete,
      @UI.lineItem: [{position: 100,type: #STANDARD,label: 'Capacity' }]
      @UI.identification: [{position: 100,type: #STANDARD,label: 'Capacity' }]
      capacity
}
