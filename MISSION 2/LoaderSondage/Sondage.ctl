LOAD DATA
   INFILE 'D:\REEL\LoaderSondage\Sondage.dat'
   APPEND INTO TABLE sondage
   FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
   TRAILING NULLCOLS
   (Administre ,
    Nom,
    Prenom,
    Adresse ,
    CodePostal ,
    Ville ,
    Telephone,
    Aliment1 ,
    Aliment2 ,
    Aliment3 ,
    Aliment4,
    Aliment5,
    Aliment6 ,
    Aliment7,
    Aliment8 ,
    Aliment9 ,
    Aliment10 ,
    NutriScore,
	ScoreSante
)

