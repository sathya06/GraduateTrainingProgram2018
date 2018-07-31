ProblemSet<01>, July 31 2018 
Submission by sathya.a.loganathan 


1)create table Hotels(Hotel_NO  text primary key,Name text,City text);

INSERT INTO HOTELS VALUES("H111","EMPIRE HOTEL","NEW YORK");
INSERT INTO HOTELS VALUES("H235","PARK PLACE","NEW YORK");
INSERT INTO HOTELS VALUES("H432","BROWNSTONE HOTEL","TORONTO");
INSERT INTO HOTELS VALUES("H498","JAMES PLAZA","TORONTO");
INSERT INTO HOTELS VALUES("H193","DEVON HOTEL","BOSTON");
INSERT INTO HOTELS VALUES("H437","CLAIRMONT HOTEL","BOSTON");

select * from hotels;
+----------+------------------+----------+
| Hotel_NO | Name             | City     |
+----------+------------------+----------+
| H111     | EMPIRE HOTEL     | NEW YORK |
| H193     | DEVON HOTEL      | BOSTON   |
| H235     | PARK PLACE       | NEW YORK |
| H432     | BROWNSTONE HOTEL | TORONTO  |
| H437     | CLAIRMONT HOTEL  | BOSTON   |
| H498     | JAMES PLAZA      | TORONTO  |
+----------+------------------+----------+
6 rows in set (0.00 sec)

2)create table Room(Room_No varchar(20),Hotel_NO varchar(20) references Hotels(Hotel_NO),Type varchar(20),Price int(10),primary key(Room_No,Hotel_NO));

INSERT INTO ROOM VALUES(313,'H111','S',145.00);
INSERT INTO ROOM VALUES(412,'H111','N',145.00);
INSERT INTO ROOM VALUES(1267,'H235','N',175.00);
INSERT INTO ROOM VALUES(1289,'H235','N',195.00);
INSERT INTO ROOM VALUES(876,'H432','S',124.00);
INSERT INTO ROOM VALUES(898,'H432','S',124.00);
INSERT INTO ROOM VALUES(345,'H498','N',160.00);
INSERT INTO ROOM VALUES(467,'H498','N',180.00);
INSERT INTO ROOM VALUES(1001,'H193','S',150.00);
INSERT INTO ROOM VALUES(1201,'H193','N',175.00);
INSERT INTO ROOM VALUES(257,'H437','N',140.00);
INSERT INTO ROOM VALUES(223,'H437','N',155.00);

select * from room;
+---------+----------+------+-------+
| Room_No | Hotel_NO | Type | Price |
+---------+----------+------+-------+
| 1001    | H193     | S    |   150 |
| 1201    | H193     | N    |   175 |
| 1267    | H235     | N    |   175 |
| 1289    | H235     | N    |   195 |
| 223     | H437     | N    |   155 |
| 257     | H437     | N    |   140 |
| 313     | H111     | S    |   145 |
| 345     | H498     | N    |   160 |
| 412     | H111     | N    |   145 |
| 467     | H498     | N    |   180 |
| 876     | H432     | S    |   124 |
| 898     | H432     | S    |   124 |
+---------+----------+------+-------+
12 rows in set (0.00 sec)

3)create table Booking(Hotel_NO varchar(20) references Hotels(Hotel_NO) ,Guest_No varchar(20) references Guest(Guest_No)  ,Date_from varchar(20),Date_to varchar(20),Room_No varchar(20) references room(Room_No),primary key(Hotel_NO,Guest_No,Room_No));
 
 INSERT INTO BOOKING VALUES('H111','G256','10-AUG-99','15-AUG-99',412);
 INSERT INTO BOOKING VALUES('H111','G367','18-AUG-99','21-AUG-99',412);
 INSERT INTO BOOKING VALUES('H235','G879','05-SEP-99','12-SEP-99',1267);
 INSERT INTO BOOKING VALUES('H498','G230','15-SEP-99','18-SEP-99',467);
 INSERT INTO BOOKING VALUES('H498','G256','30-NOV-99','02-DEC-99',345);
 INSERT INTO BOOKING VALUES('H498','G467','03-NOV-99','05-NOV-99',345);
 INSERT INTO BOOKING VALUES('H193','G190','15-NOV-99','19-NOV-99',1001);
 INSERT INTO BOOKING VALUES('H193','G367','12-SEP-99','14-SEP-99',1001); 
 INSERT INTO BOOKING VALUES('H193','G367','01-OCT-99','06-OCT-99',1201);
 INSERT INTO BOOKING VALUES('H437','G190','04-OCT-99','06-OCT-99',223);
 INSERT INTO BOOKING VALUES('H437','G879','14-SEP-99','17-SEP-99',223);
 
 select * from booking;
