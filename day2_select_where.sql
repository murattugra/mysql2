-- ========SELECT-WHERE========
use sys; -- bu farkli sys gibi dosyalar varsan bunu alir
create TABLE ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int 
);

    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);

select * from ogrenciler;


/*============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/

/*-----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/

select * from ogrenciler 
where sinav_notu >80;

/*-----------------------------------------------------------------------------
ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 select isim,adres from ogrenciler where adres='Ankara';
 
 /*-----------------------------------------------------------------------------
 ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
  -----------------------------------------------------------------------------*/
 
 select * from ogrenciler where id=124;
 
 
 
 /*======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
 
 -- not: BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme imkani verir
 -- yazdigimiz iki sinirda araliga dahildir
 
 /*===========================================================================
 ===  And (Ve) Operatörü Kullanımı
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
=====Or (Veya) Operatörü Kullanımı=====
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir. =*/
 
/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasında olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 -- 1.yol
 select * from personel where id between '10002' and '10005';
 -- 2.yol
 SELECT * FROM personel
    WHERE id>='10002'  AND  id  <='10005';
 
 
 
 
 /* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
 
 
 select * from personel where isim  between 'Mehmet Yılmaz' and 'Veli Han';
 -- ascii deki gibi isimleri
 
 
 /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 -- 1. ve gicik yol:)
 select * from personel
 where id='10001' or id='10002' or id='10004';
 
 -- 2. yol
 select * from personel
 where id in(10001,10002,10004);
 
 
 /* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
select *from personel
where  maas in(7000,12000);

-- not
-- dogru yazim
 select *from personel
where  maas=7000 or isim='meryem';

-- yanlis yazim

 select * from personel
where maas in(7000,'meryem');
 
 
 
 /* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */

-- ORNEK9: ismi A harfi ile baslayanlari listeleyiniz

select * from personel
where isim like 'a%'; 
 
 
 /* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 
 select * from personel
where isim like '%n'; 
 
 
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
 
  select * from personel
where isim like '_e%'; 
 
 /* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 
   select * from personel
where isim like '_e%y%'; 

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz 	****NOT LIKE****
 -----------------------------------------------------------------------------*/
    select * from personel
