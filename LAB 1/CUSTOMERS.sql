USE CSE_3A_104;

CREATE TABLE CUSTOMERS(
	CNAME VARCHAR(50) ,
    CITY VARCHAR(50) 
);

INSERT INTO CUSTOMERS(CNAME, CITY)
VALUES
('ANIL' , 'CALCUTTA'),
('SUNIL' , 'DELHI' ),
('MEHUL' , 'BARODA' ),
('MANDAR' , 'PATNA'),
('MADHURI',  'NAGPUR'),
('PRAMOD' , 'NAGPUR'),
('SANDIP' , 'SURAT'),
('SHIVANI',  'BOMBAY'),
('KRANTI',  'BOMBAY'),
('NAREN' , 'BOMBAY');

SELECT * FROM CUSTOMERS;