/*
Insert in Servicii
*/
INSERT INTO servicii(denumire_serviciu,pret_serviciu) VALUES('MINIBAR',100);
INSERT INTO servicii(denumire_serviciu,pret_serviciu) VALUES('PARCARE',150);
INSERT INTO servicii(denumire_serviciu,pret_serviciu) VALUES('RESTAURANT',200);

/*
Insert in Tip_camere
*/

INSERT INTO tip_camere(denumire_tip) Values('Camera single');
INSERT INTO tip_camere(denumire_tip) Values('Camera dubla');
INSERT INTO tip_camere(denumire_tip) Values('Camera quad');

/*
Insert in Camere
*/
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(1,70,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(2,75,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(3,66,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(4,52,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(5,77,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(6,55,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(7,50,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(8,50,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(9,61,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(10,70,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(11,72,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(12,90,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(13,90,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(14,99,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(15,82,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(16,82,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(17,73,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(18,72,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(19,96,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(20,77,(Select id_tip from Tip_camere where denumire_tip='Camera single'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(21,101,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(22,120,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(23,140,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(24,110,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(25,105,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(26,106,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(27,102,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(28,110,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(29,121,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(30,142,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(31,133,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(32,121,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(33,103,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(34,100,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(35,100,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(36,102,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(37,100,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(38,105,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(39,105,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(40,130,(Select id_tip from Tip_camere where denumire_tip='Camera dubla'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(41,150,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(42,180,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(43,170,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(44,185,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(45,184,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(46,190,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(47,170,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(48,186,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(49,181,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(50,184,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(51,177,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(52,184,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(53,189,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(54,185,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(55,174,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(56,194,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(57,194,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(58,191,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(59,168,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));
INSERT INTO camere(id_camera,pret,tip_camere_id_tip) Values(60,154,(Select id_tip from Tip_camere where denumire_tip='Camera quad'));

/*
Insert Client -> Carte_de_identitate -> Rezervare -> rezervari_servicii_FK
*/
/*
--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Ion','Chiriac','061074000');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,2004036011110,'AB','100000',TO_DATE('07.10.1992','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    1,10,TO_DATE('01.01.2022', 'DD.MM.YYYY'),TO_DATE('04.01.2022', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Parcare')
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Restaurant')
);
--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=1 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=1) where id_rezervare=1;

--insert rezervare_2
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,1,TO_DATE('02.01.2022', 'DD.MM.YYYY'),TO_DATE('04.01.2022', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Parcare')
);
--calculare cost   
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=2 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=2) where id_rezervare=2;


--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('George','Busuioc','0739194149');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,1980101123456,'AX','100001',TO_DATE('01.01.1998','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,13,TO_DATE('02.01.2022', 'DD.MM.YYYY'),TO_DATE('06.01.2022', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Minibar')
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=3 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=3) where id_rezervare=3;

--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Iuliana','Prodan','0739194150');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,2980202123457,'AX','100002',TO_DATE('02.02.1998','DD.MM.YYYY'),'F'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,14,TO_DATE('29.01.2021', 'DD.MM.YYYY'),TO_DATE('06.03.2021', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Restaurant')
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=4 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=4) where id_rezervare=4;


--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Andrei','Vieru','0739194151');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,1780303123457,'AX','100003',TO_DATE('03.03.1978','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,15,TO_DATE('27.01.2021', 'DD.MM.YYYY'),TO_DATE('01.02.2021', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Parcare')
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=5 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=5) where id_rezervare=5;


--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Anatol','Melnic','0739194152');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,1710505123457,'AX','100004',TO_DATE('05.05.1971','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,26,TO_DATE('27.01.2021', 'DD.MM.YYYY'),TO_DATE('01.02.2021', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Parcare')
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=6 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=6) where id_rezervare=6;


--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Alexandra','Tudor','0739194153');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,2710605123457,'AX','100005',TO_DATE('06.05.1971','DD.MM.YYYY'),'F'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,27,TO_DATE('25.01.2021', 'DD.MM.YYYY'),TO_DATE('27.01.2021', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Restaurant')
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=7 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=7) where id_rezervare=7;

--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Andrei','Vieru','0739194154');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,1910605123457,'AX','100006',TO_DATE('06.05.1991','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,48,TO_DATE('23.01.2021', 'DD.MM.YYYY'),TO_DATE('26.01.2021', 'DD.MM.YYYY'),0
);

--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=8 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=8) where id_rezervare=8;

--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Mihai','Alexandrescu','0739194155');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,1910606123457,'AX','100007',TO_DATE('06.06.1991','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,49,TO_DATE('25.01.2021', 'DD.MM.YYYY'),TO_DATE('28.01.2021', 'DD.MM.YYYY'),0
);
--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=9 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=9) where id_rezervare=9;

--Insert Client
INSERT INTO Clienti(nume, prenume, telefon) VALUES('Sergiu','Furtuna','069988930');
--Insert Carte_de_identitate
INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(
    clienti_id_client_seq.currval,2004036089898,'AB','100010',TO_DATE('05.01.1990','DD.MM.YYYY'),'M'
);
--Insert Rezervare_1
INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) Values(
    clienti_id_client_seq.currval,52,TO_DATE('01.01.2022', 'DD.MM.YYYY'),TO_DATE('04.01.2022', 'DD.MM.YYYY'),0
);
INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) Values (
    rezervari_id_rezervare_seq.currval,(Select id_serviciu from Servicii where denumire_serviciu='Parcare')
);
--calculare cost
Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii 
where Camere.id_camera = Rezervari.camere_id_camera 
    and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare
    and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=10 ),0 )) from rezervari,camere 
    where rezervari.camere_id_camera=camere.id_camera and id_rezervare=10) where id_rezervare=10;
*/