where isim not like '%a%'; 

 
 /* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile başlamayanları listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';
 
 
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/     
 
 select * from personel
 where maas like '_____';
 
 
 
 /* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  
  
 select * from personel
 where isim like 'a_____a%';
 
 
 
 
 
 /*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 7);
    
    DROP TABLE kelimeler;
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    
    Select * from kelimeler
    where REGEXP_LIKE(kelime,'at|ot','c');
    
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 

      Select * from kelimeler
    where REGEXP_LIKE(kelime,'at|ot');
   
      
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
    
      Select * from kelimeler
    where REGEXP_LIKE(kelime,'^ho|^hi');  
    
    
    
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
         
    Select * from kelimeler
    where REGEXP_LIKE(kelime,'t$|m$');  
    
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
 
	Select * from kelimeler 
   -- where kelime like 'h_t';  -- bu şekilde h ve t'den byk kçk olan hepsini getirir..!
	where REGEXP_LIKE(kelime,'h[a-zA-Z0-9]t','c');
    
    
/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
   Select * from kelimeler
	where REGEXP_LIKE(kelime,'h[ai]t');
   
   
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
   
   select*from kelimeler
   where REGEXP_LIKE(kelime, '[mie]');    -- m|i|e; şeklinde de yazabiliriz.
   
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 

    select*from kelimeler
  -- where REGEXP_LIKE(kelime, '^a|^s');    
	where REGEXP_LIKE(kelime, '^[as]'); 

 
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 

  select*from kelimeler
	where REGEXP_LIKE(kelime, '[o]{2}');  -- [o][o] şeklinde de yapılabilir.

/* ============================== UPDATE SET ===================================    
    update   -----  tabloları güncelleme
    set      -----  tablolardkai sutunları veya satırları degiştirme
==============================================================================*/  
   -- primary-foreign bağlantisi son 2 soruda işe yarayacak
   CREATE TABLE tedarikciler       -- parent
    (
        vergi_no int PRIMARY KEY,
        firma_ismi VARCHAR(50),
        irtibat_ismi VARCHAR(50)
       ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler       -- child
    (
        ted_vergino int, 
        urun_id int, 
        urun_isim VARCHAR(50), 
        musteri_isim VARCHAR(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
        on delete cascade
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino; -- iki tabloyu birlikte görme...
    -- SYNTAX
    -- --------
    -- UPDATE tablo_adı
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koşul;
      
/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 102 olan tedarikcinin (firma) ismini 'Vestel' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 
 update tedarikciler
 set firma_ismi = 'Vestel'
 where vergi_no='102';
 SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
   
/* -----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundaki tüm firma isimlerini 'CASPER' olarak 
  güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
   
   update tedarikciler
   set firma_ismi = 'CASPER';
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 101 olan tedarikcinin ismini 'casper' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyiniz. 
 -----------------------------------------------------------------------------*/ 
    
    update tedarikciler
    set firma_ismi = 'casper',
    irtibat_ismi='Ali Veli'
    where vergi_no='101';
    
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;

    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi casper olan tedarikcinin irtibat_ismini 'İpek Bilgin' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
   
   update tedarikciler
   set irtibat_ismi='Seyfullah Merdan'
   where firma_ismi='casper';
   SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
   
   
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' değerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
 
 update urunler
 set urun_isim='Telefon'
 where urun_isim='Phone';

 
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id
  değerlerini bir arttırınız
 -----------------------------------------------------------------------------*/ 
    
    update urunler
    set urun_id=urun_id+1
    where urun_id>1004;
    
    select * from urunler;
    
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
  sutun değerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
    update urunler
    set urun_id=urun_id+ted_vergino;
    select * from urunler;

/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
   
   delete from tedarikciler;
   delete from urunler;         -- insertleri sildik,geri yükledik,tabloyu yeniledik...
   
   update urunler
   set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
   where musteri_isim='Ali Bak';
   select*from urunler;
   
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/
 
 SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
 
 update urunler
 set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') -- bana diger tablodan getiriyor.
 where urun_isim='Laptop';
 
 -- farklı bir yol ile de yapılabilir. --
 
 update urunler, tedarikciler
 set musteri_isim=irtibat_ismi 
 where urun_isim='Laptop' and firma_ismi='Apple';/* ============================== UPDATE SET ===================================    
    update   -----  tabloları güncelleme
    set      -----  tablolardkai sutunları veya satırları degiştirme
==============================================================================*/  
   -- primary-foreign bağlantisi son 2 soruda işe yarayacak
   CREATE TABLE tedarikciler       -- parent
    (
        vergi_no int PRIMARY KEY,
        firma_ismi VARCHAR(50),
        irtibat_ismi VARCHAR(50)
       ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler       -- child
    (
        ted_vergino int, 
        urun_id int, 
        urun_isim VARCHAR(50), 
        musteri_isim VARCHAR(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
        on delete cascade
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino; -- iki tabloyu birlikte görme...
    -- SYNTAX
    -- --------
    -- UPDATE tablo_adı
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koşul;
      
/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 102 olan tedarikcinin (firma) ismini 'Vestel' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 
 update tedarikciler
 set firma_ismi = 'Vestel'
 where vergi_no='102';
 SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
   
/* -----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundaki tüm firma isimlerini 'CASPER' olarak 
  güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
   
   update tedarikciler
   set firma_ismi = 'CASPER';
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 101 olan tedarikcinin ismini 'casper' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyiniz. 
 -----------------------------------------------------------------------------*/ 
    
    update tedarikciler
    set firma_ismi = 'casper',
    irtibat_ismi='Ali Veli'
    where vergi_no='101';
    
    SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;

    
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi casper olan tedarikcinin irtibat_ismini 'İpek Bilgin' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
   
   update tedarikciler
   set irtibat_ismi='Seyfullah Merdan'
   where firma_ismi='casper';
   SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
   
   
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' değerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
 
 update urunler
 set urun_isim='Telefon'
 where urun_isim='Phone';

 
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id
  değerlerini bir arttırınız
 -----------------------------------------------------------------------------*/ 
    
    update urunler
    set urun_id=urun_id+1
    where urun_id>1004;
    
    select * from urunler;
    
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
  sutun değerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
    update urunler
    set urun_id=urun_id+ted_vergino;
    select * from urunler;

/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
   
   delete from tedarikciler;
   delete from urunler;         -- insertleri sildik,geri yükledik,tabloyu yeniledik...
   
   update urunler
   set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
   where musteri_isim='Ali Bak';
   select*from urunler;
   
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/
 
 SELECT * FROM tedarikciler, urunler WHERE tedarikciler.vergi_no = urunler.ted_vergino;
 
 update urunler
 set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') -- bana diger tablodan getiriyor.
 where urun_isim='Laptop';
 
 -- farklı bir yol ile de yapılabilir. --
 
 update urunler, tedarikciler
 set musteri_isim=irtibat_ismi 
 where urun_isim='Laptop' and firma_ismi='Apple';

