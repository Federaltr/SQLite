/* bu bir yorum satırıdır. */

/* tracks tablosundaki name sorgulayınız. */
 
SELECT name
FROM tracks;

/* tracks tablosundaki Composer ve name sorgulayınız. */

SELECT Composer, name 
FROM tracks;

/* albums tablosundaki tüm sütunları sorgulayınız. */

SELECT *
FROM albums;

/* tracks tablosundaki Composer sorgulayınız. */

SELECT Composer
FROM tracks;

/* tracks tablosundaki Composer (tekrarsız(DISTINCT)) sorgulayınız. */

SELECT DISTINCT Composer
FROM tracks;

SELECT DISTINCT AlbumId, MediaTypeId 
FROM tracks;
