Tabela "funkcja":
    funkcja_id NUMBER(7) (Klucz główny)
    funkcja    VARCHAR2(25)

Tabela "klient":
    klient_id      NUMBER(7) (Klucz główny)
    imie           VARCHAR2(25),
    nazwisko       VARCHAR2(25),
    nr_telefonu    INTEGER,
    nr_budynku     INTEGER,
    nr_mieszkania  INTEGER,
    kod_pocztowy   VARCHAR2(6),
    ulica_ulica_id NUMBER(7) (Klucz obcy tabeli ulica)

Tabela "kolor":
    kolor_id NUMBER(7) (Klucz główny)
    kolor    VARCHAR2(25)

Tabela "marka":
    marka_id       NUMBER(7) (Klucz główny)
    marka          VARCHAR2(25),
    model_model_id NUMBER(7) (Klucz obcy tabeli model)

Tabela "miasto":
    miasto_id          NUMBER(7) (Klucz główny)
    miasto             VARCHAR2(30),
    wojewodztwo_woj_id NUMBER(7) (Klucz obcy tabeli wojewodztwo)

Tabela "model":
    model_id NUMBER(7) (Klucz główny)
    model    VARCHAR2(25)

Tabela "pracownik":
    pracownik_id       NUMBER(7) (Klucz główny)
    imie               VARCHAR2(25),
    nazwisko           VARCHAR2(25),
    data_zatrudnienia  DATE,
    ulica_ulica_id     NUMBER(7) (Klucz obcy tabeli ulica)
    funkcja_funkcja_id NUMBER(7) (Klucz obcy tabeli funkcja)

Tabela "rower":
    rower_id                     NUMBER(7) (Klucz główny)
    nr_seryjny                   VARCHAR2(4) NOT NULL,
    rok_produkcji                VARCHAR2(4) NOT NULL,
    typ_typ_id                   NUMBER(7) (Klucz obcy tabeli typ)
    kolor_kolor_id               NUMBER(7) (Klucz obcy tabeli kolor)
    rozmiar_ramy_rozmiar_ramy_id NUMBER(7) (Klucz obcy tabeli rozmiar_ramy)

Tabela "rozmiar_kol":
    rozmiar_kol_id NUMBER(7) (Klucz główny)
    rozmiar_kol    VARCHAR2(25)

Tabela "rozmiar_ramy": (
    rozmiar_ramy_id            NUMBER(7) (Klucz główny)
    rozmiar_ramy               VARCHAR2(25),
    rozmiar_kol_rozmiar_kol_id NUMBER(7) (Klucz obcy tabeli rozmiar_kol)

Tabela "typ": 
    typ_id         NUMBER(7) (Klucz główny)
    rodzaj         VARCHAR2(25),
    marka_marka_id NUMBER(7) (Klucz obcy tabeli marka)

Tabela "ulica":
    ulica_id         NUMBER(7) (Klucz główny)
    ulica            VARCHAR2(35),
    miasto_miasto_id NUMBER(7) (Klucz obcy tabeli miasto)

Tabela "wojewodztwo":
    woj_id      NUMBER(7) (Klucz główny)
    wojewodztwo VARCHAR2(25)

Tabela "wypozyczalnia":
    wypozyczalnia_id NUMBER(7) N(Klucz główny)
    nazwa_wyp        VARCHAR2(25),
    ulica_ulica_id   NUMBER(7) (Klucz obcy tabeli ulica)

Tabela "wypozyczenia":
    wypozyczenia_id                NUMBER(7) (Klucz główny)
    data_wypozyczenia              DATE,
    data_zwrotu                    DATE,
    koszt_wypozyczenia             NUMBER,
    rower_rower_id                 NUMBER(7),
    wypozyczalnia_wypozyczalnia_id NUMBER(7) (Klucz obcy tabeli wypozyczalnia)
    pracownik_pracownik_id         NUMBER(7) (Klucz obcy tabeli pracownik)
    klient_klient_id               NUMBER(7) (Klucz obcy tabeli klient)