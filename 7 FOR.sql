-- FOR



FOR
/* Usando reverse e do maior para o menor e sem é do menor para o menor*/
for counter in [REVERSE] 
  ...........
LOOP


END LOOP; 



DECLARE
	V_COUNTRYID   LOCATIONS.COUNTRY_ID%TYPE := 'CA';
	V_LOC_ID	  LOCATIONS.LOCATION_ID%TYPE;
	V_NEW_CITY	  LOCATIONS.CITY%TYPE :='Montreal';

BEGIN
	SELECT MAX(LOCATION_ID) INTO V_LOC_ID 
		FROM LOCATIONS
		WHERE COUNTRY_ID = V_COUNTRYID;

	FOR I IN 1..3 LOOP
		INSERT INTO LOCATIONS(LOCATION_ID, CITY, COUNTRY_ID) VALUES ((V_LOC_ID + I),
		 V_NEW_CITY, V_COUNTRYID);
	END LOOP;

END;



-- CONTINUE


DECLARE
	V_TOTAL SIMPLE_INTEGER := 0;
BEGIN
	FOR I IN 1..10 LOOP
		V_TOTAL := V_TOTAL + 1;
		DBMS_OUTPUT_PUT_LINE (I || 'Total é: ' || V_TOTAL);
		CONTINUE WHEN I>5;

		V_TOTAL := V_TOTAL + 1;
		DBMS_OUTPUT.PUT_LINE( I || 'Fora do loop p/ Continue: ' || V_TOTAL);
	END LOOP;
END;



DECLARE
	V_TOTAL NUMBER := 0;
BEGIN
	<<BeforeTopLoop>>
	FOR I IN 1..10 LOOP
	V_TOTAL := V_TOTAL + 1;
	DBMS_OUTPUT.PUT_LINE
		('Total is : ' || V_TOTAL);
		FOR J IN 1..10 LOOP
			CONTINUE BeforeTopLoop WHEN I + J > 5;
			V_TOTAL := V_TOTAL + 1;
		END LOOP;
	END LOOP;

END two_loop;




BEGIN 
    FOR V_NR IN REVERSE 400 .. 500 LOOP
        IF MOD(V_NR,2) = 0 THEN
            INSERT INTO RELATORIO VALUES (V_NR, 'Numero - ' || V_NR);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Contador: ' || V_NR);
    END LOOP;
    COMMIT;
END;


SELECT * FROM RELATORIO;