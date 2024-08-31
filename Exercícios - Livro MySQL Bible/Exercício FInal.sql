#-------------- PAGINA 128 ---------------
DROP DATABASE IF EXISTS sports_booking;
CREATE DATABASE IF NOT EXISTS sports_booking;
USE sports_booking;

#-------------- PAGINA 130 ---------------
CREATE TABLE members(
	id VARCHAR(100),
    pass_word INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    member_since TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_due FLOAT NOT NULL DEFAULT 0.0
);

#-------------- PAGINA 131 ---------------
CREATE TABLE pending_terminations(
	id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    request_date TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_due FLOAT NOT NULL DEFAULT 0.0
);
CREATE TABLE rooms(
	id INT PRIMARY KEY,
    room_type VARCHAR(250),
    price DECIMAL(10,2)
);

#-------------- PAGINA 132 ---------------
CREATE TABLE bookings(
	id INT PRIMARY KEY,
    room_id INT UNIQUE,
    member_id INT,
    booked_date DATE NOT NULL UNIQUE,
    booked_time TIME NOT NULL UNIQUE,
    datetime_of_booking TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_status VARCHAR(250) NOT NULL DEFAULT "Unpaid"
);

#-------------- PAGINA 133 ---------------
ALTER TABLE bookings ADD CONSTRAINT fk2
FOREIGN KEY(room_id) REFERENCES rooms(id);

ALTER TABLE bookings ADD CONSTRAINT fk1
FOREIGN KEY(member_id) REFERENCES members(id);

#-------------- PAGINA 134 ---------------
INSERT INTO members(id,pass_word,email,member_since,payment_due) VALUES
('afeil', 'feil1988<3', 'Abdul.Feil@hotmail.com', '2017-04-15 12:10:13', 0.00),
('amely_18', 'loseweightin18', 'Amely.Bauch91@yahoo.com', '2018-02-06 16:48:43', 0.00),
('bbahringer', 'iambaeu17', 'Beulah_Bahringer@yahoo.com', '2017-12-28 05:36:50', 0.00),
('little31', 'whocares31', 'Anthony_Little31@gmail.com', '2017-06-01 18:30:24', 0.00),
('macejkovic73', 'jadajede12', 'Jada.Macejkovic73@gmail.com', '2017-05-30 17:20:17', 0.00),
('marvin1', 'if009mar', 'Marvin_Schulist@gmail.com', '2018-02-06 18:13:16', 0.00),
('nitzsche77', 'bret77@#', 'Bret_Nitzsche77@gmail.com', '2018-01-09 17:36:49', 0.00),
('noah51', '180ct1976#51', 'Noah51@gmail.com', '2017-12-16 22:59:46', 0.00),
('oreillys', 'reallycool#1', 'Martine_OReilly@yahoo.com', '2017-12-12 05:29:20', 0.00),
('wyattgreat', 'wyatt111', 'Wyatt_Wisozk2@gmail.com', '2017-07-18 16:28:35', 0.00);

#-------------- PAGINA 135 ---------------
INSERT INTO rooms (id, room_type, price) VALUES
('AR', 'Archery Range', 120.00),
('B1', 'Badminton Court', 8.00),
('B2', 'Badminton Court', 8.00),
('MPF1', 'Multi Purpose Field', 50.00),
('MPF2', 'Multi Purpose Field', 60.00),
('T1', 'Tennis Court', 10.00),
('T2', 'Tennis Court', 10.00);

#-------------- PAGINA 136 ---------------
INSERT INTO bookings (id, room_id, booked_date, booked_time, member_id, datetime_of_booking, payment_status) VALUES
(1, 'AR', '2017-12-26', '13:00:00', 'oreillys', '2017-12-20 20:31:27', 'Paid'),
(2, 'MPF1', '2017-12-30', '17:00:00', 'noah51', '2017-12-22 05:22:10', 'Paid'),
(3, 'T2', '2017-12-31', '16:00:00', 'macejkovic73', '2017-12-28 18:14:23', 'Paid'),
(4, 'T1', '2018-03-05', '08:00:00', 'little31', '2018-02-22 20:19:17', 'Unpaid'),
(5, 'MPF2', '2018-03-02', '11:00:00', 'marvin1', '2018-03-01 16:13:45', 'Paid'),
(6, 'B1', '2018-03-28', '16:00:00', 'marvin1', '2018-03-23 22:46:36', 'Paid'),
(7, 'B1', '2018-04-15', '14:00:00', 'macejkovic73', '2018-04-12 22:23:00', 'Cancelled'),
(8, 'T1', '2018-04-23', '10:00:00', 'macejkovic73', '2018-04-19 10:49:00', 'Cancelled'),
(9, 'T1', '2018-05-25', '10:00:00', 'marvin1', '2018-05-21 11:20:46', 'Unpaid'),
(10, 'B2', '2018-06-12', '15:00:00', 'bbahringer', '2018-05-30 14:40:23', 'Paid');

CREATE VIEW member_bookings AS 
SELECT bookings.id,
	   bookings.room_id,
       bookings.booked_date,
       bookings.booked_time,
       bookings.member_id,
       bookings.datetime_of_booking,
       rooms.price,
       bookings.payment_status
FROM bookings INNER JOIN rooms
ON bookings.member_id = rooms.id;
SELECT * FROM member_bookings





    