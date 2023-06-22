class ZCL_ENROLL definition
public
final
create public .
public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.
CLASS ZCL_ENROLL IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
data : lt_enroll type standard table of zenroll.
lt_enroll = value #(
( trainingid = 'TRNG1' studentid = '1000101' status = 'PASS' MARKS = '88.8'
)
( trainingid = 'TRNG1' studentid = '1000105' status = 'PASS' MARKS = '92.0'
)
( trainingid = 'TRNG1' studentid = '1000103' status = 'PASS' MARKS = '90.0'
)
( trainingid = 'TRNG1' studentid = '1000105' status = 'FAIL' MARKS = '68.0' )
( trainingid = 'TRNG2' studentid = '1000102' status = 'PASS' MARKS = '88.8'
)
( trainingid = 'TRNG2' studentid = '1000104' status = 'PASS' MARKS = '92.0'
)
( trainingid = 'TRNG2' studentid = '1000103' status = 'PASS' MARKS = '90.0'
)
( trainingid = 'TRNG2' studentid = '1000105' status = 'FAIL' MARKS = '60.0'
)
( trainingid = 'TRNG3' studentid = '1000101' status = 'PASS' MARKS = '88.8'
)
( trainingid = 'TRNG3' studentid = '1000102' status = 'PASS' MARKS = '92.0'
)
( trainingid = 'TRNG3' studentid = '1000103' status = 'PASS' MARKS = '90.0'
)
( trainingid = 'TRNG3' studentid = '1000104' status = 'FAIL' MARKS = '56.0' )
( trainingid = 'TRNG3' studentid = '1000105' status = 'PASS' MARKS = '88.8'
)
( trainingid = 'TRNG3' studentid = '1000106' status = 'PASS' MARKS = '92.0'
)
( trainingid = 'TRNG4' studentid = '1000109' status = 'PASS' MARKS = '90.0'
)
( trainingid = 'TRNG4' studentid = '1000110' status = 'PASS' MARKS = '93.0'
) ).

DELETE FROM ZENROLL.
INSERT ZENROLL FROM TABLE @lt_enroll.
* clear the internal tab
clear lt_enroll.
* check the result
SELECT * FROM ZENROLL INTO TABLE @lt_enroll.
if sy-subrc is initial.
out->write( sy-dbcnt ).
out->write( 'data inserted successfully!').
out->write( lt_enroll ).
endif.
endmethod.
ENDCLASS.

