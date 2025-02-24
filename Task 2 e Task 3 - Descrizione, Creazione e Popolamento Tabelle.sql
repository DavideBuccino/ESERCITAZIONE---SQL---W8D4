create database ToysGroup;
use ToysGroup;


create table categoria (
    id int auto_increment primary key,
    tipo_gioco varchar(50),
    tema varchar(50)
);

create table prodotto (
    id int auto_increment primary key,
    nome varchar(50),
    colore varchar(50),
    eta_raccomandata varchar(5),
    prezzo_lista decimal(10,2),
    costo_standard decimal(10,2),
    categoria_id int,
    foreign key(categoria_id) references categoria (id)
);

create table vendite (
    id int auto_increment primary key,
    data_ordine date,
    data_vendita date,
    quantita_ordinata smallint,
    prezzo_unitario decimal(10,2),
    prodotto_id int,
    foreign key (prodotto_id) references prodotto(id)
);

create table regione (
    id int auto_increment primary key,
    paese varchar(50),
    zona varchar(50),
    vendita_id int,
    foreign key (vendita_id) references vendite(id)
);

insert into categoria (tipo_gioco, tema) values
('Educativo', 'Scienza'),
('Educativo', 'Matematica'),
('Costruzione', 'Architettura'),
('Figure d\'azione', 'Supereroi'),
('Giochi di ruolo', 'Fantasia'),
('Puzzle', 'Jigsaw'),
('Videogiochi', 'Avventura'),
('Videogiochi', 'Azione'),
('Videogiochi', 'Sport'), 
('Giochi da tavolo', 'Strategia');

insert into prodotto (nome, colore, eta_raccomandata, prezzo_lista, costo_standard, categoria_id) values
('Minecraft', 'Multicolor', '7+', 29.99, 15.00, 7),  
('Cluedo', 'Verde', '8+', 19.99, 10.00, 9),    
('Monopoly', 'Multicolor', '8+', 24.99, 12.50, 9),    
('Star Wars: X-Wing', 'Nero', '14+', 39.99, 20.00, 9),    
('Play-Doh', 'Multicolor', '3+', 14.99, 7.50, 1),  
('LEGO Technic', 'Grigio', '10+', 49.99, 25.00, 3),  
('Giochi di società', 'Blu', '10+', 34.99, 17.00, 9), 
('Sassi e cristalli', 'Colorato', '6+', 12.99, 6.00, 1),  
('Uno', 'Rosso', '7+', 16.99, 8.50, 9),    
('Twilight Struggle', 'Blu', '14+', 39.99, 20.00, 9),    
('Dungeons & Dragons', 'Nero', '12+', 44.99, 22.50, 5),   
('Ticket to Ride', 'Verde', '8+', 34.99, 17.00, 9), 
('Catan', 'Giallo', '10+', 39.99, 20.00, 9), 
('The Game of Life', 'Multicolor', '8+', 29.99, 15.00, 9),  
('Super Mario Odyssey', 'Multicolor', '7+', 59.99, 30.00, 7),
('The Legend of Zelda: Breath of the Wild', 'Blu', '10+', 69.99, 35.00, 7),  
('FIFA 21', 'Nero', '3+', 49.99, 25.00, 8),   
('Fortnite', 'Multicolor', '12+', 29.99, 15.00, 7),  
('Animal Crossing: New Horizons', 'Verde', '7+', 49.99, 25.00, 7), 
('Guitar Hero', 'Multicolor', '10+', 79.99, 40.00, 7), 
('Pictionary', 'Rosso', '8+', 24.99, 12.50, 9);


