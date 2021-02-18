import cx_Oracle
import db_config
from tkinter import *
import tkinter as tk
from datetime import date
import datetime

def press_upd_rezervare(event):
    cur = conn.cursor()
    if entry_cnp.get() and entry_data_start.get() and entry_data_end.get() and entry_id_camera.get() and \
        entry_new_data_start.get() and entry_new_data_end.get():
        try:
            querry = """select id_rezervare from clienti c, carte_de_identitate b,rezervari r
                        where c.id_client=r.clienti_id_client 
                            and c.id_client=b.clienti_id_client
                            and b.cnp=%s
                            and r.data_start=TO_DATE('%s','DD.MM.YYYY') 
                            and r.data_end=TO_DATE('%s','DD.MM.YYYY') 
                            and r.camere_id_camera=%s
                            """ % (entry_cnp.get(), entry_data_start.get(), entry_data_end.get(), entry_id_camera.get())
            cur.execute(querry)
            id_rezervare = cur.fetchall()
            id_rezervare = id_rezervare[0][0]
            if id_rezervare:
                print(id_rezervare)
                querry = f"""delete from rezervari_servicii_fk where rezervari_id_rezervare={id_rezervare}"""
                cur.execute(querry)
                cur.execute('commit')
                querry="""update rezervari set data_start=TO_DATE('%s','DD.MM.YYYY') ,data_end=TO_DATE('%s','DD.MM.YYYY') 
                    where id_rezervare=%s""" %(entry_new_data_start.get(),entry_new_data_end.get(),id_rezervare)
                cur.execute(querry)
                cur.execute('commit')
                print("sa facut update la data")
                cur.close()
                insert_rez_servicii(id_rezervare)
                # Update la cost
                cur = conn.cursor()
                print("sa facut update la rezervari servicii")
                querry = "Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii " \
                         "where Camere.id_camera = Rezervari.camere_id_camera " \
                         "and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare" \
                         " and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=%s),0 )) from rezervari,camere " \
                         "where rezervari.camere_id_camera=camere.id_camera and id_rezervare=%s) where id_rezervare=%s"%(id_rezervare,id_rezervare,id_rezervare)
                cur.execute(querry)
                cur.execute('commit')
                print("sa facut update la cost")
                querry = "Select costul from rezervari where id_rezervare=%s"%(id_rezervare)
                cur.execute(querry)
                cost = cur.fetchall()
                field.insert(END,f"[SUCCES]: Update-ul la camera a fost realizat cu succes\n")
                cur.close()
        except:
            field.insert(END,f"[EROARE]: Rezervare inexistenta sau ati introdus date gresite\n")



def has_overlap(A_start, A_end, B_start, B_end):
    latest_start = max(A_start, B_start)
    earliest_end = min(A_end, B_end)
    return latest_start < earliest_end

def camera_disponibila(camera):
    cur = conn.cursor()
    querry = "Select data_start, data_end from rezervari where camere_id_camera=%s" % (camera)
    new_d_start = datetime.datetime.strptime(entry_data_start.get(), '%d.%m.%Y')
    new_d_end = datetime.datetime.strptime(entry_data_end.get(), '%d.%m.%Y')
    new_data_start = date(new_d_start.year, new_d_start.month, new_d_start.day)
    new_data_end = date(new_d_end.year, new_d_end.month, new_d_end.day)
    cur.execute(querry)
    res = cur.fetchall()
    for d_start, d_end in res:
        data_start = date(d_start.year, d_start.month, d_start.day)
        data_end = date(d_end.year, d_end.month, d_end.day)
        if has_overlap(data_start, data_end, new_data_start, new_data_end):
            field.insert(END, f"[EROARE]: Nu se poate rezerva camera {camera}. Este deja ocupata\n")
            # field.insert(END,f"[EROARE]: {new_data_start},{new_data_end} se suprapune cu {data_start},{data_end}\n")
            return False

    cur.close()
    return True


def lista_camerelor(event):
    cur = conn.cursor()
    field.insert(END, "============================= Lista camerelor ===============================\n")
    cur.execute("select id_camera, pret from camere")
    res = cur.fetchall()
    for row in res:
        field.insert(END, "Camera: " + str(row[0]) + ", Pret: " + str(row[1]) + "\n")
    cur.close()