+----------+----------+-----------+-----------+---------+
| Hotel_NO | Guest_No | Date_from | Date_to   | Room_No |
+----------+----------+-----------+-----------+---------+
| H111     | G256     | 10-AUG-99 | 15-AUG-99 | 412     |
| H111     | G367     | 18-AUG-99 | 21-AUG-99 | 412     |
| H193     | G190     | 15-NOV-99 | 19-NOV-99 | 1001    |
| H193     | G367     | 12-SEP-99 | 14-SEP-99 | 1001    |
| H193     | G367     | 01-OCT-99 | 06-OCT-99 | 1201    |
| H235     | G879     | 05-SEP-99 | 12-SEP-99 | 1267    |
| H437     | G190     | 04-OCT-99 | 06-OCT-99 | 223     |
| H437     | G879     | 14-SEP-99 | 17-SEP-99 | 223     |
| H498     | G230     | 15-SEP-99 | 18-SEP-99 | 467     |
| H498     | G256     | 30-NOV-99 | 02-DEC-99 | 345     |
| H498     | G467     | 03-NOV-99 | 05-NOV-99 | 345     |
+----------+----------+-----------+-----------+---------+
11 rows in set (0.00 sec)

4)create table Guest(Guest_No text primary key,Name text ,City text);

INSERT INTO GUEST VALUES('G256','ADAM WAYNE','PITTSBURGH');
INSERT INTO GUEST VALUES('G367','TARA CUMMINGS','BALTIMORE');
INSERT INTO GUEST VALUES('G879','VANESSA PARRY','PITTSBURGH');
INSERT INTO GUEST VALUES('G230','TOM HANCOCK','PHILADELPHIA');
INSERT INTO GUEST VALUES('G467','ROBERT SWIFT','ATLANTA');
INSERT INTO GUEST VALUES('G190','EDWARD CANE','BALTIMORE');

select * from guest;
+----------+---------------+--------------+
| Guest_No | Name          | City         |
+----------+---------------+--------------+
| G190     | EDWARD CANE   | BALTIMORE    |
| G230     | TOM HANCOCK   | PHILADELPHIA |
| G256     | ADAM WAYNE    | PITTSBURGH   |
| G367     | TARA CUMMINGS | BALTIMORE    |
| G467     | ROBERT SWIFT  | ATLANTA      |
| G879     | VANESSA PARRY | PITTSBURGH   |
+----------+---------------+--------------+
6 rows in set (0.00 sec)

QUERY:
1.List full details of all hotels.
select h.Hotel_NO,h.name,h.city,r.room_no,r.type,r.price,b.Guest_No,b.Date_from,b.Date_to from hotels h,room r,booking b where h.Hotel_No=r.Hotel_NO and b.room_no=r.room_no ;
+----------+-----------------+----------+---------+------+-------+----------+-----------+-----------+
| Hotel_NO | name            | city     | room_no | type | price | Guest_No | Date_from | Date_to   |
+----------+-----------------+----------+---------+------+-------+----------+-----------+-----------+
| H193     | DEVON HOTEL     | BOSTON   | 1001    | S    |   150 | G190     | 15-NOV-99 | 19-NOV-99 |
| H193     | DEVON HOTEL     | BOSTON   | 1001    | S    |   150 | G367     | 12-SEP-99 | 14-SEP-99 |
| H193     | DEVON HOTEL     | BOSTON   | 1201    | N    |   175 | G367     | 01-OCT-99 | 06-OCT-99 |
| H235     | PARK PLACE      | NEW YORK | 1267    | N    |   175 | G879     | 05-SEP-99 | 12-SEP-99 |
| H437     | CLAIRMONT HOTEL | BOSTON   | 223     | N    |   155 | G190     | 04-OCT-99 | 06-OCT-99 |
| H437     | CLAIRMONT HOTEL | BOSTON   | 223     | N    |   155 | G879     | 14-SEP-99 | 17-SEP-99 |
| H498     | JAMES PLAZA     | TORONTO  | 345     | N    |   160 | G256     | 30-NOV-99 | 02-DEC-99 |
| H498     | JAMES PLAZA     | TORONTO  | 345     | N    |   160 | G467     | 03-NOV-99 | 05-NOV-99 |
| H111     | EMPIRE HOTEL    | NEW YORK | 412     | N    |   145 | G256     | 10-AUG-99 | 15-AUG-99 |
| H111     | EMPIRE HOTEL    | NEW YORK | 412     | N    |   145 | G367     | 18-AUG-99 | 21-AUG-99 |
| H498     | JAMES PLAZA     | TORONTO  | 467     | N    |   180 | G230     | 15-SEP-99 | 18-SEP-99 |
+----------+-----------------+----------+---------+------+-------+----------+-----------+-----------+
11 rows in set (0.00 sec)

