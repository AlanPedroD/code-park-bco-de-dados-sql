SELECT COUNT(*) AS total_cadastrados
FROM clientes
WHERE data_cadastro = TO_DATE('2024-12-03', 'YYYY-MM-DD');

CREATE OR REPLACE FUNCTION contar_clientes_cadastrados(p_data DATE)
RETURN NUMBER IS
    total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM clientes
    WHERE data_cadastro = p_data;
    
    RETURN total;
END;
/

DECLARE
    total_cadastrados NUMBER;
BEGIN
    total_cadastrados := contar_clientes_cadastrados(TO_DATE('2024-12-03', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Total de clientes cadastrados: ' || total_cadastrados);
END;
/