def del_rezervare(event):
    cur = conn.cursor()
    if entry_cnp.get() and entry_data_start.get() and entry_data_end.get() and entry_id_camera.get():
        try:
            querry = """select id_rezervare from clienti c, carte_de_identitate b,rezervari r
                    where c.id_client=r.clienti_id_client 
                        and c.id_client=b.clienti_id_client
                        and b.cnp=%s
                        and r.data_start=TO_DATE('%s','DD.MM.YYYY') 
                        and r.data_end=TO_DATE('%s','DD.MM.YYYY') 
                        and r.camere_id_camera=%s
                        """ % (entry_cnp.get(), entry_data_start.get(), entry_data_end.get(), entry_id_camera.get())
            cur.execute(querry)
            id_rezervare = cur.fetchall()
            id_rezervare = id_rezervare[0][0]
            querry = f"""delete from rezervari_servicii_fk where rezervari_id_rezervare={id_rezervare}"""
            cur.execute(querry)
            cur.execute('commit')

            querry = f"""delete from rezervari where id_rezervare={id_rezervare}"""
            cur.execute(querry)
            cur.execute('commit')
            field.insert(END, "[SUCCES]: Rezervarea a fost anulata cu succes.\n")
        except:
            field.insert(END, "[EROARE]: Rezervare inexistenta.\n")
    else:
        field.insert(END, "[EROARE]: Introduceti toate datele pentru anularea rezervarii.\n")
    cur.close()


def camere_ocupate(event):
    cur = conn.cursor()
    cur.execute("select camere_id_camera, data_start, data_end from rezervari")
    res = cur.fetchall()
    field.insert(END, "============================= Camere ocupate ================================\n")
    for row in res:
        field.insert(END, "Camera: " + str(row[0]) + " Intervalul rezervat: " + str(row[1].day) + "." + str(
            row[1].month) + "." + \
                     str(row[1].year) + " - " + str(row[2].day) + "." + str(row[2].month) + "." + str(
            row[2].year) + "\n")
    cur.close()


def lista_serviciilor(event):
    cur = conn.cursor()
    field.insert(END, "============================= Lista serviciilor =============================\n")
    field.insert(END, "Denumire serviciu - pret\n")
    cur.execute("select denumire_serviciu, pret_serviciu from servicii")
    res = cur.fetchall()
    for row in res:
        field.insert(END, str(row[0]) + " - " + str(row[1]) + "\n")
    cur.close()


def insert_clienti():
    cur = conn.cursor()
    global exista_client
    querry = "Select Clienti_id_client from Carte_de_identitate where cnp='%s'" % (entry_cnp.get())
    cur.execute(querry)
    exista_client = cur.fetchall()
    if not exista_client:
        try:
            querry = "INSERT INTO Clienti(nume, prenume, telefon) VALUES('%s','%s','%s')" % (
                entry_nume.get(), entry_prenume.get(), entry_telefon.get())
            cur.execute(querry)
            cur.execute('commit')
            try:
                querry = "INSERT INTO Carte_de_identitate(Clienti_id_client,CNP,seria,numar,data_nastere,sex) VALUES(Clienti_id_client_seq.currval,'%s','%s','%s',TO_DATE('%s','DD.MM.YYYY'),'%s')" \
                         % (entry_cnp.get(), entry_seria.get().upper(), entry_numar.get(), entry_data_nastere.get(),
                            entry_sex.get().upper())
                cur.execute(querry)
                cur.execute('commit')
                field.insert(END, "[SUCCES]: Datele personale au fost introduse in baza de date\n")
                insert_rezervare()
            except:
                field.insert(END, "[EROARE]: Date de identitate incorecte: Verificati datele din nou\n")
                cur.execute("Delete from clienti where id_client=(select max(id_client) from clienti)")
                cur.execute('commit')
        except:
            field.insert(END, "[EROARE]: Informatii clienti incorecte: Verificati datele din nou\n")
    else:
        insert_rezervare()
    cur.close()


