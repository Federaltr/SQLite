-- Composer'ı Jimi Hendrix olan şarkıları sorgulayınız.

SELECT name
FROM tracks 
WHERE Composer = "Jimi Hendrix"; 

-- invoices tablosunda Total değeri 10 dolardan büyük olan faturaların tüm bilgilerini sorgulayınız.

SELECT *
FROM invoices
WHERE total > 10;

/* invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */

SELECT InvoiceId, InvoiceDate, total 
from invoices
WHERE total > 10 
LIMIT 4;

/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */

SELECT * 
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC
LIMIT 10;

/*invoices tablosundan CustomerId, InvoiceDate, BillingCity, total değerlerini sorgulayınız.(BillingCity -Aşağıdan yukarı, total -Yukardan aşağı.)*/

SELECT CustomerId, InvoiceDate, BillingCity, total
from invoices
ORDER BY BillingCity ASC, total DESC;

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */  

SELECT *
FROM invoices
WHERE BillingCountry <> "USA"  -- WHERE BillingCountry != "USA" // WHERE NOT BillingCountry = "USA"
ORDER BY total DESC;

/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

SELECT *
FROM invoices
WHERE BillingCountry = "USA" OR BillingCountry = "Germany"  -- WHERE BillingCountry != "USA" // WHERE NOT BillingCountry = "USA"
ORDER BY InvoiceId ASC;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 

SELECT *
FROM invoices
WHERE InvoiceDate >= "01-01-2012" AND InvoiceDate <= "02-01-2013";  --tarihler yıl ay gün şeklinde yazılacak.

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "01-01-2012" AND "02-01-2013";   --tarihler yıl ay gün şeklinde yazılacak.

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */ 

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"
ORDER BY InvoiceDate DESC
LIMIT 1;

/* customers tablosunda Belgium, Norway veya  Canada ,USA  ülkelerinden sipariş veren
müşterilerin FirstName, LastName, country bilgilerini listeyiniz */

SELECT FirstName, LastName, country
FROM customers
WHERE country IN ("Belgium", "Norway", "Canada", "USA");