2.List full details of all hotels in New York.
select h.Hotel_NO,h.name,h.city,r.room_no,r.type,r.price,b.Guest_No,b.Date_from,b.Date_to from hotels h,room r,booking b where h.Hotel_No=r.Hotel_NO and b.room_no=r.room_no and h.city='NEW YORK';
+----------+--------------+----------+---------+------+-------+----------+-----------+-----------+
| Hotel_NO | name         | city     | room_no | type | price | Guest_No | Date_from | Date_to   |
+----------+--------------+----------+---------+------+-------+----------+-----------+-----------+
| H235     | PARK PLACE   | NEW YORK | 1267    | N    |   175 | G879     | 05-SEP-99 | 12-SEP-99 |
| H111     | EMPIRE HOTEL | NEW YORK | 412     | N    |   145 | G256     | 10-AUG-99 | 15-AUG-99 |
| H111     | EMPIRE HOTEL | NEW YORK | 412     | N    |   145 | G367     | 18-AUG-99 | 21-AUG-99 |
+----------+--------------+----------+---------+------+-------+----------+-----------+-----------+
3 rows in set (0.00 sec)

3.List the names and cities of all guests, ordered according to their cities.
select name,City from guest order by city;
+---------------+--------------+
| name          | City         |
+---------------+--------------+
| ROBERT SWIFT  | ATLANTA      |
| EDWARD CANE   | BALTIMORE    |
| TARA CUMMINGS | BALTIMORE    |
| TOM HANCOCK   | PHILADELPHIA |
| ADAM WAYNE    | PITTSBURGH   |
| VANESSA PARRY | PITTSBURGH   |
+---------------+--------------+
6 rows in set (0.00 sec)

4.List all details for non-smoking rooms in ascending order of price.
select Room_No,Hotel_No,Price from room where Type='N' order by price;
+---------+----------+-------+
| Room_No | Hotel_No | Price |
+---------+----------+-------+
| 257     | H437     |   140 |
| 412     | H111     |   145 |
| 223     | H437     |   155 |
| 345     | H498     |   160 |
| 1201    | H193     |   175 |
| 1267    | H235     |   175 |
| 467     | H498     |   180 |
| 1289    | H235     |   195 |
+---------+----------+-------+
8 rows in set (0.00 sec)

5.List the number of hotels there are.
 select count(Name) from hotels;
+-------------+
| count(Name) |
+-------------+
|           6 |
+-------------+
1 row in set (0.00 sec)

6.List the cities in which guests live. Each city should be listed only once.
select Distinct City from guest;
+--------------+
| City         |
+--------------+
| BALTIMORE    |
| PHILADELPHIA |
| PITTSBURGH   |
| ATLANTA      |
+--------------+
4 rows in set (0.00 sec)

7.List the average price of a room.
select avg(price) from room;
+------------+
| avg(price) |
+------------+
|   155.6667 |
+------------+
1 row in set (0.01 sec)

8.List hotel names, their room numbers, and the type of that room.
select h.name,r.room_no,r.type from hotels h,room r where h.Hotel_No =r.Hotel_NO;
+------------------+---------+------+
| name             | room_no | type |
+------------------+---------+------+
| EMPIRE HOTEL     | 313     | S    |
| EMPIRE HOTEL     | 412     | N    |
| DEVON HOTEL      | 1001    | S    |
| DEVON HOTEL      | 1201    | N    |
| PARK PLACE       | 1267    | N    |
| PARK PLACE       | 1289    | N    |
| BROWNSTONE HOTEL | 876     | S    |
| BROWNSTONE HOTEL | 898     | S    |
| CLAIRMONT HOTEL  | 223     | N    |
| CLAIRMONT HOTEL  | 257     | N    |
| JAMES PLAZA      | 345     | N    |
| JAMES PLAZA      | 467     | N    |
+------------------+---------+------+
12 rows in set (0.00 sec)

