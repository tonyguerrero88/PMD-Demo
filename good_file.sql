CREATE TABLE IHD_13860 AS
select *
      from cm_transaction t
     where t.cm_transaction_pk in (
9999999999
); 

DECLARE
  CURSOR void_tr IS
    select *
      from cm_transaction t
     where t.cm_transaction_pk IN (
9999999999
); 

BEGIN
  execute immediate ('alter trigger upd_cm_ftran_val disable');
  execute immediate ('alter trigger cm_txn_vw_upd disable');
  execute immediate ('alter trigger upd_cm_ftran_detail_val disable');

  FOR tt IN void_tr LOOP

   UPDATE CM_TRANS_STATUS_HISTORY H
       SET  H.STATUS_START_DATE = TO_DATE('12/21/2021', 'mm/dd/yyyy')
     WHERE H.CM_TRANSACTION_FK = tt.cm_transaction_pk
       AND H.CM_TRANSACTION_STATUS_CODE = 'VOID';

END LOOP;


              execute immediate ('alter trigger upd_cm_ftran_val enable');
execute immediate ('alter trigger cm_txn_vw_upd enable');
execute immediate ('alter trigger upd_cm_ftran_detail_val enable');
end;
-------------

INSERT INTO BUILD_APPLIED (owner, build_id, timestamp)
VALUES(user, 'IHD_13860', sysdate);

DROP TABLE IHD_13860; 