def insert_rezervare():
    cur = conn.cursor()
    if camera_disponibila(entry_id_camera.get()):
        try:
            if not exista_client:
                querry = "INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) " \
                         "Values((select max(id_client) from Clienti),'%s',TO_DATE('%s','DD.MM.YYYY'),TO_DATE('%s','DD.MM.YYYY'),0)" \
                         % (entry_id_camera.get(), entry_data_start.get(), entry_data_end.get())
            else:
                for i in exista_client:
                    id = i[0]
                querry = "INSERT INTO Rezervari(clienti_id_client,camere_id_camera,data_start,data_end,costul) " \
                         "Values('%s','%s',TO_DATE('%s','DD.MM.YYYY'),TO_DATE('%s','DD.MM.YYYY'),0)" \
                         % (id, entry_id_camera.get(), entry_data_start.get(), entry_data_end.get())


            cur.execute(querry)
            cur.execute('commit')
            querry = """select id_rezervare from clienti c, carte_de_identitate b,rezervari r
                                    where c.id_client=r.clienti_id_client 
                                        and c.id_client=b.clienti_id_client
                                        and b.cnp=%s
                                        and r.data_start=TO_DATE('%s','DD.MM.YYYY') 
                                        and r.data_end=TO_DATE('%s','DD.MM.YYYY') 
                                        and r.camere_id_camera=%s
                                        """ % (
            entry_cnp.get(), entry_data_start.get(), entry_data_end.get(), entry_id_camera.get())
            cur.execute(querry)
            id_rezervare = cur.fetchall()
            id_rezervare = id_rezervare[0][0]
            cur.close()
            insert_rez_servicii(id_rezervare)
            # Update la cost
            cur = conn.cursor()

            querry = "Update rezervari set costul=(select (data_end-data_start)*(pret+NVL((select sum(pret_serviciu) from rezervari,camere,rezervari_servicii_fk,servicii " \
                     "where Camere.id_camera = Rezervari.camere_id_camera " \
                     "and rezervari.id_rezervare=rezervari_servicii_fk.rezervari_id_rezervare" \
                     " and rezervari_servicii_fk.servicii_id_serviciu=servicii.id_serviciu and id_rezervare=(select max(id_rezervare) from rezervari)),0 )) from rezervari,camere " \
                     "where rezervari.camere_id_camera=camere.id_camera and id_rezervare=(select max(id_rezervare) from rezervari)) where id_rezervare=(select max(id_rezervare) from rezervari)"
            cur.execute(querry)
            cur.execute('commit')
            querry = "Select costul from rezervari where id_rezervare=(select max(id_rezervare) from rezervari)"
            cur.execute(querry)
            cost = cur.fetchall()
            field.insert(END,
                         f"[SUCCES]: Rezervarea camerei {entry_id_camera.get()} a fost facuta cu succes. Costul este de {cost[0][0]}\n")
            cur.close()
        except:
            field.insert(END, "[EROARE]: Informatii rezervare incorecte: Verificati din nou datele\n")


def insert_rez_servicii(id_rezervare):
    cur = conn.cursor()
    servicii = []
    if parcare.get():
        servicii.append("PARCARE")
    if minibar.get():
        servicii.append("MINIBAR")
    if restaurant.get():
        servicii.append("RESTAURANT")
    if servicii:
        try:
            for s in servicii:
                querry = "INSERT INTO rezervari_servicii_fk(rezervari_id_rezervare,servicii_id_serviciu) " \
                         "Values(%s,(Select id_serviciu from Servicii where denumire_serviciu='%s'))" % (
                             id_rezervare,s.upper())
                cur.execute(querry)
                cur.execute('commit')
        except:
            field.insert(END, "[EROARE]: Informatii servicii incorecte. Hotelul nu dispune unele servicii alese\n")
    servicii = []
    cur.close()


def press_help(event):
    field.insert(END, "=============================== Start Help ==================================\n")
    field.insert(END, "| Cititi cu atentie toate specificatiile pentru a nu introduce date gresite  |\n")
    field.insert(END, "| Numele: nu poate sa contina cifre                                          |\n")
    field.insert(END, "| Prenumele: nu poate sa contina cifre                                       |\n")
    field.insert(END, "| Telefon: formatul [0][1-9]+ (maxim 10 cifre)                               |\n")
    field.insert(END, "| CNP: Format din 13 cifre                                                   |\n")
    field.insert(END, "| Seria: contine 2 litere MARI                                               |\n")
    field.insert(END, "| Numar: formati din 6 cifre                                                 |\n")
    field.insert(END, "| Datele calendaristice au formatul zz.ll.aaaa                               |\n")
    field.insert(END, "| Data de nastere: Persoana trebuie sa aiba mai mult de 18 ani               |\n")
    field.insert(END, "| Date start: Trebuie sa fie mai mare ca data curenta                        |\n")
    field.insert(END, "| Date stop: Trebuie sa fie mai mare ca data de start                        |\n")
    field.insert(END, "| Nr camera: Se introduce doar un numar                                      |\n")
    field.insert(END, "| Servicii: alegere optionala:  Parcare, Restaurant, Minibar                 |\n")
    field.insert(END, "=============================== Stop  Help ==================================\n")


