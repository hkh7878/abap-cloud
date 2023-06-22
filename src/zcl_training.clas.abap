class ZCL_TRAINING definition
public
final
create public .
public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.
CLASS ZCL_TRAINING IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
DATA it_training TYPE standard table of ZTRAINING_TBL.
it_training = value #(
( TRAININGID = 'TRNG1' TITLE = 'S/4 HANA INTRODUCTION'
COURSEID = 'SAPPI1' STARTDATE = '20160509' ENDDATE = '20160513'
ISCOMPLETE = '' CAPACITY = '10' )
( TRAININGID = 'TRNG2' TITLE = 'ABAP ADVANCED CONCEPTS'
COURSEID = 'SAPAD1' STARTDATE = '20160510' ENDDATE =
'20160516'
ISCOMPLETE = '' CAPACITY = '15' )
( TRAININGID = 'TRNG3' TITLE = 'RESTful Progarmming' COURSEID =
'SAPABAP11' STARTDATE = '20160511' ENDDATE = '20160517'
ISCOMPLETE = '' CAPACITY = '20' )
( TRAININGID = 'TRNG4' TITLE = 'SAP ANALYTICS CLOUD'
COURSEID = 'SAPABAP12' STARTDATE = '20160512' ENDDATE =
'20160518'
ISCOMPLETE = '' CAPACITY = '10' ) ).
DELETE FROM ZTRAINING_TBL.
INSERT ZTRAINING_TBL FROM TABLE @it_training.
* clear the internal tab
clear it_training.
* check the result
SELECT * FROM ztraining_TBL INTO TABLE @it_training.
if sy-subrc is initial.
out->write( sy-dbcnt ).
out->write( 'data inserted successfully!').
out->write( it_training ).
endif.
endmethod.
ENDCLASS.

