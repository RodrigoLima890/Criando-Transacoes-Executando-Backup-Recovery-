DELIMITER //
CREATE PROCEDURE proc_name()
BEGIN
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- depreciada a partir do 5.5
		# get diagnostics condition 1
		# @p2 = message_text;
		# select @p2 as Transaction_Error;
		SHOW ERRORS LIMIT 1;
		ROLLBACK;
		-- select 'A transação foi encerrada devido algum erro ocorrido!' as Warning;
	END;
    START TRANSACTION;
	SET @@autocommit = 0;
    # realizar operações
    COMMIT;
END //
DELIMITER ;