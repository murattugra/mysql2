/* =============================
	TABLO OLUSTURMA (CRUD- creta)
=================================	*/
CREATE TABLE student
(
id varchar(4),
name varchar(25),
age int
);
INSERT INTO student VALUES("1001", "MEHMET ALİ", 25);
INSERT INTO student VALUES("1002", "AYSE YILMAZ", 34);
INSERT INTO student VALUES("1003", "JOHN STAR", 56);
INSERT INTO student VALUES("1004", "MARY BROWN", 17);

select * from student;
select * from urunler;

/* =============================
	PARCALI VERI GIRISI
=================================	*/

INSERT INTO student(name, age) VALUES("MURAT ARSLAN",30);


select * from student;


/* =============================
	tablodan veri sorgulama
=================================	*/

select * from student;

/* =============================
	tablodan veri silme
=================================	*/


DROP TABLE student;



