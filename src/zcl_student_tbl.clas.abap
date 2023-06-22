class ZCL_STUDENT_TBL definition
  public
  final
  create public .
public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_STUDENT_TBL IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

data : lt_student type standard table of ZSTUDENT_TBL.

  lt_student = value #(
      ( studentid = '1000101' fname = 'RAKESH'  lname = 'KUMAR' gender = 'M' birthdate = '19900414' commnumber = '101' )
      ( studentid = '1000102' fname = 'SUNITA' lname = 'RAVAL' gender = 'F' birthdate = '19900612' commnumber = '102' )
      ( studentid = '1000103' fname = 'BHAVAN' lname = 'SHARMA' gender = 'M' birthdate = '19900911' commnumber = '103')
      ( studentid = '1000104' fname = 'MOHAMMAD' lname = 'KHAN' gender = 'M' birthdate = '19890612' commnumber = '104')
      ( studentid = '1000105' fname = 'JENNIFER' lname = 'DESOZA' gender = 'F' birthdate = '19900403' commnumber = '105')
      ( studentid = '1000106' fname = 'PRIYANK' lname = 'CHATURVEDI' gender = 'M' birthdate = '19911206' commnumber = '106')
      ( studentid = '1000107' fname = 'RISHABH' lname = 'BHAT' gender = 'M' birthdate = '19911125' commnumber = '107')
      ( studentid = '1000108' fname = 'MUKESH' lname = 'SAHANI' gender = 'M' birthdate = '19891010' commnumber = '108')
      ( studentid = '1000109' fname = 'KETKI' lname = 'BHAT' gender = 'F' birthdate = '19900501' commnumber = '109')
      ( studentid = '1000110' fname = 'KANHA' lname = 'PANDE' gender = 'M' birthdate = '19910923' commnumber = '110')
      ).


        DELETE FROM ZSTUDENT_TBL.

        INSERT ZSTUDENT_TBL FROM TABLE @lt_student.

    clear lt_student.  "clear internal table

    SELECT * FROM ZSTUDENT_TBL INTO TABLE @lt_student .  "check result

    if sy-subrc is initial.

    out->write( 'data inserted successfully!').
    out->write( lt_student ).

    endif.
endmethod.
ENDCLASS.
