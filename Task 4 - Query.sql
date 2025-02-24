use ToysGroup;

-- 1)	Verificare che i campi definiti come PK siano univoci. In altre parole, scrivi una query per determinare l’univocità dei valori 
-- di ciascuna PK (una query per tabella implementata).

show keys from prodotto;
select count(id) as numero_prodotti from prodotto;
select count(distinct id) from prodotto;

-- Tabella categoria:
show keys from categoria;
select count(id) as numero_categorie from categoria;
select count(distinct id) as numero_categorie from categoria;

-- Tabella vendite:
show keys from vendite;
select count(id) as numero_ordini from vendite;
select count(distinct id) as numero_ordini from vendite;

-- Tabella regione:
show keys from regione;
select count(id) as numero_paesi from regione;
select count(distinct id) as numero_paesi from regione;

-- 2)	Esporre l’elenco delle transazioni indicando nel result set il codice documento, la data, il nome del prodotto, la categoria del prodotto,
-- 		il nome dello stato, il nome della regione di vendita e un campo booleano valorizzato in base alla condizione che siano passati più di 180 
-- 		giorni dalla data vendita o meno (>180 -> True, <= 180 -> False)


select vendite.numero_ordine, vendite.data_vendita, prodotto.nome, categoria.tipo_gioco, regione.paese, regione.zona,
if(datediff(current_date, vendite.data_vendita) > 180, 'true', 'false') as '>180_giorni'
from categoria
join prodotto on categoria.id = prodotto.categoria_id
left join vendite on prodotto.id = vendite.prodotto_id
join regione on regione.id = vendite.regioneid
order by vendite.data_vendita;

select * from prodotto;
select * from categoria;
select * from regione;
select * from vendite;

-- 3) Esporre l’elenco dei prodotti che hanno venduto, in totale, una quantità maggiore della media delle vendite realizzate nell’ultimo anno censito. 
-- 		(ogni valore della condizione deve risultare da una query e non deve essere inserito a mano). Nel result set devono comparire solo il codice 
-- 		prodotto e il totale venduto.

-- CORRETTA 
select prodotto.id, sum(vendite.quantita_ordinata) as totale_venduto
from prodotto
join vendite on prodotto.id = vendite.prodotto_id
where year(vendite.data_vendita) = (select max(year(data_vendita)) from vendite)
group by prodotto.id
having sum(vendite.quantita_ordinata) > 
    (select avg(totale_quantita) 
     from (select sum(quantita_ordinata) as totale_quantita
           from vendite
           where year(data_vendita) = (select max(year(data_vendita)) from vendite)
           group by prodotto_id) as vendite_medie);

-- PRIMA CONTROPROVA DEL FUNZIONAMENTO DELLA SELECT PRECEDENTE:
select prodotto.id, sum(vendite.quantita_ordinata) as totale_venduto
from prodotto
join vendite on prodotto.id = vendite.prodotto_id
where year(vendite.data_vendita) = (select max(year(data_vendita)) from vendite)
group by prodotto.id
order by totale_venduto desc;

-- SECONDA CONTROPROVA DEL FUNZIONAMENTO DELLA SELECT PRECEDENTE: 
select avg(totale_quantita) as media_vendite_per_prodotto
from (select sum(quantita_ordinata) as totale_quantita
      from vendite
      where year(data_vendita) = (select max(year(data_vendita)) from vendite)
      group by prodotto_id) as vendite_medie;

-- TERZA CONTROPROVA DEL FUNZIONAMENTO DELLA SELECT PRECEDENTE: 
select p.id, 
       sum(v.quantita_ordinata) as totale_venduto,
       (select avg(totale_quantita) 
        from (select sum(quantita_ordinata) as totale_quantita
              from vendite
              where year(data_vendita) = (select max(year(data_vendita)) from vendite)
              group by prodotto_id) as vendite_medie) as media_vendite_per_prodotto
from prodotto p
join vendite v on p.id = v.prodotto_id
where year(v.data_vendita) = (select max(year(data_vendita)) from vendite)
group by p.id
order by totale_venduto desc;

select max(year(data_vendita)) from vendite;

-- 4) Esporre l’elenco dei soli prodotti venduti e il fatturato totale per ciascun prodotto per anno.

select prodotto.nome, year(vendite.data_vendita) as anno_vendite, sum(vendite.quantita_ordinata * vendite.prezzo_unitario) as importo_annuo
from prodotto
join vendite on prodotto.id = vendite.prodotto_id
group by prodotto.id, anno_vendite
order by prodotto.nome;

select * from prodotto;
select * from vendite;

-- 5) Esporre il fatturato totale per stato per anno. Ordinare il risultato per data e fatturato decrescente.

select regione.paese, year(vendite.data_vendita) as anno_vendite, sum(vendite.quantita_ordinata * vendite.prezzo_unitario) as fatturato_totale
from regione
join vendite on regione.id = vendite.regioneid
group by regione.paese, anno_vendite
order by anno_vendite desc, fatturato_totale desc;

-- 6) Rispondere alla seguente domanda: Qual è la categoria di articoli maggiormente richiesta dal mercato?

-- Con questa select ho il risultato con limit 1, quindi la categoria più richiesta dal mercato
select categoria.tipo_gioco, sum(vendite.quantita_ordinata) as somma_QuantitaOrdini
from categoria
join prodotto on categoria.id = prodotto.categoria_id
join vendite on prodotto.id = vendite.prodotto_id
group by categoria.tipo_gioco
order by somma_QuantitaOrdini desc
limit 1;

-- - Con questa select ho l'elenco delle categorie dalla piu richiesta alla meno richiesta
select categoria.tipo_gioco, sum(vendite.quantita_ordinata) as somma_QuantitaOrdini
from categoria
join prodotto on categoria.id = prodotto.categoria_id
join vendite on prodotto.id = vendite.prodotto_id
group by categoria.tipo_gioco
order by somma_QuantitaOrdini desc;

-- 7)	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.

-- Primo approccio
select prodotto.id, prodotto.nome from prodotto 
left join vendite on prodotto.id = vendite.prodotto_id
where vendite.prodotto_id is null;

-- Secondo approccio
select prodotto.id, prodotto.nome from prodotto 
where prodotto.id not in (select vendite.prodotto_id from vendite);

select * from vendite;

-- 8)	Creare una vista sui prodotti in modo tale da esporre una “versione denormalizzata” delle informazioni utili 
-- (codice prodotto, nome prodotto, nome categoria)

create view info_utili as (
select prodotto.id, prodotto.nome as nome_gioco, categoria.tipo_gioco from prodotto
join categoria on prodotto.categoria_id = categoria.id
);

select * from info_utili;

-- 9)	Creare una vista per le informazioni geografiche

create view info_geo as
select regione.paese, regione.zona, prodotto.nome, categoria.tipo_gioco, 
sum(vendite.quantita_ordinata * vendite.prezzo_unitario) as fatturato_totale, vendite.quantita_ordinata
from regione
join vendite on regione.id = vendite.regioneID
join prodotto on vendite.prodotto_id = prodotto.id
join categoria on prodotto.categoria_id = categoria.id
group by regione.paese, regione.zona, prodotto.nome, categoria.tipo_gioco, vendite.quantita_ordinata;

select * from info_geo;

select prodotto.id, prodotto.nome, categoria.tipo_gioco,categoria.tema, prodotto.eta_raccomandata
from prodotto
join categoria on categoria_id = categoria.id
order by prodotto.id asc;


select * from prodotto;
select * from categoria;
select * from regione;
select * from vendite;