9.List the hotel names, booking dates, and room numbers for all hotels in New York.
select h.name,b.Date_from,b.Date_to,b.room_No from hotels h,booking b where h.hotel_NO=b.Hotel_NO and h.city='NEW YORK';
+--------------+-----------+-----------+---------+
| name         | Date_from | Date_to   | room_No |
+--------------+-----------+-----------+---------+
| EMPIRE HOTEL | 10-AUG-99 | 15-AUG-99 | 412     |
| EMPIRE HOTEL | 18-AUG-99 | 21-AUG-99 | 412     |
| PARK PLACE   | 05-SEP-99 | 12-SEP-99 | 1267    |
+--------------+-----------+-----------+---------+
3 rows in set (0.00 sec)

10.What is the number of bookings that started in the month of September
select * from booking where Date_from LIKE '%SEP%';
+----------+----------+-----------+-----------+---------+
| Hotel_NO | Guest_No | Date_from | Date_to   | Room_No |
+----------+----------+-----------+-----------+---------+
| H193     | G367     | 12-SEP-99 | 14-SEP-99 | 1001    |
| H235     | G879     | 05-SEP-99 | 12-SEP-99 | 1267    |
| H437     | G879     | 14-SEP-99 | 17-SEP-99 | 223     |
| H498     | G230     | 15-SEP-99 | 18-SEP-99 | 467     |
+----------+----------+-----------+-----------+---------+
4 rows in set (0.03 sec)

11.List the names and cities of guests who began a stay in New York in August.
 select name,city from Guest where Guest_NO in(select Guest_no from booking where Date_from like '%AUG%');
+---------------+------------+
| name          | city       |
+---------------+------------+
| ADAM WAYNE    | PITTSBURGH |
| TARA CUMMINGS | BALTIMORE  |
+---------------+------------+
2 rows in set (0.03 sec)

12.List the hotel names and room numbers of any hotel rooms that have not been booked.
select r.room_no,h.name from room r inner join hotels h where room_no NOT IN(select distinct r.room_no from room r inner join booking b where b.room_NO=r.room_no and r.Hotel_No=b.Hotel_No)and h.hotel_no=r.hotel_no;
+---------+------------------+
| room_no | name             |
+---------+------------------+
| 313     | EMPIRE HOTEL     |
| 1289    | PARK PLACE       |
| 876     | BROWNSTONE HOTEL |
| 898     | BROWNSTONE HOTEL |
| 257     | CLAIRMONT HOTEL  |
+---------+------------------+
5 rows in set (0.00 sec)

13.List the hotel name and city of the hotel with the highest priced room.
select name,city  from hotels where Hotel_No=(select Hotel_No from room where price=(select max(price) from room));
+------------+----------+
| name       | city     |
+------------+----------+
| PARK PLACE | NEW YORK |
+------------+----------+
1 row in set (0.06 sec)

14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
 select h.name,h.city,r.room_no,r.price from hotels h,room r where r.price<(select min(prices) from (select min(price) as prices from room group by Hotel_NO having Hotel_No in(select Hotel_No from Hotels where city='Boston'))as t)and h.hotel_no=r.hotel_NO;
+------------------+---------+---------+-------+
| name             | city    | room_no | price |
+------------------+---------+---------+-------+
| BROWNSTONE HOTEL | TORONTO | 876     |   124 |
| BROWNSTONE HOTEL | TORONTO | 898     |   124 |
+------------------+---------+---------+-------+
2 rows in set (0.01 sec)

15.List the average price of a room grouped by city.
 select avg(price),city from hotels h inner join room r where h.hotel_NO =r.Hotel_No group by city;
+------------+----------+
| avg(price) | city     |
+------------+----------+
|   155.0000 | BOSTON   |
|   165.0000 | NEW YORK |
|   147.0000 | TORONTO  |
+------------+----------+
3 rows in set (0.00 sec)