insert into vendite (quantita_ordinata, prezzo_unitario, data_ordine, data_vendita, prodotto_id) values
(3, 24.99, '2024-01-05', '2024-01-06', 1),
(5, 29.99, '2024-01-01', '2024-01-02', 2),
(4, 14.99, '2024-02-08', '2024-02-09', 3),
(3, 34.99, '2024-03-23', '2024-03-24', 4),
(6, 18.99, '2024-04-11', '2024-04-12', 5),
(4, 24.99, '2024-05-04', '2024-05-05', 1),
(7, 14.99, '2024-06-09', '2024-06-10', 6),
(3, 14.99, '2024-07-19', '2024-07-20', 10),
(2, 29.99, '2024-08-21', '2024-08-22', 11),
(5, 19.99, '2024-09-29', '2024-09-30', 12),
(4, 9.99, '2024-10-17', '2024-10-18', 13),
(6, 16.99, '2024-11-15', '2024-11-16', 14),
(5, 12.99, '2024-12-13', '2024-12-14', 15),
(2, 39.99, '2024-01-07', '2024-01-08', 16),
(3, 39.99, '2024-02-06', '2024-02-07', 17),
(4, 19.99, '2024-03-02', '2024-03-03', 18),
(3, 29.99, '2024-04-01', '2024-04-02', 19),
(5, 19.99, '2024-05-03', '2024-05-04', 20),
(2, 22.99, '2024-06-25', '2024-06-26', 21),
(4, 39.99, '2024-07-27', '2024-07-28', 22);

insert into regione (paese, zona, vendita_id) values
('Francia', 'Europa Occidentale', 7),
('Irlanda', 'Europa Settentrionale', 19),
('Portogallo', 'Europa Meridionale', 12),
('Danimarca', 'Europa Settentrionale', 11),
('Repubblica Ceca', 'Europa Orientale', 14),
('Svezia', 'Europa Settentrionale', 5),
('Grecia', 'Europa Meridionale', 10),
('Polonia', 'Europa Orientale', 4),
('Belgio', 'Europa Occidentale', 17),
('Italia', 'Europa Meridionale', 2),
('Finlandia', 'Europa Settentrionale', 9),
('Paesi Bassi', 'Europa Occidentale', 13),
('Norvegia', 'Europa Settentrionale', 1),
('Ungheria', 'Europa Orientale', 8),
('Islanda', 'Europa Settentrionale', 15),
('Germania', 'Europa Occidentale', 3),
('Slovacchia', 'Europa Orientale', 18),
('Malta', 'Europa Meridionale', 16),
('Spagna', 'Europa Meridionale', 6),
('Cipro', 'Europa Meridionale', 20);


alter table vendite
add column numero_ordine int after id;

alter table vendite 
modify numero_ordine varchar(5);


update vendite set numero_ordine = 
    case 
        when id = 1 then 'AB001'
        when id = 2 then 'CD002'
        when id = 3 then 'EF003'
        when id = 4 then 'GH004'
        when id = 5 then 'IJ005'
        when id = 6 then 'KL006'
        when id = 7 then 'MN007'
        when id = 8 then 'OP008'
        when id = 9 then 'QR009'
        when id = 10 then 'ST010'
        when id = 11 then 'UV011'
        when id = 12 then 'WX012'
        when id = 13 then 'YZ013'
        when id = 14 then 'AB014'
        when id = 15 then 'CD015'
        when id = 16 then 'EF016'
        when id = 17 then 'GH017'
        when id = 18 then 'IJ018'
        when id = 19 then 'KL019'
        when id = 20 then 'MN020'
    end;


start transaction;
update vendite set data_vendita = 
    case 
        when id = 1 then '2024-01-06'
        when id = 2 then '2024-01-15'
        when id = 3 then '2024-01-22'
        when id = 4 then '2024-02-06'
        when id = 5 then '2024-02-18'
        when id = 6 then '2024-03-11'
        when id = 7 then '2024-04-29'
        when id = 8 then '2024-05-17'
        when id = 9 then '2024-05-30'
        when id = 10 then '2024-06-20'
        when id = 11 then '2024-07-08'
        when id = 12 then '2024-08-15'
        when id = 13 then '2024-09-11'
        when id = 14 then '2024-10-06'
        when id = 15 then '2024-10-25'
        when id = 16 then '2024-11-12'
        when id = 17 then '2024-11-28'
        when id = 18 then '2024-12-09'
        when id = 19 then '2024-12-18'
        when id = 20 then '2024-12-31'
    end;
