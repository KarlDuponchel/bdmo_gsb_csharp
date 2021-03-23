/*PROC LISTE VISITEURS*/

create proc BDMO_ListeVisiteur
AS
select VIS_MATRICULE, VIS_NOM, VIS_PRENOM, VIS_DATEEMBAUCHE from VISITEUR

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





select * from VISITEUR