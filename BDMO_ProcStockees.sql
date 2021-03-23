/*PROC LISTE VISITEURS*/

alter proc BDMO_ListeVisiteur
AS
select VIS_MATRICULE, VIS_NOM, VIS_PRENOM, VIS_DATEEMBAUCHE from VISITEUR
order by VIS_NOM

BDMO_ListeVisiteur

/*PROC LISTE VISITEUR DETAILLE*/

alter proc BDMO_ListeVisiteurDetail
	@matricule char(4)
AS
select VIS_ADRESSE + ', ' + VIS_CP + ' ' + VIS_VILLE AS 'Adresse' from VISITEUR where VIS_MATRICULE = @matricule

BDMO_ListeVisiteurDetail 'V001'

/*PROC LISTE VISITEUR DATE EMBAUCHE*/

create proc BDMO_ListeVisiteurDate
	@dateEmbauche date
AS
select VIS_MATRICULE, VIS_NOM, VIS_PRENOM from VISITEUR where VIS_DATEEMBAUCHE = @dateEmbauche

BDMO_ListeVisiteurDate '11-12-2018'

/*PROC NOMBRE VISITEURS*/

create proc BDMO_NBVisiteur
AS
select COUNT(*) AS NbVisiteurs from VISITEUR

BDMO_NBVisiteur

/*PROC NOMBRE VISITEURS PAR DATE*/

create proc BDMO_NbVisiteurParDate
	@dateEmbauche date
AS
select COUNT(*) AS NbVisiteurs from VISITEUR where VIS_DATEEMBAUCHE = @dateEmbauche

BDMO_NbVisiteurParDate '06-01-2015'

/*PROC LISTE PRATICIENS*/

alter proc BDMO_ListePraticiens
AS
select PRA_NUM, PRA_NOM, PRA_PRENOM, TYP_LIBELLE from PRATICIEN P
inner join TYPE_PRATICIEN T on P.TYP_CODE = T.TYP_CODE
order by PRA_NOM

BDMO_ListePraticiens

/*PROC LISTE PRATICIENS DETAIL*/

create proc BDMO_ListePraticiensDetail
	@Numero int
AS
select PRA_ADRESSE + ', ' + PRA_CP + ' ' + PRA_VILLE AS Adresse from PRATICIEN where PRA_NUM = @Numero

BDMO_ListePraticiensDetail 2

/*PROC LIEU DE TRAVAIL PRATICIENS*/

alter proc BDMO_LieuTravail
	@Numero int
AS
select TYP_LIEU from TYPE_PRATICIEN T
inner join PRATICIEN P on P.TYP_CODE = T.TYP_CODE
where PRA_NUM = @Numero

BDMO_LieuTravail 2

/*LISTE DES FONCTIONS*/

create proc BDMO_ListeFonction
AS
select TYP_LIBELLE from TYPE_PRATICIEN

/*LISTE PRATICIENS PAR FONCTIONS*/

create proc BDMO_ListePratParFct
	@Code char(2)
AS
select PRA_NUM, PRA_NOM, PRA_PRENOM from PRATICIEN WHERE TYP_CODE = @Code

BDMO_ListePratParFct 'MV'

/*LISTE PRATICIENS PAR FONCTIONS DETAILLÉE*/

alter proc BDMO_ListePratParFctDetail
	@Code char(2)
AS
select PRA_ADRESSE + ', ' + PRA_CP + ' ' + PRA_VILLE AS Adresse from PRATICIEN where TYP_CODE = @Code

BDMO_ListePratParFctDetail 'MV'

/*LIEU DE TRAVAIL PAR FCT*/

create proc BDMO_LieuTravailParFct
	@Code char(2)
AS
select TYP_LIEU from TYPE_PRATICIEN where TYP_CODE = @Code

BDMO_LieuTravailParFct 'MV'

/*Nb PRATICIENS*/

create proc NbPraticiens
AS
select count(*) AS NbPraticiens from PRATICIEN

NbPraticiens

select * from PRATICIEN

select * from TYPE_PRATICIEN

select * from VISITEUR