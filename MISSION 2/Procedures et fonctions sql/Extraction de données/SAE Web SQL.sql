SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION FGetPreference(IdFood integer) RETURN VARCHAR IS
Pref VARCHAR2(200);
Val VARCHAR2(200);
BEGIN

    Val := 'None';

    SELECT alim_nom_fr INTO Pref FROM Aliments WHERE alim_code = IdFood;
    IF Pref LIKE '%vegan%' THEN
        Val := 'Vegan';
    ELSE IF Pref LIKE '%bio%' THEN
        Val := 'Bio';
    ELSE
        SELECT alim_ssssgrp_nom_fr INTO Pref FROM Aliments WHERE alim_code = IdFood;
        IF Pref LIKE '%halal%' THEN
            Val := 'Halal';
        ELSE IF Pref LIKE '%casher%' THEN
            Val := 'Casher';
        END IF;
    END IF;
    END IF;
    END IF;

    RETURN Val;

END;
/

CREATE OR REPLACE PROCEDURE PtgePref(IdAdmin INTEGER) IS
PxBio FLOAT;
PxVegan FLOAT;
PxHalal FLOAT;
PxCasher FLOAT;
PxAutres FLOAT;
CURSOR C IS
SELECT Aliment1, Aliment2, Aliment3, Aliment4, Aliment5, Aliment6, Aliment7, Aliment8, Aliment9, Aliment10 FROM SONDAGE WHERE Administre = IdAdmin;

BEGIN

    PxBio := 0;
    PxVegan := 0;
    PxHalal := 0;
    PxCasher := 0;
    PxAutres := 0;

    FOR tuple IN C LOOP

    CASE 
    WHEN FGetPreference(tuple.Aliment1) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment1) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment1) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment1) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment2) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment2) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment2) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment2) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment3) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment3) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment3) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment3) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment4) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment4) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment4) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment4) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment5) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment5) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment5) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment5) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment6) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment6) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment6) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment6) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment7) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment7) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment7) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment7) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment8) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment8) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment8) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment8) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment9) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment9) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment9) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment9) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;

    CASE 
    WHEN FGetPreference(tuple.Aliment10) = 'Vegan' THEN
    PxVegan := PxVegan + 1;
    WHEN FGetPreference(tuple.Aliment10) = 'Bio' THEN
    PxBio := PxBio + 1;
    WHEN FGetPreference(tuple.Aliment10) = 'Halal' THEN
    PxHalal := PxHalal + 1;
    WHEN FGetPreference(tuple.Aliment10) = 'Casher' THEN
    PxCasher := PxCasher + 1;
    ELSE
    PxAutres := PxAutres + 1;
    END CASE;
    END LOOP;


    dbms_output.put_line('Voici les préférences alimentaires de l administré n°' || IdAdmin);
    dbms_output.put_line('================================');
    dbms_output.put_line('Bio : ' || (PxBio/10)*100 || '%');
    dbms_output.put_line('Vegan : ' || (PxVegan/10)*100 || '%');
    dbms_output.put_line('Halal : ' || (PxHalal/10)*100 || '%');
    dbms_output.put_line('Casher : ' || (PxCasher/10)*100 || '%');
    dbms_output.put_line('Autres : ' || (PxAutres/10)*100 || '%');

END;
/

CREATE OR REPLACE PROCEDURE GetAllPref IS
CURSOR C IS
SELECT * FROM SONDAGE;
BEGIN
    FOR tuple IN C LOOP
        PtgePref(tuple.Administre);
    END LOOP;
END;
/


CREATE OR REPLACE FUNCTION FGetNumCate(IdFood integer) RETURN INTEGER IS
GrpCate INTEGER;
BEGIN
    SELECT alim_grp_code INTO GrpCate FROM Aliments WHERE alim_code = IdFood;
    RETURN GrpCate;
END;
/

CREATE OR REPLACE PROCEDURE PCountFoodCate IS
Cat1 INTEGER;
Cat2 INTEGER;
Cat3 INTEGER;
Cat4 INTEGER;
Cat5 INTEGER;
Cat6 INTEGER;
Cat7 INTEGER;
Cat8 INTEGER;
Cat9 INTEGER;
Cat10 INTEGER;
Cat11 INTEGER;
Cat12 INTEGER;
CURSOR C IS
SELECT Aliment1, Aliment2, Aliment3, Aliment4, Aliment5, Aliment6, Aliment7, Aliment8, Aliment9, Aliment10 FROM SONDAGE;

BEGIN

    Cat1 := 0;
    Cat2 := 0;
    Cat3 := 0;
    Cat4 := 0;
    Cat5 := 0;
    Cat6 := 0;
    Cat7 := 0;
    Cat8 := 0;
    Cat9 := 0;
    Cat10 := 0;
    Cat11 := 0;
    Cat12 := 0;

    FOR tuple IN C LOOP
    CASE
    WHEN FGetNumCate(tuple.Aliment1) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment1) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment2) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment2) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment3) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment3) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment4) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment4) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment5) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment5) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment6) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment6) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment7) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment7) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment8) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment8) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment9) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment9) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;

    CASE
    WHEN FGetNumCate(tuple.Aliment10) = 01 THEN
    Cat1 := Cat1 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 02 THEN
    Cat2 := Cat2 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 03 THEN
    Cat3 := Cat3 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 04 THEN
    Cat4 := Cat4 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 05 THEN
    Cat5 := Cat5 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 06 THEN
    Cat6 := Cat6 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 07 THEN
    Cat7 := Cat7 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 08 THEN
    Cat8 := Cat8 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 09 THEN
    Cat9 := Cat9 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 10 THEN
    Cat10 := Cat10 + 1;
    WHEN FGetNumCate(tuple.Aliment10) = 11 THEN
    Cat11 := Cat11 + 1;
    ELSE
    Cat12 := Cat12 + 1;
    END CASE;
    END LOOP;

    dbms_output.put_line('Voici les catégories d aliments les plus choisies');
    dbms_output.put_line('================================');
    dbms_output.put_line('Categorie 1 : ' || Cat1);
    dbms_output.put_line('Categorie 2 : ' || Cat2);
    dbms_output.put_line('Categorie 3 : ' || Cat3);
    dbms_output.put_line('Categorie 4 : ' || Cat4);
    dbms_output.put_line('Categorie 5 : ' || Cat5);
    dbms_output.put_line('Categorie 6 : ' || Cat6);
    dbms_output.put_line('Categorie 7 : ' || Cat7);
    dbms_output.put_line('Categorie 8 : ' || Cat8);
    dbms_output.put_line('Categorie 9 : ' || Cat9);
    dbms_output.put_line('Categorie 10 : ' || Cat10);
    dbms_output.put_line('Categorie 11 : ' || Cat11);

END;
/

Exec PCountFoodCate;
