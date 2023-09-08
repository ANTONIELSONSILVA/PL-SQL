-- WHILE


DECLARE
	V_COUNTRYID   LOCATIONS.COUNTRY_ID%TYPE := 'CA';
	V_LOC_ID	  LOCATIONS.LOCATION_ID%TYPE;
	V_COUNTER	  NUMBER(2) := 1;
	V_NEW_CITY	  LOCATIONS.CITY%TYPE :='Montreal';

BEGIN
	SELECT MAX(LOCATION_ID) INTO V_LOC_ID FROM LOCATIONS
		WHERE COUNTRY_ID = V_COUNTRYID;

	WHILE V_COUNTER <= 3 LOOP
		INSERT INTO LOCATIONS(LOCATION_ID, CITY, COUNTRY_ID) VALUES ((V_LOC_ID + V_COUNTER),
		 V_NEW_CITY, V_COUNTRYID);
		V_COUNTER := V_COUNTER + 1;
	END LOOP;

END;




DECLARE
	V_NR1 INTEGER := 1;
	V_NR1 INTEGER := 1;
BEGIN
	DELETE MENSAGEM;

	LOOP
		INSERT INTO MENSAGEM VALUES('loop - volta - ' || V_NR1);
		EXIT WHEN V_NR1 = 10;
		V_NR1 := V_NR1 + 1;
	END LOOP;

	WHILE V_NR2 <= 10 LOOP
		INSERT INTO MENSAGEM VALUES (' while - volta - ' || V_NR2);
		V_NR2 := V_NR2 + 1;
	END LOOP;
END;

SELECT * FROM MENSAGEM;



CREATE TABLE RELATORIO(
    NR NUMBER(4),
    MENSAGEM VARCHAR(100)
);


DECLARE
    V_COUNT     RELATORIO.NR%TYPE := 100;
BEGIN

    --WHILE V_COUNT < 100 LOOP
    WHILE V_COUNT BETWEEN 100 AND 200 LOOP
        IF MOD(V_COUNT,2) = 0 THEN  /*TESTANDO SE O NÚMERO É PAR*/
            INSERT INTO RELATORIO VALUES(V_COUNT, TO_CHAR('Numero - ' || V_COUNT));
        END IF;
        
        V_COUNT := V_COUNT + 1;
    END LOOP
    COMMIT;
END;


DELETE RELATORIO;
DELETE FROM RELATORIO;


SELECT * FROM RELATORIO WHERE NR > 100;
SELECT * FROM RELATORIO;


DECLARE
    V_NR RELATORIO.NR%TYPE := 200;
    
BEGIN
    DELETE FROM RELATORIO;
    
    WHILE V_NR BETWEEN 200 AND 300 LOOP
        IF MOD(V_NR,2) = 0 THEN
            INSERT INTO RELATORIO VALUES(V_NR, 'Numero - ' || V_NR);
        END IF;
        V_NR := V_NR + 1;
    END LOOP;
    COMMIT;
END;
    
    
SELECT * FROM RELATORIO WHERE NR > 200;