rollback;

update vendite set data_ordine =
    case 
        when id = 1 then '2024-01-01'
        when id = 2 then '2024-01-02'
        when id = 3 then '2024-01-03'
        when id = 4 then '2024-01-04'
        when id = 5 then '2024-01-05'
        when id = 6 then '2024-01-06'
        when id = 7 then '2024-01-07'
        when id = 8 then '2024-01-08'
        when id = 9 then '2024-01-09'
        when id = 10 then '2024-01-10'
        when id = 11 then '2024-01-11'
        when id = 12 then '2024-01-12'
        when id = 13 then '2024-01-13'
        when id = 14 then '2024-01-14'
        when id = 15 then '2024-01-15'
        when id = 16 then '2024-01-16'
        when id = 17 then '2024-01-17'
        when id = 18 then '2024-01-18'
        when id = 19 then '2024-01-19'
        when id = 20 then '2024-01-20'
    end;


alter table vendite
add constraint vendite_data_check check (data_vendita >= data_ordine);


insert into prodotto (nome, colore, eta_raccomandata, prezzo_lista, costo_standard, categoria_id) values
('Pokémon: Spada e Scudo', 'Blu', '10+', 59.99, 30.00, 9),
('FIFA 22', 'Nero', '3+', 49.99, 25.00, 9),
('Just Dance 2021', 'Multicolor', '7+', 39.99, 20.00, 9),
('Call of Duty: Warzone', 'Grigio', '18+', 59.99, 30.00, 9),
('The Sims 4', 'Blu', '12+', 39.99, 20.00, 9),
('Overcooked! 2', 'Multicolor', '7+', 29.99, 15.00, 9),
('Super Smash Bros. Ultimate', 'Nero', '10+', 59.99, 30.00, 9),
('Civilization VI', 'Blu', '12+', 49.99, 25.00, 9),
('Mario Kart 8 Deluxe', 'Multicolor', '7+', 49.99, 25.00, 9),
('Tomb Raider', 'Nero', '14+', 39.99, 20.00, 9),
('Zelda: Skyward Sword', 'Verde', '10+', 44.99, 22.50, 9),
('Assassin\'s Creed: Odyssey', 'Grigio', '18+', 59.99, 30.00, 9),
('Portal 2', 'Blu', '12+', 29.99, 15.00, 9),
('Stardew Valley', 'Multicolor', '7+', 24.99, 12.50, 9),
('Hollow Knight', 'Nero', '10+', 29.99, 15.00, 9),
('Celeste', 'Verde', '10+', 19.99, 10.00, 9),
('Among Us', 'Multicolor', '7+', 19.99, 10.00, 9),
('Cuphead', 'Rosso', '12+', 29.99, 15.00, 9),
('Ghost of Tsushima', 'Blu', '18+', 69.99, 35.00, 9),
('Final Fantasy VII Remake', 'Nero', '12+', 59.99, 30.00, 9),
('Ratchet & Clank: Rift Apart', 'Multicolor', '10+', 59.99, 30.00, 9);

UPDATE prodotto 
SET categoria_id = 
    CASE 
        WHEN nome IN ('Pokémon: Spada e Scudo', 'The Sims 4', 'Overcooked! 2', 'Tomb Raider', 
                      'Zelda: Skyward Sword', 'Assassin\'s Creed: Odyssey', 'Portal 2', 
                      'Stardew Valley', 'Hollow Knight', 'Celeste', 'Among Us', 
                      'Ghost of Tsushima', 'Final Fantasy VII Remake', 'Ratchet & Clank: Rift Apart') THEN 7  
        WHEN nome IN ('FIFA 22', 'Just Dance 2021', 'Mario Kart 8 Deluxe') THEN 9  
        WHEN nome IN ('Call of Duty: Warzone', 'Super Smash Bros. Ultimate', 'Cuphead') THEN 8  
        WHEN nome IN ('Civilization VI') THEN 10  
        ELSE categoria_id  
    END
