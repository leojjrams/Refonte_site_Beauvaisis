/********* DEBUT SCRIPT NUTRISCORE
/ 1 ère partie Fonctions calculant le point à attrivuer en fonction des macronutriments(proteines ect)
et des micronutriments (fibres,sodium) **********/
-- nous avons calculé le nutriscore en s'aidant du site https://quoidansmonassiette.fr/comment-est-calcule-le-nutri-score-logo-nutritionnel/#:~:text=Ce%20score%20est%20bas%C3%A9%20sur,le%20sel%20(mg%2F100g) --

--fonction pour l'energie--
CREATE OR REPLACE FUNCTION PointEnergie(alim_code_ NUMBER) RETURN INTEGER
IS
VEnergie INTEGER;
VPoints INTEGER;
Valeur INTEGER;
BEGIN
Valeur :=0;
VPoints :=0;
SELECT EnergieKj INTO VEnergie FROM ALIMENTS WHERE  alim_code=alim_code_;
FOR loop_counter IN 0..10 LOOP
	IF VEnergie  > Valeur THEN
		VPoints:=loop_counter;
	END IF;
	Valeur :=Valeur+335;
END LOOP;
RETURN VPoints;
END; 
/
--fonction pour le sucre--
CREATE OR REPLACE FUNCTION PointSucres(alim_code2 NUMBER) RETURN NUMBER
IS
VSucres numeric;
VPoints numeric;
Valeur numeric ;
BEGIN
Valeur :=0;
VPoints := 0;
SELECT Sucres INTO VSucres FROM ALIMENTS WHERE  alim_code=alim_code2;
FOR loop_counter IN 0..10 LOOP
	IF VSucres  <= Valeur THEN
		VPoints:=loop_counter;
		RETURN VPoints;
	END IF;
	Valeur := Valeur+1.5;
END LOOP;
IF VSucres  >Valeur THEN
	VPoints:=10;
END IF;
RETURN VPoints;
END; 
/

--fonction pour les fibres--
CREATE OR REPLACE FUNCTION PointFibre(alim_code_ NUMBER) RETURN NUMBER
IS
VFibres numeric;
VPoints integer;
Valeur integer;
BEGIN
Valeur :=0;
VPoints :=0;
SELECT Fibres_alimentaires INTO VFibres FROM ALIMENTS WHERE  alim_code=alim_code_;
FOR loop_counter IN 0..5 LOOP
	IF VFibres  > Valeur THEN
		VPoints:=loop_counter;
	END IF;
	Valeur :=Valeur+0.7;
END LOOP;
RETURN VPoints;
END; 
/

--fonction pour les graisses--
CREATE OR REPLACE FUNCTION PointGraisses(alim_code2 NUMBER) RETURN NUMBER
IS
VGraisses numeric;
VPoints numeric;
Valeur integer;
BEGIN
Valeur :=0;
VPoints :=0;
SELECT AG_satures INTO VGraisses FROM ALIMENTS WHERE  alim_code = alim_code2;
FOR loop_counter IN 0..10 LOOP
	IF VGraisses  > loop_counter THEN
		VPoints:=loop_counter;
	END IF;
END LOOP;
RETURN VPoints;
END;
/

--fonction pour le sucre des boissons--
CREATE OR REPLACE FUNCTION PointSucresBoisson(alim_code2 NUMBER) RETURN NUMBER
IS
VSucres numeric;
VPoints numeric;
Valeur integer ;
BEGIN
Valeur :=0;
VPoints :=0;
SELECT Sucres INTO VSucres FROM ALIMENTS WHERE  alim_code=alim_code2;
FOR loop_counter IN 0..10 LOOP
	IF VSucres  > Valeur THEN
		VPoints:=loop_counter;
	END IF;
	Valeur := Valeur+4.5;
END LOOP;
RETURN VPoints;
END;
/ 

