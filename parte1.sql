SET @@autocommit = 0;

START TRANSACTION;
# INSERT/UPDATE TABLE
# é possivel fazer um savepoint após um insert ou update, e fazer o rollback para um savepoint
SAVEPOINT savepoint_name;
# ROLLBACK savepoint_name;
# caso de erro fazer o rollback automatico

COMMIT;