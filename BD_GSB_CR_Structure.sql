/*
 ----------------------------------------------------------------------------
             Génération d'une base de données pour
                        SQL Server 2008
                       (16/03/2021 23:13:59)
 ----------------------------------------------------------------------------
     Nom de la base : BDMO_GSB
     Projet : GSB
     Auteur : BDMO
     Date de dernière modification : 16/03/2021
 ----------------------------------------------------------------------------
*/

USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BDMO_GSB')
      DROP DATABASE BDMO_GSB
GO

/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE BDMO_GSB
----------------------------------------------------------------------------- */

CREATE database BDMO_GSB
GO

USE BDMO_GSB
GO


/* -----------------------------------------------------------------------------
      TABLE : VISITEUR
----------------------------------------------------------------------------- */

CREATE TABLE VISITEUR
(
     VIS_MATRICULE CHAR(4),
     VIS_NOM VARCHAR(25) ,
     VIS_PRENOM VARCHAR(50),
     VIS_ADRESSE VARCHAR(50)  ,
     VIS_CP CHAR(5) ,
     VIS_VILLE VARCHAR(30) ,
     VIS_DATEEMBAUCHE DATE,
	 CONSTRAINT PK_VISITEUR PRIMARY KEY (VIS_MATRICULE),
	
)
go


/* -----------------------------------------------------------------------------
      TABLE : TYPE_PRATICIEN
----------------------------------------------------------------------------- */

CREATE TABLE TYPE_PRATICIEN
(
     TYP_CODE CHAR(3),
     TYP_LIBELLE VARCHAR(25) ,
     TYP_LIEU VARCHAR(35), 
	 CONSTRAINT PK_TYPE_PRATICIEN PRIMARY KEY (TYP_CODE)
)
go

/* -----------------------------------------------------------------------------
      TABLE : PRATICIEN 
----------------------------------------------------------------------------- */

CREATE TABLE PRATICIEN
(
     PRA_NUM INT IDENTITY (1,1),
     PRA_NOM VARCHAR(25) ,
     PRA_PRENOM VARCHAR(30) ,
     PRA_ADRESSE VARCHAR(255) ,
     PRA_CP CHAR(5) ,
     PRA_VILLE VARCHAR(25) ,
     TYP_CODE CHAR(3),
	 CONSTRAINT PK_PRATICIEN PRIMARY KEY (PRA_NUM),
	 CONSTRAINT FK_PRATICIEN_TYPE_PRATICIEN FOREIGN KEY (TYP_CODE)REFERENCES TYPE_PRATICIEN (TYP_CODE)	 
)
go

/* -----------------------------------------------------------------------------
      TABLE : FAMILLE 
-------------------------*/
CREATE TABLE FAMILLE
(
     FAM_CODE varchar(10)  not null  ,
     FAM_LIBELLE varchar(50)not null ,
     CONSTRAINT PK_FAMILLE PRIMARY KEY (FAM_CODE)
)
go

/* -----------------------------------------------------------------------------
      TABLE : MEDICAMENT 
----------------------------------------------------------------------------- */
CREATE TABLE MEDICAMENT
(
     MED_DEPOTLEGAL varchar(50)  not null  ,
     MED_NOMCOMMERCIAL varchar(50)  not null  ,
     FAM_CODE  varchar(10) not null  ,
     MED_COMPOSITION varchar(100)  not null  ,
     MED_EFFETS varchar(255)  not null  ,
     MED_CONTREINDIC varchar(255)  not null,  
     CONSTRAINT PK_MEDICAMENT PRIMARY KEY (MED_DEPOTLEGAL),
	 CONSTRAINT FK_MEDICAMENT_FAMILLE FOREIGN KEY (FAM_CODE)REFERENCES FAMILLE (FAM_CODE)	
	 )
go

/* -----------------------------------------------------------------------------
      TABLE : RAPPORT_VISITE 
----------------------------------------------------------------------------- */

CREATE TABLE RAPPORT_VISITE
(
     RAP_NUM INT IDENTITY (1,1),
	 VIS_MATRICULE CHAR(4)  not null  ,
     PRA_NUM int  not null  ,
     RAP_DATE DATE not null  ,
     RAP_BILAN varchar(255)  not null  ,
     RAP_MOTIF varchar(255)  not null,
     CONSTRAINT PK_RAPPORT_VISITE PRIMARY KEY (RAP_NUM),  
     CONSTRAINT FK_RAPPORT_VISITE_VISITEUR FOREIGN KEY(VIS_MATRICULE) REFERENCES VISITEUR(VIS_MATRICULE), 
     CONSTRAINT FK_RAPPORT_VISITE_PRATICIEN FOREIGN KEY (PRA_NUM)REFERENCES PRATICIEN (PRA_NUM)
)
go
/* -----------------------------------------------------------------------------
      TABLE : OFFRIR 
----------------------------------------------------------------------------- */

CREATE TABLE OFFRIR
(           
     RAP_NUM INT  not null  ,
     MED_DEPOTLEGAL varchar(50)  not null  ,
     OFF_QTE INT not null,
     CONSTRAINT PK_OFFRIR PRIMARY KEY ( RAP_NUM,MED_DEPOTLEGAL),
     CONSTRAINT FK_OFFRIR_RAPPORT_VISITE FOREIGN KEY ( RAP_NUM)  REFERENCES RAPPORT_VISITE (RAP_NUM),
     CONSTRAINT FK_OFFRIR_MEDICAMENT FOREIGN KEY ( MED_DEPOTLEGAL)  REFERENCES MEDICAMENT ( MED_DEPOTLEGAL)
)
go