WHERE categoria_id = 9;

UPDATE prodotto SET categoria_id = (SELECT id FROM categoria WHERE tipo_gioco = 'Videogiochi' AND tema = 'Strategia') 
WHERE nome = 'Civilization VI';

UPDATE categoria  
SET tema = 'Avventura/Strategia'  
WHERE id = 7;

ALTER TABLE vendite 
ADD COLUMN regioneID INT; 

ALTER TABLE vendite 
ADD CONSTRAINT fk_regioneID FOREIGN KEY (regioneID) REFERENCES regione(ID); 

UPDATE vendite
join regione on vendite.ID = regione.vendita_ID
set vendite.regioneID = regione.ID;

start transaction;
SHOW CREATE TABLE regione;
ALTER TABLE regione
DROP FOREIGN KEY regione_ibfk_1;
rollback;

alter table regione drop column vendita_ID;

insert into vendite (quantita_ordinata, prezzo_unitario, data_ordine, data_vendita, prodotto_id) values
(5, 24.99, '2025-01-05', '2025-01-06', 1),
(3, 29.99, '2025-01-07', '2025-01-08', 2),
(4, 14.99, '2025-01-10', '2025-01-11', 3),
(6, 34.99, '2025-01-15', '2025-01-16', 4),
(2, 39.99, '2025-01-20', '2025-01-21', 5),
(3, 29.99, '2025-01-25', '2025-01-26', 6),
(1, 59.99, '2025-01-30', '2025-01-31', 7),
(4, 49.99, '2025-02-05', '2025-02-06', 8),
(5, 39.99, '2025-02-10', '2025-02-11', 9),
(2, 44.99, '2025-02-15', '2025-02-16', 10);

update vendite set numero_ordine = 
    case 
        when id = 1 then 'AB001'
        when id = 2 then 'CD002'
        when id = 3 then 'EF003'
        when id = 4 then 'GH004'
        when id = 5 then 'IJ005'
        when id = 6 then 'KL006'
        when id = 7 then 'MN007'
        when id = 8 then 'OP008'
        when id = 9 then 'QR009'
        when id = 10 then 'ST010'
        when id = 11 then 'UV011'
        when id = 12 then 'WX012'
        when id = 13 then 'YZ013'
        when id = 14 then 'AB014'
        when id = 15 then 'CD015'
        when id = 16 then 'EF016'
        when id = 17 then 'GH017'
        when id = 18 then 'IJ018'
        when id = 19 then 'KL019'
        when id = 20 then 'MN020'
        when id = 21 then 'OP021'  -- Aggiungi nuove righe per il 2025
        when id = 22 then 'QR022'
        when id = 23 then 'ST023'
        when id = 24 then 'UV024'
        when id = 25 then 'WX025'
        when id = 26 then 'YZ026'
        when id = 27 then 'AB027'
        when id = 28 then 'CD028'
        when id = 29 then 'EF029'
        when id = 30 then 'GH030'
    end
where year(data_vendita) = 2025;

UPDATE vendite
SET regioneID = 
    CASE 
        WHEN id = 21 THEN 41  
        WHEN id = 22 THEN 50  
        WHEN id = 23 THEN 43  
        WHEN id = 24 THEN 41 
        WHEN id = 25 THEN 50  
        WHEN id = 26 THEN 43  
        WHEN id = 27 THEN 41  
        WHEN id = 28 THEN 50  
        WHEN id = 29 THEN 43    
        WHEN id = 30 THEN 41     
    END
WHERE year(data_vendita) = 2025;