def press_rezervare(event):
    if entry_nume.get() and entry_prenume.get() and entry_telefon.get() and entry_cnp.get() and entry_seria.get() and entry_numar.get() \
            and entry_data_nastere.get() and entry_sex.get() and entry_data_start.get() and entry_data_end.get() and entry_id_camera.get():
        insert_clienti()
    else:
        field.insert(END, "[EROARE]: Introduceti toate datele\n")


def init_app():
    global entry_nume, entry_prenume, entry_telefon, entry_cnp, entry_seria, entry_numar, entry_data_nastere, entry_sex,entry_new_data_start,entry_new_data_end
    global entry_data_start, entry_data_end, entry_id_camera, field, btn_parcare, btn_minibar, btn_restaurant, parcare, minibar, restaurant
    root = Tk()
    # root.resizable(width=False, height=False)
    # root.geometry('1180x440')
    root.title("Rezervari hoteliere")
    root['bg'] = 'gray'
    label_client = Label(root, text="Informatii client", bg='gray',font='Comfortaa 20')
    label_carte_de_identitate = Label(root, text="Carte de identitate", bg='gray',font='Comfortaa 20')
    label_client.grid(row=0, columnspan=2)
    label_nume = Label(root, text="Nume:", bg='gray')
    label_prenume = Label(root, text="Prenume:", bg='gray')
    label_telefon = Label(root, text="Telefon:", bg='gray')
    label_cnp = Label(root, text="CNP:", bg='gray')
    label_seria = Label(root, text="Seria:", bg='gray')
    label_numar = Label(root, text="Numar:", bg='gray')
    label_data_nastere = Label(root, text="Data nastere:", bg='gray')
    label_sex = Label(root, text="Sex:", bg='gray')

    entry_nume = Entry(root)
    entry_prenume = Entry(root)
    entry_telefon = Entry(root)
    entry_cnp = Entry(root)
    entry_seria = Entry(root)
    entry_numar = Entry(root)
    entry_data_nastere = Entry(root)
    entry_sex = Entry(root)

    label_nume.grid(row=1, column=0, padx=5, pady=5, sticky=W)
    entry_nume.grid(row=1, column=1, padx=5, pady=5)

    label_prenume.grid(row=2, column=0, padx=5, pady=5, sticky=W)
    entry_prenume.grid(row=2, column=1, padx=5, pady=5)

    label_telefon.grid(row=3, column=0, padx=5, pady=5, sticky=W)
    entry_telefon.grid(row=3, column=1, padx=5, pady=5)
    label_carte_de_identitate.grid(row=4, columnspan=2)

    label_cnp.grid(row=5, column=0, padx=5, pady=5, sticky=W)
    entry_cnp.grid(row=5, column=1, padx=5, pady=5)

    label_seria.grid(row=6, column=0, padx=5, pady=5, sticky=W)
    entry_seria.grid(row=6, column=1, padx=5, pady=5)

    label_numar.grid(row=7, column=0, padx=5, pady=5, sticky=W)
    entry_numar.grid(row=7, column=1, padx=5, pady=5)

    label_data_nastere.grid(row=8, column=0, padx=5, pady=5, sticky=W)
    entry_data_nastere.grid(row=8, column=1, padx=5, pady=5)

    label_sex.grid(row=9, column=0, padx=5, pady=5, sticky=W)
    entry_sex.grid(row=9, column=1, padx=5, pady=5)

    label_rezervare = Label(root, text="Informatii rezervare", bg='gray',font='Comfortaa 20')
    label_rezervare.grid(row=0, column=3, columnspan=2, padx=5, pady=5)

    label_data_start = Label(root, text="Data start:", bg='gray')
    label_data_end = Label(root, text="Data end:", bg='gray')
    label_new_data_start = Label(root, text="New Data start:", bg='gray')
    label_new_data_end = Label(root, text="New Data end:", bg='gray')
    label_id_camera = Label(root, text="Nr. camera:", bg='gray')
    label_servicii = Label(root, text="Servicii:", bg='gray',font='Comfortaa 20')

    entry_data_start = Entry(root)
    entry_data_end = Entry(root)
    entry_new_data_start = Entry(root)
    entry_new_data_end = Entry(root)
    entry_id_camera = Entry(root)

    label_data_start.grid(row=1, column=2, padx=5, pady=5, sticky=W)
    entry_data_start.grid(row=1, column=3, padx=5, pady=5, sticky=W)

    label_data_end.grid(row=2, column=2, padx=5, pady=5, sticky=W)
    entry_data_end.grid(row=2, column=3, padx=5, pady=5, sticky=W)

    label_new_data_start.grid(row=1, column=4, padx=5, pady=5, sticky=W)
    entry_new_data_start.grid(row=1, column=5, padx=5, pady=5, sticky=W)

    label_new_data_end.grid(row=2, column=4, padx=5, pady=5, sticky=W)
    entry_new_data_end.grid(row=2, column=5, padx=5, pady=5, sticky=W)

    label_id_camera.grid(row=3, column=2, padx=5, pady=5, sticky=W)
    entry_id_camera.grid(row=3, column=3, padx=5, pady=5, sticky=W)

    label_servicii.grid(row=4, column=3, padx=5, pady=5, sticky=W)

    btn_add_rezervare = Button(root, text="Add Rezervare", bg="green")
    btn_upd_rezervare = Button(root, text="Update Rezervare", bg="yellow")
    btn_remove_rezervare = Button(root, text="Delete Rezervare", bg="red")
    btn_check_camere_all = Button(root, text="Lista camerelor", bg="yellow")
    btn_check_servicii = Button(root, text="Lista serviciilor", bg="yellow")
    btn_check_camere_ocupate = Button(root, text="Camere ocupate", bg="yellow")
    btn_help = Button(root, text="HELP ?", fg="green")

    btn_check_camere_all.grid(row=7, column=2, padx=5, pady=5, sticky=W)
    btn_check_camere_ocupate.grid(row=7, column=3, padx=5, pady=5, sticky=W)
    btn_check_servicii.grid(row=8, column=2, padx=5, pady=5, sticky=W)
    btn_help.grid(row=8, column=3, padx=5, pady=5, sticky=W)

    btn_add_rezervare.grid(row=6, column=2, padx=5, pady=5, sticky=W)
    btn_remove_rezervare.grid(row=6, column=3, padx=5, pady=5, sticky=W)
    btn_upd_rezervare.grid(row=6, column=4, padx=5, pady=5, sticky=W)
    btn_add_rezervare.bind("<Button-1>", press_rezervare)
    btn_upd_rezervare.bind("<Button-1>", press_upd_rezervare)
    btn_help.bind("<Button-1>", press_help)
    btn_check_camere_all.bind("<Button-1>", lista_camerelor)
    btn_check_camere_ocupate.bind("<Button-1>", camere_ocupate)
    btn_check_servicii.bind("<Button-1>", lista_serviciilor)
    btn_remove_rezervare.bind("<Button-1>", del_rezervare)

    parcare = tk.IntVar()
    restaurant = tk.IntVar()
    minibar = tk.IntVar()

    btn_parcare = Checkbutton(root, text="Parcare", variable=parcare, onvalue=1, offvalue=0, bg='gray')
    btn_restaurant = Checkbutton(root, text="Restaurant", variable=restaurant, onvalue=1, offvalue=0, bg='gray')
    btn_minibar = Checkbutton(root, text="Minibar", variable=minibar, onvalue=1, offvalue=0, bg='gray')

    btn_restaurant.grid(row=5, column=2)
    btn_parcare.grid(row=5, column=3)
    btn_minibar.grid(row=5, column=4)

    field = Text(root, wrap=WORD, bg='#78f542')
    label_terminal = Label(root, text="Terminal:", bg='gray',font='Comfortaa 20')
    label_terminal.grid(row=0, column=6, padx=5, pady=5)
    field.grid(row=1, column=6, rowspan=9, padx=5, pady=5)
    root.mainloop()


if __name__ == '__main__':
    #cx_Oracle.init_oracle_client(lib_dir=r"C:\Oracle\instantclient_19_9")
    cx_Oracle.init_oracle_client(lib_dir=r"path")
    conn = cx_Oracle.connect(db_config.user, db_config.pw, db_config.dsn)
    init_app()
    conn.close()
