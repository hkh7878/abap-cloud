FUNCTION ZFM_GET_SO.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_KG) TYPE  ZKG
*"  EXPORTING
*"     VALUE(LV_POUNDS) TYPE  ZLB
*"----------------------------------------------------------------------
DATA : LV_CON TYPE ZKG.
DATA : GT_LIKP TYPE TABLE OF ZLIKP,
       GS_LIKP TYPE ZLIKP,
       lv_cnt type N,
       CNT TYPE I,
       msg type string .

       LV_CON = '2.204' .
       LV_POUNDS = LV_CON * LV_KG.

ENDFUNCTION.