-- Creazione della nuova categoria 'Videogiochi Sportivi' -- successivamente rimossa perche gia presente (sport) in tema
INSERT INTO categoria (tipo_gioco, tema) VALUES ('Videogiochi Sportivi', 'Sport');
-- Creazione della categoria 'Gioco Musicale'
INSERT INTO categoria (tipo_gioco, tema) VALUES ('Gioco Musicale', 'Musica');


-- Aggiornamento delle categorie dei prodotti
UPDATE prodotto 
SET categoria_id = 
    CASE 
        WHEN nome = 'Call of Duty: Warzone' THEN (SELECT id FROM categoria WHERE tipo_gioco = 'Videogiochi' AND tema = 'Azione')
        WHEN nome IN ('FIFA 21', 'FIFA 22') THEN (SELECT id FROM categoria WHERE tipo_gioco = 'Videogiochi Sportivi')
        WHEN nome = 'Just Dance 2021' THEN (SELECT id FROM categoria WHERE tipo_gioco = 'Gioco Musicale')
        WHEN id = 7 THEN (SELECT id FROM categoria WHERE tipo_gioco = 'Giochi di strategia')  -- Cambiare il nome e categoria per Giochi di società
        ELSE categoria_id  
    END;
    
-- Rinomina del prodotto 'Giochi di società' (ID 7) in 'Gioco dell\'Oca'
UPDATE prodotto 
SET nome = 'Gioco dell\'Oca' 
WHERE id = 7;

-- Dissociare i prodotti dalla categoria 'Videogiochi Sportivi'
UPDATE prodotto 
SET categoria_id = NULL  -- O puoi impostare su un'altra categoria valida, se necessario
WHERE categoria_id = (SELECT id FROM categoria WHERE tipo_gioco = 'Videogiochi Sportivi');

-- Rimuovere la categoria 'Videogiochi Sportivi' (assicurati che non ci siano prodotti associati)
DELETE FROM categoria WHERE tipo_gioco = 'Videogiochi Sportivi';

-- Ripristinare le categorie originali per FIFA 21 e FIFA 22
-- Assicurati che l'ID della categoria originale sia corretto (presumibilmente 9 per 'Videogiochi - Sport')
UPDATE prodotto 
SET categoria_id = 9  -- Cambia questo ID se necessario
WHERE nome IN ('FIFA 21', 'FIFA 22');

-- Aggiornare la categoria di Cluedo e Pictionary
UPDATE prodotto
SET categoria_id = 10
WHERE id IN (2, 21);

-- Aggiornare il nome del Gioco di Società in Gioco dell'Oca
UPDATE prodotto
SET nome = 'Gioco dell\'Oca'
WHERE id = 7;

-- Aggiorno i prodotti FIFA 21, FIFA 22 nella categoria Videogiochi - Sport
UPDATE prodotto
SET categoria_id = 9
WHERE nome IN ('FIFA 21', 'FIFA 22'); 

-- Aggiorno i prodotti (Cluedo, Monopoly, Gioco dell'Oca, Twilight Struggle, Ticket to Ride, Catan, The Game of Life, Pictionary) 
-- nella categoria Giochi da Tavolo
UPDATE prodotto
SET categoria_id = 10 
WHERE id IN (2, 3, 7, 10, 12, 13, 14, 21); 

-- Aggiornaro il prodotto Just Dance 2021 assegnandolo alla categoria 12 Gioco Musicale - Musica

UPDATE prodotto
SET categoria_id = 12
WHERE id IN (24);

-- Aggiornaro il prodotto Civilization IV assegnandolo alla categoria 7	Videogiochi	- Avventura/Strategia
UPDATE prodotto
SET categoria_id = 7
WHERE id IN (29);

-- Aggiornaro il prodotto Guitar Hero assegnandolo alla categoria 12 Gioco Musicale - Musica
UPDATE prodotto
SET categoria_id = 12
WHERE id IN (20);

select * from prodotto;
select * from categoria;
select * from regione;
select * from vendite;
