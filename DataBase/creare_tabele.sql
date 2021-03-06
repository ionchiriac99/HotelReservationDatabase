-- Generated by Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   at:        2021-01-06 13:43:00 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE camere (
    id_camera          NUMBER(4) NOT NULL,
    pret               NUMBER(4) NOT NULL,
    tip_camere_id_tip  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE camere ADD CONSTRAINT pret_ck CHECK ( pret > 0 );

ALTER TABLE camere ADD CONSTRAINT camere_pk PRIMARY KEY ( id_camera );

CREATE TABLE carte_de_identitate (
    cnp                NUMBER(13) NOT NULL,
    seria              CHAR(2) NOT NULL,
    numar              NUMBER(6) NOT NULL,
    data_nastere       DATE NOT NULL,
    sex                CHAR(1) NOT NULL,
    clienti_id_client  NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE carte_de_identitate
    ADD CONSTRAINT cnp_ck CHECK ( length(cnp) = 13 );

ALTER TABLE carte_de_identitate
    ADD CONSTRAINT seria_ck CHECK ( REGEXP_LIKE ( seria,
                                                  '[A-Z]{2}' ) );

ALTER TABLE carte_de_identitate
    ADD CONSTRAINT numar_ck CHECK ( length(numar) = 6 );

ALTER TABLE carte_de_identitate
    ADD CONSTRAINT sex_ck CHECK ( sex IN ( 'F', 'M' ) );

ALTER TABLE carte_de_identitate ADD CONSTRAINT carte_cnp_un UNIQUE ( cnp );

ALTER TABLE carte_de_identitate ADD CONSTRAINT carte_id_client_un UNIQUE ( clienti_id_client );

ALTER TABLE carte_de_identitate ADD CONSTRAINT carte_seria_numar_un UNIQUE ( seria,
                                                                             numar );

CREATE TABLE clienti (
    id_client  NUMBER(4) NOT NULL,
    nume       VARCHAR2(20) NOT NULL,
    prenume    VARCHAR2(20) NOT NULL,
    telefon    VARCHAR2(10) NOT NULL
)
LOGGING;

ALTER TABLE clienti
    ADD CONSTRAINT nume_ck CHECK ( length(nume) > 1
                                   AND REGEXP_LIKE ( nume,
                                                     '^[A-Za-z ,.''-]+$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT prenume_ck CHECK ( length(prenume) > 1
                                      AND REGEXP_LIKE ( prenume,
                                                        '^[A-Za-z ,.''-]+$' ) );

ALTER TABLE clienti
    ADD CONSTRAINT telefon_ck CHECK ( REGEXP_LIKE ( telefon,
                                                    '^[0]([1-9])[0-9]+$' ) );

ALTER TABLE clienti ADD CONSTRAINT clienti_pk PRIMARY KEY ( id_client );

ALTER TABLE clienti ADD CONSTRAINT clienti_telefon_un UNIQUE ( telefon );

CREATE TABLE rezervari (
    id_rezervare       NUMBER(4) NOT NULL,
    data_start         DATE NOT NULL,
    data_end           DATE NOT NULL,
    costul             NUMBER(6) NOT NULL,
    clienti_id_client  NUMBER(4) NOT NULL,
    camere_id_camera   NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE rezervari ADD CONSTRAINT costul_ck CHECK ( costul >= 0 );

ALTER TABLE rezervari ADD CONSTRAINT rezervari_pk PRIMARY KEY ( id_rezervare );

CREATE TABLE rezervari_servicii_fk (
    rezervari_id_rezervare  NUMBER(4) NOT NULL,
    servicii_id_serviciu    NUMBER NOT NULL
)
LOGGING;

ALTER TABLE rezervari_servicii_fk ADD CONSTRAINT rezervari_servicii_fk_pk PRIMARY KEY ( rezervari_id_rezervare,
                                                                                        servicii_id_serviciu );

CREATE TABLE servicii (
    id_serviciu        NUMBER NOT NULL,
    denumire_serviciu  VARCHAR2(20) NOT NULL,
    pret_serviciu      NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE servicii ADD CONSTRAINT pret_serviciu_ck CHECK ( pret_serviciu > 0 );

ALTER TABLE servicii ADD CONSTRAINT servicii_pk PRIMARY KEY ( id_serviciu );

CREATE TABLE tip_camere (
    id_tip        NUMBER(3) NOT NULL,
    denumire_tip  VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE tip_camere ADD CONSTRAINT tip_camere_pk PRIMARY KEY ( id_tip );

ALTER TABLE camere
    ADD CONSTRAINT camere_tip_camere_fk FOREIGN KEY ( tip_camere_id_tip )
        REFERENCES tip_camere ( id_tip )
    NOT DEFERRABLE;

ALTER TABLE carte_de_identitate
    ADD CONSTRAINT carte_de_identitate_clienti_fk FOREIGN KEY ( clienti_id_client )
        REFERENCES clienti ( id_client )
    NOT DEFERRABLE;

ALTER TABLE rezervari_servicii_fk
    ADD CONSTRAINT rez_serv_fk_rezervari_fk FOREIGN KEY ( rezervari_id_rezervare )
        REFERENCES rezervari ( id_rezervare )
    NOT DEFERRABLE;

ALTER TABLE rezervari_servicii_fk
    ADD CONSTRAINT rez_serv_fk_servicii_fk FOREIGN KEY ( servicii_id_serviciu )
        REFERENCES servicii ( id_serviciu )
    NOT DEFERRABLE;

ALTER TABLE rezervari
    ADD CONSTRAINT rezervari_camere_fk FOREIGN KEY ( camere_id_camera )
        REFERENCES camere ( id_camera )
    NOT DEFERRABLE;

ALTER TABLE rezervari
    ADD CONSTRAINT rezervari_clienti_fk FOREIGN KEY ( clienti_id_client )
        REFERENCES clienti ( id_client )
    NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER Trg_data_end 
    BEFORE INSERT OR UPDATE OF data_end ON Rezervari 
    FOR EACH ROW 
BEGIN
    IF( :new.data_end <= :new.data_start )
    THEN
        RAISE_APPLICATION_ERROR( -20001,
            'Data invalida: ' || TO_CHAR( :new.data_end, 'DD.MM.YYYY HH24:MI:SS' ) || ' trebuie sa fie mai mare decat data_start.' );
    END IF;
END; 
/

CREATE OR REPLACE TRIGGER Trg_data_nastere 
    BEFORE INSERT OR UPDATE OF data_nastere ON Carte_de_identitate 
    FOR EACH ROW 
BEGIN
    IF( add_months (:new.data_nastere,18*12) >= SYSDATE )
    THEN
        RAISE_APPLICATION_ERROR( -20001,
            'Data invalida si/sau sunteti minor' );
    END IF;
END; 
/

CREATE OR REPLACE TRIGGER Trg_data_start 
    BEFORE INSERT OR UPDATE OF data_start ON Rezervari 
    FOR EACH ROW 
BEGIN
    IF( :new.data_start <= SYSDATE )
    THEN
        RAISE_APPLICATION_ERROR( -20001,
            'Data invalida: ' || TO_CHAR( :new.data_start, 'DD.MM.YYYY HH24:MI:SS' ) || ' trebuie sa fie mai mare decat data curenta.' );
    END IF;
END; 
/

CREATE SEQUENCE clienti_id_client_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clienti_id_client_trg BEFORE
    INSERT ON clienti
    FOR EACH ROW
    WHEN ( new.id_client IS NULL )
BEGIN
    :new.id_client := clienti_id_client_seq.nextval;
END;
/

CREATE SEQUENCE rezervari_id_rezervare_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rezervari_id_rezervare_trg BEFORE
    INSERT ON rezervari
    FOR EACH ROW
    WHEN ( new.id_rezervare IS NULL )
BEGIN
    :new.id_rezervare := rezervari_id_rezervare_seq.nextval;
END;
/

CREATE SEQUENCE servicii_id_serviciu_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER servicii_id_serviciu_trg BEFORE
    INSERT ON servicii
    FOR EACH ROW
    WHEN ( new.id_serviciu IS NULL )
BEGIN
    :new.id_serviciu := servicii_id_serviciu_seq.nextval;
END;
/

CREATE SEQUENCE tip_camere_id_tip_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tip_camere_id_tip_trg BEFORE
    INSERT ON tip_camere
    FOR EACH ROW
    WHEN ( new.id_tip IS NULL )
BEGIN
    :new.id_tip := tip_camere_id_tip_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           7
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
-- CREATE SEQUENCE                          4
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