--fonction pour l'énérgie des boissons--
CREATE OR REPLACE FUNCTION PointEnergieBoisson(alim_code_ NUMBER) RETURN NUMBER
IS
VEnergie numeric;
VPoints integer;
Valeur integer;
BEGIN
VPoints :=0;
Valeur :=0;
SELECT EnergieKj INTO VEnergie FROM ALIMENTS WHERE  alim_code=alim_code_;
FOR loop_counter IN 0..10 LOOP
	IF VEnergie  <= Valeur THEN
		VPoints:=loop_counter;
		RETURN VPoints;
	END IF;
	Valeur :=Valeur+30;
END LOOP;
IF VEnergie  >Valeur THEN
	VPoints:=10;
END IF;
RETURN VPoints;
END; 
/

--fonction pour le sodium--
CREATE OR REPLACE FUNCTION PointSodium (alim_code_ NUMBER) RETURN NUMBER
IS
VPointSodium NUMBER;
VSodium NUMBER;
Valeur NUMBER;
BEGIN 
VPointSodium :=0;
Valeur :=0;
SELECT Sodium INTO VSodium FROM ALIMENTS WHERE  alim_code=alim_code_;
FOR loop_counter IN 0..10 LOOP
    IF VSodium  > Valeur THEN
        VPointSodium:=loop_counter;
    END IF;
    Valeur := Valeur+90;
END LOOP;
RETURN VPointSodium;
END;
/

--fonction pour les protéines--
CREATE OR REPLACE FUNCTION PointProteine(alim_code_ NUMBER) RETURN NUMBER
IS
VProteines NUMBER;
VPoints NUMBER;
Valeur NUMBER;
BEGIN
VPoints :=0;
Valeur :=0;
SELECT Proteines INTO VProteines FROM ALIMENTS WHERE  alim_code = alim_code_;
FOR loop_counter IN 0..5 LOOP
	IF VProteines  > Valeur THEN
		VPoints:=loop_counter;
	END IF;
	Valeur := Valeur+1.6;
END LOOP;
RETURN VPoints;
END; 
/

--fonction pour les fibres--
CREATE OR REPLACE FUNCTION PointFibres(alim_code_ NUMBER) RETURN NUMBER
IS
VFibres numeric;
VPoints integer;
Valeur integer;
BEGIN
VPoints :=0;
Valeur :=0;
SELECT Fibres_alimentaires INTO VFibres FROM ALIMENTS WHERE  alim_code=alim_code_;
FOR loop_counter IN 0..5 LOOP
	IF VFibres  > Valeur THEN
		VPoints:=loop_counter;
	END IF;
	Valeur :=Valeur+0.7;
END LOOP;
RETURN VPoints;
END;
/


--fonction renvoyant le nombre de points d'une boisson-- 
CREATE OR REPLACE FUNCTION PointBoisson(alim_code_ NUMBER) RETURN NUMBER
IS
VPositifs NUMBER;
VNegatifs NUMBER;
BEGIN 
VPositifs := PointEnergieBoisson(alim_code_);
VPositifs := VPositifs + PointSucresBoisson(alim_code_);
VNegatifs := PointProteine(alim_code_);
VNegatifs := VNegatifs + PointFibres(alim_code_);
return  VPositifs - VNegatifs;
END;
/

--fonction renvoyant le nombre de points d'un produit dans la catégorie matière grasse--
CREATE OR REPLACE FUNCTION PointMatieresGrasse(alim_code_ NUMBER) RETURN NUMBER
IS
VPositifs NUMBER;
VNegatifs NUMBER;
BEGIN 
VPositifs :=PointGraisses(alim_code_);
VNegatifs := PointProteine(alim_code_);
VNegatifs := VNegatifs + PointFibres(alim_code_);
return VPositifs - VNegatifs;
END;
/

