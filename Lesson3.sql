--LIKE

/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/

SELECT name, Composer
FROM tracks
WHERE Composer LIKE '%Bach';

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/

SELECT *
FROM albums
WHERE Title LIKE '%Greatest%';

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

SELECT *
FROM invoices
WHERE InvoiceDate LIKE '201_-02%';

/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
FROM customers
WHERE FirstName LIKE '___';

/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
FROM customers
WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';



--AGGREGATE FUNCTİON--

--COUNT--


/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */

SELECT COUNT (BillingState)  --Null dahil değildir.
FROM invoices;

SELECT COUNT (*) as num_null  --Null olanları say.
FROM invoices
WHERE BillingState IS NULL;

SELECT COUNT (*)  --Tamamını sayar (Null dahildir.)
FROM invoices;


/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/


SELECT COUNT (Composer) --2525
FROM tracks;


SELECT COUNT (DISTINCT Composer) as num_of_composer --852
FROM tracks;


--MIN,MAX--

	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */

SELECT name, MIN (Milliseconds)/1000.0 as min_duration_sec
FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT MIN(Grade) as min_grade, MAX(Grade) as max_grade
FROM students;


--SUM,AVG--


/*invoices  tablosundaki faturaların toplam değerini listeyiniz */

SELECT ROUND(SUM(total)) as total_amount
FROM invoices;

/*invoices  tablosundaki faturaların ortalama değerini listeyiniz */

SELECT ROUND(AVG(total),3) as avg_amount
From invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

SELECT AVG(Milliseconds) as avg_duration
FROM tracks;

SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > 393599.22;

/*bu yöntem hard-coded olduğu için mantıklı bir çzüm değil.
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır.*/

SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM tracks);



--GROUP BY--


/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer, COUNT(name)
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) 
 fatura ortalamalarını hesaplayan ve ülke bilgileri ile 
 listeleyen sorguyu yazınız.*/--sonradan belli tarihler arasındakini hesapladık.

 
 SELECT BillingCountry, ROUND(AVG(total),2) as avg_amount
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 00:00:00'
 GROUP BY BillingCountry;
 
 
 
 
 
 