-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2023-06-26 01:05:45 CEST
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE h_dzien_wyp (
    dzien_wyp_id VARCHAR2(2) NOT NULL,
    dzien        VARCHAR2(2)
);

ALTER TABLE h_dzien_wyp ADD CONSTRAINT h_dzien_wyp_pk PRIMARY KEY ( dzien_wyp_id );

CREATE TABLE h_klient (
    klient_id        VARCHAR2(5) NOT NULL,
    imie             VARCHAR2(25),
    nazwisko         VARCHAR2(25),
    h_ulica_ulica_id VARCHAR2(4) NOT NULL
);

ALTER TABLE h_klient ADD CONSTRAINT h_klient_pk PRIMARY KEY ( klient_id );

CREATE TABLE h_miesiac_wyp (
    miesiac_wyp_id VARCHAR2(2) NOT NULL,
    miesiac        VARCHAR2(2)
);

ALTER TABLE h_miesiac_wyp ADD CONSTRAINT h_miesiac_wyp_pk PRIMARY KEY ( miesiac_wyp_id );

CREATE TABLE h_pracownik (
    pracownik_id     VARCHAR2(4) NOT NULL,
    imie             VARCHAR2(25),
    nazwisko         VARCHAR2(25),
    h_ulica_ulica_id VARCHAR2(4) NOT NULL
);

ALTER TABLE h_pracownik ADD CONSTRAINT h_pracownik_pk PRIMARY KEY ( pracownik_id );

CREATE TABLE h_rok_wyp (
    rok_wyp_id VARCHAR2(2) NOT NULL,
    rok        VARCHAR2(4)
);

ALTER TABLE h_rok_wyp ADD CONSTRAINT h_rok_wyp_pk PRIMARY KEY ( rok_wyp_id );

CREATE TABLE h_rower (
    rower_id   VARCHAR2(5) NOT NULL,
    nr_seryjny VARCHAR2(4) NOT NULL,
    rok_produkcji VARCHAR2(4) NOT NULL
);

ALTER TABLE h_rower ADD CONSTRAINT h_rower_pk PRIMARY KEY ( rower_id );

CREATE TABLE h_typ (
    typ_id VARCHAR2(2) NOT NULL,
    rodzaj VARCHAR2(25)
);

ALTER TABLE h_typ ADD CONSTRAINT h_typ_pk PRIMARY KEY ( typ_id );

CREATE TABLE h_ulica (
    ulica_id VARCHAR2(4) NOT NULL,
    ulica    VARCHAR2(33)
);

ALTER TABLE h_ulica ADD CONSTRAINT h_ulica_pk PRIMARY KEY ( ulica_id );

CREATE TABLE h_wypozyczalnia (
    wyp_alnia_id     VARCHAR2(4) NOT NULL,
    nazwa_wyp        VARCHAR2(25),
    h_ulica_ulica_id VARCHAR2(4) NOT NULL
);

ALTER TABLE h_wypozyczalnia ADD CONSTRAINT h_wypozyczalnia_pk PRIMARY KEY ( wyp_alnia_id );

CREATE TABLE h_wypozyczenia (
    wyp_enia_id                  VARCHAR2(6) NOT NULL,
    koszt_wyp                    NUMBER,
    h_rower_rower_id             VARCHAR2(5) NOT NULL,
    h_pracownik_pracownik_id     VARCHAR2(4) NOT NULL,
    h_klient_klient_id           VARCHAR2(5) NOT NULL,
    h_typ_typ_id                 VARCHAR2(2) NOT NULL,
    h_dzien_wyp_dzien_wyp_id     VARCHAR2(2) NOT NULL,
    h_miesiac_wyp_miesiac_wyp_id VARCHAR2(2) NOT NULL,
    h_rok_wyp_rok_wyp_id         VARCHAR2(2) NOT NULL,
    h_wypozyczalnia_wyp_alnia_id VARCHAR2(4) NOT NULL
);

ALTER TABLE h_wypozyczenia ADD CONSTRAINT h_wypozyczenia_pk PRIMARY KEY ( wyp_enia_id );

ALTER TABLE h_klient
    ADD CONSTRAINT h_klient_h_ulica_fk FOREIGN KEY ( h_ulica_ulica_id )
        REFERENCES h_ulica ( ulica_id );

ALTER TABLE h_pracownik
    ADD CONSTRAINT h_pracownik_h_ulica_fk FOREIGN KEY ( h_ulica_ulica_id )
        REFERENCES h_ulica ( ulica_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wyp_enia_h_msc_wyp_fk FOREIGN KEY ( h_miesiac_wyp_miesiac_wyp_id )
        REFERENCES h_miesiac_wyp ( miesiac_wyp_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wyp_enia_h_wyp_alnia_fk FOREIGN KEY ( h_wypozyczalnia_wyp_alnia_id )
        REFERENCES h_wypozyczalnia ( wyp_alnia_id );

ALTER TABLE h_wypozyczalnia
    ADD CONSTRAINT h_wypozyczalnia_h_ulica_fk FOREIGN KEY ( h_ulica_ulica_id )
        REFERENCES h_ulica ( ulica_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_dzien_wyp_fk FOREIGN KEY ( h_dzien_wyp_dzien_wyp_id )
        REFERENCES h_dzien_wyp ( dzien_wyp_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_klient_fk FOREIGN KEY ( h_klient_klient_id )
        REFERENCES h_klient ( klient_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_pracownik_fk FOREIGN KEY ( h_pracownik_pracownik_id )
        REFERENCES h_pracownik ( pracownik_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_rok_wyp_fk FOREIGN KEY ( h_rok_wyp_rok_wyp_id )
        REFERENCES h_rok_wyp ( rok_wyp_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_rower_fk FOREIGN KEY ( h_rower_rower_id )
        REFERENCES h_rower ( rower_id );

ALTER TABLE h_wypozyczenia
    ADD CONSTRAINT h_wypozyczenia_h_typ_fk FOREIGN KEY ( h_typ_typ_id )
        REFERENCES h_typ ( typ_id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