--fonction renvoyant le nombre de point pour les autres catégories--
CREATE OR REPLACE FUNCTION PointAutre(alim_code_ NUMBER) RETURN NUMBER
IS
VPositifs NUMBER;
VNegatifs NUMBER;
BEGIN 
VPositifs := PointEnergie(alim_code_);
VPositifs := VPositifs + PointSucres(alim_code_);
VPositifs := VPositifs + PointGraisses(alim_code_);
VPositifs := VPositifs + PointSodium(alim_code_);
VNegatifs := PointProteine(alim_code_);
VNegatifs := VNegatifs + PointFibres(alim_code_);
return VPositifs - VNegatifs;
END;
/

--fonction appelant les fonctions des points en fonction de la catégorie de l'aliment--
CREATE OR REPLACE FUNCTION NutriScore10(alim_code_ NUMBER) RETURN NUMBER
IS
VCategorie NUMBER;
VNutriScore NUMBER;
VCategorieBoisson INTEGER;
VCategorieMatieresGrasses INTEGER;
BEGIN 
VCategorieBoisson := 6; --numéro catégorie boisson--
VCategorieMatieresGrasses :=9;--numéro catégorie matières grasses--
SELECT alim_grp_code INTO VCategorie FROM ALIMENTS WHERE  alim_code=alim_code_;
IF VCategorie = VCategorieBoisson THEN
	VNutriScore:= PointBoisson(alim_code_);
	RETURN VNutriScore;
ELSE IF VCategorie = VCategorieMatieresGrasses THEN
	VNutriScore:= PointMatieresGrasse(alim_code_);
	RETURN VNutriScore;
ELSE
	VNutriScore:= PointAutre(alim_code_);
	RETURN VNutriScore;
END IF;
END IF;
RETURN NULL;
END;
/

--fonction attribuant la lettre en fonction des points obtenues et de la catégirie de l'aliment--
CREATE OR REPLACE FUNCTION LettreNutriScore10(alim_code_ NUMBER) RETURN VARCHAR
IS
VCategorie NUMBER;
VLettreNutriScore VARCHAR(4);
VNutriScore NUMBER;
BEGIN 
VLettreNutriScore:='A';
SELECT alim_grp_code INTO VCategorie FROM ALIMENTS WHERE  alim_code=alim_code_;
VNutriScore:= NutriScore10(alim_code_);
IF VCategorie = 6 THEN
	Case 
	WHEN  VNutriScore <=1 THEN
		VLettreNutriScore:='B';
	WHEN VNutriScore>=2 AND  VNutriScore <=5 THEN
		VLettreNutriScore:='C';
	WHEN VNutriScore>=6 AND  VNutriScore <=9 THEN
		VLettreNutriScore:='D';
	WHEN VNutriScore>=10 THEN
		VLettreNutriScore:='E';
	ELSE 
		VLettreNutriScore:='NULL';
	END CASE;
ELSE
	Case 
	WHEN VNutriScore <=-1 THEN
		VLettreNutriScore:='A';
	WHEN VNutriScore>=0 AND  VNutriScore <=2 THEN
		VLettreNutriScore:='B';
	WHEN VNutriScore>=3 AND  VNutriScore <=10 THEN
		VLettreNutriScore:='C';
	WHEN VNutriScore>=11 AND  VNutriScore <=18 THEN
		VLettreNutriScore:='D';
	WHEN VNutriScore>=19 THEN
		VLettreNutriScore:='E';
	ELSE 
		VLettreNutriScore:='NULL';
	END CASE;
END IF;
RETURN VLettreNutriScore;
END;
/

DROP TABLE ScoreAliments;

--Table contenant les codes des aliments avec leur nutriscore correspondant--
CREATE TABLE ScoreAliments ( Alim_code INTEGER, NutriScore VARCHAR(4));

CREATE OR REPLACE PROCEDURE AlimNutriScore
IS
CURSOR C IS SELECT alim_code FROM ALIMENTS;
BEGIN
FOR TUPLE IN C LOOP
INSERT INTO ScoreAliments VALUES (tuple.alim_code,LettreNutriScore10(tuple.alim_code));
END LOOP;
END;
/

EXEC AlimNutriScore;

--fonction qui attribue des points pour le score santé en fonction du nutriscore de l'aliment---
CREATE OR REPLACE FUNCTION PointScoreSante (code INTEGER) return number 
IS 
VNutriScore VARCHAR(4);
BEGIN
SELECT NutriScore INTO VNutriScore FROM ScoreAliments WHERE Alim_code = code;
IF VNutriScore  LIKE '%A%' THEN
	Return 10;
ELSE IF VNutriScore LIKE '%B%' THEN
	RETURN 7;
ELSE IF VNutriScore LIKE '%C%' THEN
	RETURN 5;
ELSE IF VNutriScore LIKE '%D%' THEN
	RETURN 3;
ELSE IF VNutriScore LIKE '%E%' THEN
	RETURN 1;
ELSE
	RETURN 0;
END IF;
END IF;
END IF;
END IF;
END IF;
END;
/



--Fonction qui attribue des points en fonction de la lettre--
CREATE OR REPLACE FUNCTION PointLettre(code INTEGER) return number 
IS 
VNutriScore VARCHAR(4);
BEGIN
SELECT NutriScore INTO VNutriScore FROM ScoreAliments WHERE Alim_code = code;
IF VNutriScore  LIKE '%A%' THEN
	Return 1;
ELSE IF VNutriScore LIKE '%B%' THEN
	RETURN 2;
ELSE IF VNutriScore LIKE '%C%' THEN
	RETURN 3;
ELSE IF VNutriScore LIKE '%D%' THEN
	RETURN 4;
ELSE IF VNutriScore LIKE '%E%' THEN
	RETURN 5;
ELSE
	RETURN 0;
END IF;
END IF;
END IF;
END IF;
END IF;
END;
/

--Fonction qui renvoit la lettre du nutriscore en fonction du nombre de points moyen--
CREATE OR REPLACE FUNCTION LettreSondage(Point INTEGER) RETURN CHAR
IS 
VPoint INTEGER;
BEGIN
VPoint:= ROUND(Point/10);
IF VPoint = 1 THEN
	Return 'A';
ELSE IF VPoint = 2 THEN
	RETURN 'B';
ELSE IF VPoint = 3 THEN
	RETURN 'C';
ELSE IF VPoint = 4 THEN
	RETURN 'D';
ELSE IF VPoint = 5 THEN
	RETURN 'E';
ELSE
	RETURN 'NULL';
END IF;
END IF;
END IF;
END IF;
END IF;
END;
/

EXEC NutriScoreMoyen;


--Fonction qui calcule le nutriscore moyen en fonction des 10 aliments des personnes du sondage et insère le résultat dans la colonne nutriscore du sondage--
-- et qui calcule le score santé allant de 10 à 100 en fonction du nutriscore des aliments --
CREATE OR REPLACE PROCEDURE  NutriScoreMoyen
IS
CURSOR C IS SELECT Administre,Aliment1, Aliment2, Aliment3,Aliment4,Aliment5,Aliment6, Aliment7, Aliment8, Aliment9, Aliment10 FROM SONDAGE;
VLettre CHAR;
VTotalPoint INTEGER;
VScoreSante INTEGER;
BEGIN
FOR tuple IN C LOOP
--calcul du nutriscore moyen--
VTotalPoint:=0;
VTotalPoint := PointLettre(tuple.Aliment1);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment2);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment3);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment4);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment5);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment6);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment7);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment8);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment9);
VTotalPoint := VTotalPoint + PointLettre(tuple.Aliment10);
VLettre := LettreSondage(VTotalPoint);
VScoreSante := PointScoreSante(tuple.Aliment1);
UPDATE SONDAGE SET NutriScore = VLettre WHERE Administre = tuple.Administre;
--calcul du nutriscore sante--
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment2);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment3);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment4);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment5);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment6);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment7);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment8);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment9);
VScoreSante := VScoreSante + PointScoreSante(tuple.Aliment10);
UPDATE SONDAGE SET ScoreSante = VScoreSante WHERE Administre = tuple.Administre;
END LOOP;
END;
/
