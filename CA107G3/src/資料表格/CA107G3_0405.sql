--�إߪ��: 
--------------------------------------------------------------------------------------------------------
DROP TABLE RESTAURANT_RESPONSES;
DROP TABLE FRIEND_LIST;
DROP TABLE CUSTOMER_SERVICE_RECORD;
DROP TABLE CHAT_RECORD;
DROP TABLE ARTICLE_REPORTED;
DROP TABLE ARTICLE_PUBLISHED;
DROP TABLE COMMENT_REPORTED;
DROP TABLE MEMBER_WALLET_LIST;
DROP TABLE COMMENTS;
DROP TABLE ORDER_DETAIL;
DROP TABLE RESTAURANT_MENU ;
DROP TABLE RESERVATION_TABLE_NUMBER;
DROP TABLE RESERVATION_TABLE_ORDERED;
DROP TABLE EXCEPTION_DATE;
DROP TABLE RESERVATION_TIME;
DROP TABLE RES_TRANSACTION_LIST;
DROP TABLE FAV_RES;
DROP TABLE REP_RES;
DROP TABLE WAIT_POS ;
DROP TABLE ORD;
DROP TABLE TABLES;
DROP TABLE NEWS ;
DROP TABLE FEATURE_DETAIL;
DROP TABLE FEATURE;
DROP TABLE EMPLOYEE;
DROP TABLE VENDOR ;
DROP TABLE MEMBER;


DROP SEQUENCE ARTPUB_SEQ;
DROP SEQUENCE ARTRE_SEQ;
DROP SEQUENCE CH_RE_SEQ;
DROP SEQUENCE CU_SE_RE_SEQ;
DROP SEQUENCE RESTAURANT_RESPONSES_SEQ;
DROP SEQUENCE COMMENT_REPORTED_SEQ;
DROP SEQUENCE COMMENTS_SEQ;
DROP SEQUENCE EMPLOYEE_SEQ;
DROP SEQUENCE EXCEPTION_DATE_SEQ;
DROP SEQUENCE FEATURE_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE MEMBER_WALLET_LIST_SEQ;
DROP SEQUENCE NEWS_SEQ;
DROP SEQUENCE ORD_SEQ;
DROP SEQUENCE REP_RES_SEQ;
DROP SEQUENCE RES_T_L_SEQ;
DROP SEQUENCE RESERVATION_T_SEQ;
DROP SEQUENCE RESERVATION_TABLE_NUMBER_SEQ;
DROP SEQUENCE RESERVATION_TABLE_ORDERED_SEQ;
DROP SEQUENCE RESTAURANT_MENU_SEQ;
DROP SEQUENCE TABLES_SEQ;
DROP SEQUENCE VENDOR_SEQ;
DROP SEQUENCE WAIT_POS_SEQ;
----------------------------------------------------------------
alter session set nls_date_format = 'dd/MON/yyyy hh24:mi:ss';
----------------------------------------------------------------
--�|��
CREATE TABLE MEMBER  ( 								
  MEM_NO 			VARCHAR2(7 BYTE) 	NOT NULL
, MEM_NAME 			VARCHAR2(10 BYTE)	NOT NULL UNIQUE
, MEM_ACCOUNT 		VARCHAR2(10 BYTE) 	NOT NULL 
, MEM_PWD 			VARCHAR2(10 BYTE)	NOT NULL 
, MEM_GENDER 		VARCHAR2(2 BYTE)	NOT NULL 
, MEM_MAIL 			VARCHAR2(50 BYTE) 	NOT NULL UNIQUE
, MEM_ID 			VARCHAR2(10 BYTE) 	NOT NULL UNIQUE 
, MEM_TEL 			VARCHAR2(10 BYTE)  NOT NULL 
, MEM_STATUS 		VARCHAR2(2 BYTE) 	DEFAULT '2' 
, MEM_PIC BLOB  
, MEM_BALANCE 		NUMBER(10, 0) 		NOT NULL
, MEM_NICKNAME 		VARCHAR2(50 BYTE) 	NOT NULL 
, CONSTRAINT MEMBER_MEM_NO_PK PRIMARY KEY (MEM_NO)
);
--SEQUENCE MEM_NO
CREATE SEQUENCE MEMBER_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1				   -- �C���W�[�ƶq
START WITH 1				   -- �q1�}�l
NOMAXVALUE					   -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

--
-- �d��:
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'���j��','qq123','aa123','M','qq123@gmail.com','A123456789','0800092000','2',NULL,399,'���A');
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'�i���E','yen1888152','yen1888152','M','qaz123@gmail.com','H107242497','0970268373','1',NULL,499,'�ª�');
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'�i�ѧ�','nbx2973446','nbx2973446','M','sapien@metuean.com','A132729384','0988647356','3',NULL,599,'?������');
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'�i�p','utx7773166','utx7773166','F','Proin@dolorDgla.com','A116709980','0953147021','3',NULL,699,'��s?�ʴ�');
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'���j��','wzq0833787','pvq0699636','F','at.velit.Cras@orci.edu','A162110259','0963418454','1',NULL,799,'?���X��');
INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),'���R��','val5080809','val5080809','F','monulus@faucibusleoin.org','F172002312','0930779472','2',NULL,899,'�D?�հ�');
-- INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,NULL,?,?)
--------------------------------------------------------------------------------------------------
--�t��
CREATE TABLE VENDOR  (
  VENDOR_NO 		VARCHAR2(7 BYTE) 	NOT NULL
, V_ACCOUNT 		VARCHAR2(10 BYTE) 	NOT NULL UNIQUE 
, V_PWD 			VARCHAR2(10 BYTE) 	NOT NULL 
, V_MAIL 			VARCHAR2(50 BYTE) 	NOT NULL UNIQUE 
, V_TEL 			VARCHAR2(10 BYTE)   NOT NULL 
, V_N_CODE 			VARCHAR2(10 BYTE) 
, V_AD_CODE 		VARCHAR2(10 BYTE) 	NOT NULL 
, V_ADDRESS1 		VARCHAR2(10 BYTE) 	NOT NULL 
, V_ADDRESS2 		VARCHAR2(10 BYTE) 	NOT NULL 
, V_ADDRESS3 		VARCHAR2(100 BYTE) 	NOT NULL 
, V_WALLET 			VARCHAR2(20 BYTE)   NOT NULL  UNIQUE 
, V_NAME 			VARCHAR2(50 BYTE) 	NOT NULL 
, V_W_NO 			NUMBER(10, 0) 		DEFAULT 0 NOT NULL
, V_N_NO 			NUMBER(10, 0) 		DEFAULT 0 NOT NULL
, V_ALT_NO 			NUMBER(10, 0) 		DEFAULT 0 NOT NULL
, V_START_TIME 		VARCHAR2(10 BYTE) 	NOT NULL 
, V_END_TIME 		VARCHAR2(10 BYTE) 	NOT NULL 
, V_DAY 			VARCHAR2(7 BYTE) 	NOT NULL
, V_TURN_TIME 		VARCHAR2(10 BYTE) 	NOT NULL  
, V_PIC BLOB
, V_AD BLOB
, V_STATUS 			VARCHAR2(2 BYTE)	DEFAULT '0' 
, CONSTRAINT VENDOR_VENDOR_NO_PK PRIMARY KEY (VENDOR_NO)
);
--SEQUENCE VENDOR_NO
CREATE SEQUENCE VENDOR_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- �d��:
INSERT INTO VENDOR VALUES ('V'||LPAD(to_char(VENDOR_SEQ.NEXTVAL), 6, '0'),'jkl8519653','jkl8519653','jkl8519653@gmail.com','81017799','02','244',
 '�x�_��','�H�q��','������45���x�_101�ʪ�����','056540248677','������',1,1,1,'0900','2000','1111100','8',NULL,NULL,'0');
 INSERT INTO VENDOR VALUES ('V'||LPAD(to_char(VENDOR_SEQ.NEXTVAL), 6, '0'),'rmv6574499','rmv6574499','rmv6574499@gmail.com','27239987','02','110',
'�x�_��','�H�q��','�Q�ظ�9��','15585812545','�˫�����Ʋz - �x�_�T�V�H�q��',1,1,1,'0900','2000','1111100','2',NULL,NULL,'1');
 INSERT INTO VENDOR VALUES ('V'||LPAD(to_char(VENDOR_SEQ.NEXTVAL), 6, '0'),'cth9614531','cth9614531','cth9614531@gmail.com','24652222','04','407',
 '�x����','��ٰ�','��w�@��168��','13953979422','�ΰ��N�װ�w��',1,1,1,'1600','2300','1111111','4',NULL,NULL,'2');
 INSERT INTO VENDOR VALUES ('V'||LPAD(to_char(VENDOR_SEQ.NEXTVAL), 6, '0'),'dfh3689153','dfh3689153','dfh3689153@gmail.com','22271927','04','400',
 '�x����','����','���s��20��','18839540972','�c�체��',99,99,99,'1300','1700','1111111','0.5',NULL,NULL,'3');
 INSERT INTO VENDOR VALUES ('V'||LPAD(to_char(VENDOR_SEQ.NEXTVAL), 6, '0'),'leg0543027','leg0543027','leg0543027@gmail.com','2165711','07','801',
 '������','�e����','�s�и�207��','15984315231','���}���|�»�����',55,66,77,'1300','1700','0101010','4',NULL,NULL,'4');


------------------------------------------------------------------------------------------------------------------------------
--�Ԧ����
CREATE TABLE WAIT_POS (
  WAIT_NO 			VARCHAR2(10 BYTE)	NOT NULL
, MEM_NO 			VARCHAR2(7 BYTE) 	NOT NULL
, VENDOR_NO 		VARCHAR2(7 BYTE) 	NOT NULL
, WAIT_MUN 			NUMBER(10, 0) 		NOT NULL
, WAIT_PEOPLE     	NUMBER(10, 0) 		NOT NULL
, WAIT_GETTIME     	DATE  				
, WAIT_REMIND     	NUMBER(10, 0)
, WAIT_STATUS     	NUMBER(10, 0) 		DEFAULT 2 NOT NULL 
--FK
, CONSTRAINT WAIT_POS_MEM_NO_FK		FOREIGN KEY (MEM_NO)	REFERENCES MEMBER (MEM_NO)
, CONSTRAINT WAIT_POS_VENDOR_NO_FK	FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT WAIT_POS_WAIT_NO_PK	PRIMARY KEY (WAIT_NO)
);

--SEQUENCE  WAIT_NO 
CREATE SEQUENCE WAIT_POS_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--�d��:
INSERT INTO WAIT_POS VALUES ('WP'||LPAD(to_char(WAIT_POS_SEQ.NEXTVAL), 8, '0'),'M000001','V000001',10,7,sysdate,3,2);
INSERT INTO WAIT_POS VALUES ('WP'||LPAD(to_char(WAIT_POS_SEQ.NEXTVAL), 8, '0'),'M000002','V000001',15,6,sysdate,3,2);
INSERT INTO WAIT_POS VALUES ('WP'||LPAD(to_char(WAIT_POS_SEQ.NEXTVAL), 8, '0'),'M000003','V000003',16,1,sysdate,3,2);
INSERT INTO WAIT_POS VALUES ('WP'||LPAD(to_char(WAIT_POS_SEQ.NEXTVAL), 8, '0'),'M000004','V000004',13,3,sysdate,3,2);
INSERT INTO WAIT_POS VALUES ('WP'||LPAD(to_char(WAIT_POS_SEQ.NEXTVAL), 8, '0'),'M000005','V000005',60,4,sysdate,3,2);


-----------------------------------------------------------------
--�\�U���|�M��
CREATE TABLE REP_RES (
  REP_RES_NO 		VARCHAR2(10 BYTE) 	NOT NULL
, MEM_NO 			VARCHAR2(7 BYTE) 	NOT NULL
, VENDOR_NO 		VARCHAR2(7 BYTE) 	NOT NULL
, REP_RES_DETL 		VARCHAR2(100 BYTE) 	NOT NULL 
, REP_RES_TIME     	DATE
, REP_RES_STATUS    VARCHAR2(2 BYTE) 	NOT NULL 
--FK
, CONSTRAINT REP_RES_MEM_NO_FK		FOREIGN KEY (MEM_NO)	REFERENCES MEMBER (MEM_NO)
, CONSTRAINT REP_RES_VENDOR_NO_FK	FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT REP_RES_NO_PK			PRIMARY KEY (REP_RES_NO)
);

--SEQUENCE  WAIT_NO 
CREATE SEQUENCE REP_RES_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

--�d��:
INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),'M000001','V000001','�F������Y',sysdate,'2');
INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),'M000002','V000002','�A�ȺA�פ��n',sysdate,'1');
INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),'M000003','V000003','����������',sysdate,'3');
INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),'M000004','V000004','�n����LINE',sysdate,'1');
INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),'M000005','V000005','�ڬO�Ӷê�',sysdate,'3');
-----------------------------------------------------------------
--���é��a�M��
CREATE TABLE FAV_RES (
  MEM_NO 			VARCHAR2(7 BYTE) NOT NULL
, VENDOR_NO 		VARCHAR2(7 BYTE) NOT NULL
--FK
, CONSTRAINT FAV_RES_MEM_NO_FK		FOREIGN KEY (MEM_NO)	REFERENCES MEMBER (MEM_NO)
, CONSTRAINT FAV_RES_VENDOR_NO_FK	FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT FAV_RES_MEM_NO_VEN_DOR_NO_PK	PRIMARY KEY (MEM_NO,VENDOR_NO )
);

--�d��:
INSERT INTO FAV_RES VALUES ('M000001','V000001');
INSERT INTO FAV_RES VALUES ('M000002','V000002');
INSERT INTO FAV_RES VALUES ('M000003','V000003');
INSERT INTO FAV_RES VALUES ('M000004','V000004');
INSERT INTO FAV_RES VALUES ('M000005','V000005');
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--���   �഼

CREATE TABLE TABLES (
    TBL_NO      VARCHAR2(7 BYTE),
    VENDOR_NO   VARCHAR2(7 BYTE) NOT NULL,
    TBL_NAME    VARCHAR2(30) NOT NULL,
    TBL_SIZE    NUMBER(1) NOT NULL,
    TBL_TYPE    NUMBER(1) NOT NULL,
    TBL_X       NUMBER(4),
    TBL_Y       NUMBER(4),
    --PK
    CONSTRAINT TABLES_TBL_NO_PK PRIMARY KEY (TBL_NO),
    --FK
    CONSTRAINT TABLES_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
);

CREATE SEQUENCE TABLES_seq INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;

INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','A1', 1,1,200,200);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','A2', 1,1,NULL,NULL);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','A3', 1,1,NULL,NULL);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','B1', 2,2,300,400);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','B2', 2,1,500,250);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','B3', 2,1,20,30);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','C1', 3,1,150,200);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','C2', 3,2,200,200);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','D1', 4,1,400,230);
INSERT INTO TABLES VALUES ('T'||LPAD(to_char(tables_seq.NEXTVAL), 6, '0'),'V000001','E1', 5,1,300,120);

------------------------------------------------------------------------------------------------------------------------------------------------------
--
--�q��   �഼

CREATE TABLE ORD (
    ORD_NO          VARCHAR2(15),
    MEM_NO          VARCHAR2(7) NOT NULL,
    VENDOR_NO       VARCHAR2(7) NOT NULL,
    TBL_NO          VARCHAR2(7),
    PARTY_SIZE      NUMBER(2) NOT NULL,
    SHARE_MEM_NO1   VARCHAR2(7),
    SHARE_MEM_NO2   VARCHAR2(7),
    SHARE_AMOUNT    NUMBER(7),
    ORD_TIME        DATE NOT NULL,
    BOOKING_DATE    DATE NOT NULL,
    BOOKING_TIME    VARCHAR2(5) NOT NULL,
    NOTES           VARCHAR2(150),
    TOTAL           NUMBER(7) NOT NULL,
    ARRIVAL_TIME    VARCHAR2(5),
    FINISH_TIME     VARCHAR2(5),
    VERIF_CODE      VARCHAR2(20),
    STATUS          NUMBER(1) NOT NULL,
--PK    
    CONSTRAINT ORD_ORD_NO_PK PRIMARY KEY ( ORD_NO ),
    CONSTRAINT ORD_MEM_NO_FK FOREIGN KEY ( MEM_NO ) REFERENCES MEMBER ( MEM_NO ),
--FK
    CONSTRAINT ORD_SHARE_MEM_NO1_FK FOREIGN KEY ( SHARE_MEM_NO1 ) REFERENCES MEMBER ( MEM_NO ),
    CONSTRAINT ORD_SHARE_MEM_NO2_FK FOREIGN KEY ( SHARE_MEM_NO2 ) REFERENCES MEMBER ( MEM_NO ),
    CONSTRAINT ORD_VENDOR_NO_FK FOREIGN KEY ( VENDOR_NO ) REFERENCES VENDOR ( VENDOR_NO ),
    CONSTRAINT ORD_TBL_NO_FK FOREIGN KEY ( TBL_NO ) REFERENCES TABLES ( TBL_NO )
);
        
CREATE SEQUENCE ORD_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;


INSERT INTO ORD VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.NEXTVAL), 6, '0'),'M000001','V000001','T000001',5,NULL,NULL,NULL,sysdate,TO_DATE('2019-03-31', 'YYYY-MM-DD'),'10:30',NULL,1600,NULL,NULL,'qL62THYwvZuVkka2aDTt',1);
INSERT INTO ORD VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.NEXTVAL), 6, '0'),'M000002','V000002','T000001',2,'M000002',NULL,400,sysdate,TO_DATE('2019-03-31', 'YYYY-MM-DD'),'11:00','�е��ھa������m',1000,'11:10','12:05','Q3DbGZ4tHLYHa7NdHwSx',1);
INSERT INTO ORD VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.NEXTVAL), 6, '0'),'M000003','V000003','T000001',1,NULL,NULL,NULL,sysdate,TO_DATE('2019-04-01', 'YYYY-MM-DD'),'14:30',NULL,500,NULL,NULL,'nFaa5DJu7SqvZqXNmjSz',2);
INSERT INTO ORD VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.NEXTVAL), 6, '0'),'M000004','V000004','T000001',6,'M000003','M000004',2000,sysdate,TO_DATE('2019-04-01', 'YYYY-MM-DD'),'17:00',NULL,3000,NULL,NULL,'H6xLzWZykL3ArVV9xFJp',3);
INSERT INTO ORD VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.NEXTVAL), 6, '0'),'M000005','V000005','T000001',4,'M000003',NULL,2000,sysdate,TO_DATE('2019-04-10', 'YYYY-MM-DD'),'19:30',NULL,5000,NULL,NULL,'8JPXY6wQc5bvrN2y6h4h',3);

-----------------------------------------------------------------------------------------------------------------------------------------------------


--�\�U�b��������  �f�Q
CREATE TABLE RES_TRANSACTION_LIST  (                 
  TRST_NO       VARCHAR2(10 BYTE) 
, VENDOR_NO     VARCHAR2(7 BYTE)  NOT NULL
, AMOUNT        NUMBER(7) 
, PAY_DATE      DATE  
, ORD_NO        VARCHAR2(15)
, V_WALLET      NUMBER(20, 0)   NOT NULL

--FK
, CONSTRAINT RTL_ORD_NO_FK FOREIGN KEY (ORD_NO) REFERENCES ORD (ORD_NO)
, CONSTRAINT RTL_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT RTL_TRST_NO_PK PRIMARY KEY (TRST_NO)
); 
--SEQUENCE TRST_NO
CREATE SEQUENCE RES_T_L_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                  -- �C���W�[�ƶq
START WITH 1                    -- �q1�}�l
NOMAXVALUE                      -- �S���̤j��
NOCYCLE                         -- ���`��
NOCACHE;                        -- ���֨�,����� 

INSERT INTO RES_TRANSACTION_LIST VALUES ('RTL'||LPAD(to_char(RES_T_L_SEQ.NEXTVAL), 7, '0'),'V000001','1000',sysdate,to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'01');
INSERT INTO RES_TRANSACTION_LIST VALUES ('RTL'||LPAD(to_char(RES_T_L_SEQ.NEXTVAL), 7, '0'),'V000002','2000',sysdate,to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'02');
INSERT INTO RES_TRANSACTION_LIST VALUES ('RTL'||LPAD(to_char(RES_T_L_SEQ.NEXTVAL), 7, '0'),'V000003','3000',sysdate,to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'03');
INSERT INTO RES_TRANSACTION_LIST VALUES ('RTL'||LPAD(to_char(RES_T_L_SEQ.NEXTVAL), 7, '0'),'V000004','4000',sysdate,to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'04');
INSERT INTO RES_TRANSACTION_LIST VALUES ('RTL'||LPAD(to_char(RES_T_L_SEQ.NEXTVAL), 7, '0'),'V000005','5000',sysdate,to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'05');

-----------------------------------------------------------------------------------------------------------------------------------------------------
--�\�U�}��q��ɬq   �f�Q

CREATE TABLE RESERVATION_TIME  (                
  RT_NO       VARCHAR2(10 BYTE) 
, VENDOR_NO   VARCHAR2(7 BYTE)  NOT NULL--�����Ʈ榡���~
, R_TIME      VARCHAR2(10 BYTE)
--FK
, CONSTRAINT RT_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT RT_RT_NO_PK PRIMARY KEY (RT_NO)
); 
--SEQUENCE TRST_NO
CREATE SEQUENCE RESERVATION_T_SEQ -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1           -- �C���W�[�ƶq
START WITH 1           -- �q1�}�l
NOMAXVALUE             -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;             -- ���֨�,�����

INSERT INTO RESERVATION_TIME VALUES ('RT'||LPAD(to_char(RESERVATION_T_SEQ.NEXTVAL), 8, '0'),'V000001',TO_CHAR(1800,'0000'));
INSERT INTO RESERVATION_TIME VALUES ('RT'||LPAD(to_char(RESERVATION_T_SEQ.NEXTVAL), 8, '0'),'V000002',TO_CHAR(1100,'0000'));
INSERT INTO RESERVATION_TIME VALUES ('RT'||LPAD(to_char(RESERVATION_T_SEQ.NEXTVAL), 8, '0'),'V000003',TO_CHAR(1200,'0000'));
INSERT INTO RESERVATION_TIME VALUES ('RT'||LPAD(to_char(RESERVATION_T_SEQ.NEXTVAL), 8, '0'),'V000004',TO_CHAR(1300,'0000'));
INSERT INTO RESERVATION_TIME VALUES ('RT'||LPAD(to_char(RESERVATION_T_SEQ.NEXTVAL), 8, '0'),'V000005',TO_CHAR(1700,'0000'));
-----------------------------------------------------------------------------------------------------------------------------------------------------
--�\�U���}����    �f�Q
CREATE TABLE EXCEPTION_DATE  ( 								
  EXC_NO			VARCHAR2(10 BYTE) --���ƫ��A���~
, VENDOR_NO			VARCHAR2(7 BYTE)  NOT NULL--�����Ʈ榡���~
, EXC_DATE 			DATE
--FK
, CONSTRAINT EXCEPTION_DATE_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT EXCEPTION_DATE_EXC_NO_PK PRIMARY KEY (EXC_NO)
); 
--SEQUENCE TRST_NO
CREATE SEQUENCE EXCEPTION_DATE_SEQ -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1				   -- �C���W�[�ƶq
START WITH 1				   -- �q1�}�l
NOMAXVALUE					   -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE; 					   -- ���֨�,�����

INSERT INTO EXCEPTION_DATE VALUES ('ED'||LPAD(to_char(EXCEPTION_DATE_SEQ.NEXTVAL), 8, '0'),'V000001',to_date('25-7��-18','DD-MON-RR'));
INSERT INTO EXCEPTION_DATE VALUES ('ED'||LPAD(to_char(EXCEPTION_DATE_SEQ.NEXTVAL), 8, '0'),'V000002',to_date('23-7��-18','DD-MON-RR'));
INSERT INTO EXCEPTION_DATE VALUES ('ED'||LPAD(to_char(EXCEPTION_DATE_SEQ.NEXTVAL), 8, '0'),'V000003',to_date('22-7��-18','DD-MON-RR'));
INSERT INTO EXCEPTION_DATE VALUES ('ED'||LPAD(to_char(EXCEPTION_DATE_SEQ.NEXTVAL), 8, '0'),'V000004',to_date('21-7��-18','DD-MON-RR'));
INSERT INTO EXCEPTION_DATE VALUES ('ED'||LPAD(to_char(EXCEPTION_DATE_SEQ.NEXTVAL), 8, '0'),'V000005',to_date('20-7��-18','DD-MON-RR'));

-----------------------------------------------------------------------------------------------------------------------------------------------------

--�\�U�w�q���ƶq   �f�Q
CREATE TABLE RESERVATION_TABLE_ORDERED  (                               
  RTO_NO            VARCHAR2(10) 
, VENDOR_NO         VARCHAR2(7 BYTE)  NOT NULL--�����Ʈ榡���~
, BOOKING_DATE      DATE
, BOOKING_TIME      VARCHAR2(5)
, TBL_O_NUM1       NUMBER(10)
, TBL_O_NUM2       NUMBER(10)
, TBL_O_NUM3       NUMBER(10)
, TBL_O_NUM4       NUMBER(10)
, TBL_O_NUM5       NUMBER(10)
, TBL_ORDERED1     NUMBER(10)
, TBL_ORDERED2     NUMBER(10)
, TBL_ORDERED3     NUMBER(10)
, TBL_ORDERED4     NUMBER(10)
, TBL_ORDERED5     NUMBER(10)

--FK
, CONSTRAINT RTO_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT RTO_RTO_NO_PK PRIMARY KEY (RTO_NO)
); 
--SEQUENCE TRST_NO
CREATE SEQUENCE RESERVATION_TABLE_ORDERED_SEQ -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                 -- �C���W�[�ƶq
START WITH 1                   -- �q1�}�l
NOMAXVALUE                     -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����


INSERT INTO RESERVATION_TABLE_ORDERED VALUES ('RTO'||LPAD(to_char(RESERVATION_TABLE_ORDERED_SEQ.NEXTVAL), 7, '0'),'V000001',to_date('20-7��-18','DD-MON-RR'),'12:00',2,2,2,2,0,2,1,1,1,0);
INSERT INTO RESERVATION_TABLE_ORDERED VALUES ('RTO'||LPAD(to_char(RESERVATION_TABLE_ORDERED_SEQ.NEXTVAL), 7, '0'),'V000002',to_date('20-8��-18','DD-MON-RR'),'17:00',3,2,2,2,0,1,2,1,1,0);
INSERT INTO RESERVATION_TABLE_ORDERED VALUES ('RTO'||LPAD(to_char(RESERVATION_TABLE_ORDERED_SEQ.NEXTVAL), 7, '0'),'V000003',to_date('20-9��-18','DD-MON-RR'),'20:00',4,2,2,2,0,1,1,1,1,0);
INSERT INTO RESERVATION_TABLE_ORDERED VALUES ('RTO'||LPAD(to_char(RESERVATION_TABLE_ORDERED_SEQ.NEXTVAL), 7, '0'),'V000004',to_date('20-10��-18','DD-MON-RR'),'13:00',2,3,2,2,0,1,1,2,1,0);
INSERT INTO RESERVATION_TABLE_ORDERED VALUES ('RTO'||LPAD(to_char(RESERVATION_TABLE_ORDERED_SEQ.NEXTVAL), 7, '0'),'V000005',to_date('20-11��-18','DD-MON-RR'),'11:00',3,2,3,2,0,2,1,2,1,0);

-----------------------------------------------------------------------------------------------------------------------------------------------------
--�\�U�}��q����ƶq   �f�Q
CREATE TABLE RESERVATION_TABLE_NUMBER  (                                
  RTN_NO            VARCHAR2(10) 
, VENDOR_NO         VARCHAR2(7 BYTE)  NOT NULL--�����Ʈ榡���~
, RTBL_O_NUM1         NUMBER
, RTBL_O_NUM2         NUMBER
, RTBL_O_NUM3         NUMBER
, RTBL_O_NUM4         NUMBER
, RTBL_O_NUM5         NUMBER

--FK
, CONSTRAINT RTN_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)
--PK
, CONSTRAINT RTN_RTN_NO_PK PRIMARY KEY (RTN_NO)
); 
--SEQUENCE TRST_NO
CREATE SEQUENCE RESERVATION_TABLE_NUMBER_SEQ -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                 -- �C���W�[�ƶq
START WITH 1                   -- �q1�}�l
NOMAXVALUE                     -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

INSERT INTO RESERVATION_TABLE_NUMBER VALUES ('ETN'||LPAD(to_char(RESERVATION_TABLE_NUMBER_SEQ.NEXTVAL), 7, '0'),'V000001',5,3,5,3,5);
INSERT INTO RESERVATION_TABLE_NUMBER VALUES ('ETN'||LPAD(to_char(RESERVATION_TABLE_NUMBER_SEQ.NEXTVAL), 7, '0'),'V000002',4,5,4,2,6);
INSERT INTO RESERVATION_TABLE_NUMBER VALUES ('ETN'||LPAD(to_char(RESERVATION_TABLE_NUMBER_SEQ.NEXTVAL), 7, '0'),'V000003',6,1,4,5,8);
INSERT INTO RESERVATION_TABLE_NUMBER VALUES ('ETN'||LPAD(to_char(RESERVATION_TABLE_NUMBER_SEQ.NEXTVAL), 7, '0'),'V000004',4,2,3,6,7);
INSERT INTO RESERVATION_TABLE_NUMBER VALUES ('ETN'||LPAD(to_char(RESERVATION_TABLE_NUMBER_SEQ.NEXTVAL), 7, '0'),'V000005',3,6,4,2,4);

-----------------------------------------------------------------------------------------------------------------------------------------------------
--�\�U���M��  �m��

CREATE TABLE RESTAURANT_MENU  (                                 
  MENU_NO           VARCHAR2(10 BYTE) NOT NULL
, VENDOR_NO         VARCHAR2(7 BYTE) 
, MENU_NAME         VARCHAR2(100 BYTE)
, MENU_PRICE        VARCHAR2(5 BYTE) 
, MENU_PIC BLOB     
, MENU_STAT         NUMBER(1)         
, MENU_TEXT         VARCHAR2(500 BYTE) 
--PK
, CONSTRAINT RESTAURANT_MENU_MENU_NO_PK PRIMARY KEY (MENU_NO)
--FK
, CONSTRAINT RESTAURANT_MENU_VENDOR_NO_FK FOREIGN KEY (VENDOR_NO) REFERENCES VENDOR (VENDOR_NO)

);
--SEQUENCE MEM_NO
CREATE SEQUENCE RESTAURANT_MENU_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                 -- �C���W�[�ƶq
START WITH 1                   -- �q1�}�l
NOMAXVALUE                     -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

INSERT INTO RESTAURANT_MENU VALUES ('RM'||LPAD(to_char(RESTAURANT_MENU_SEQ.NEXTVAL), 8, '0')
    ,'V000001','�������','777',null,1,'�ҥH�ڻ�������ĩO�H');

INSERT INTO RESTAURANT_MENU VALUES ('RM'||LPAD(to_char(RESTAURANT_MENU_SEQ.NEXTVAL), 8, '0')
    ,'V000002','���G�T����','9000',null,1,'���u�O�ӿب�F�Цw�A�A���}�A�v��¶�F�@�j��A�̫��F���ҬɡA���M�O�A���Q�Ǫ��A�A�v�Ū��Ʋz�A�ҥH���O�A�H�̲߳��٬O�n�^��G�m�Ӫ�');

INSERT INTO RESTAURANT_MENU VALUES ('RM'||LPAD(to_char(RESTAURANT_MENU_SEQ.NEXTVAL), 8, '0')
    ,'V000003','�k���M�J','30',null,1,'���J�a�`��A��߫K�y��');

INSERT INTO RESTAURANT_MENU VALUES ('RM'||LPAD(to_char(RESTAURANT_MENU_SEQ.NEXTVAL), 8, '0')
    ,'V000004','���ѹC�s��K','65536',null,1,'�o����ͥs�Z���a�A�A���S���Q�L�~�|�������H�A�쩳�u���b�l�D����O,���ɭԧڹ�A�̻��n�A�Ӥ@�L�A�ä��O�]���{�l�j�~�����A���O�]���A���Ʋz��p��a���Ʋz�A�u���ܦn�Y�A�i�O�A�o�ڵ��F�ڡA�ڹ�b���A�P��D�`��ѡA�D�`�i���A���٬O�Z�ջ��a�A�A�����D���O�p���A�ӬO�A���H�榳���D�C');

INSERT INTO RESTAURANT_MENU VALUES ('RM'||LPAD(to_char(RESTAURANT_MENU_SEQ.NEXTVAL), 8, '0')
    ,'V000005','�S�żp�v�p��a�����\','9487',null,1,'���H���зN�o���ϥH���R��t�ӱ����A�A���ӷP��F�\�C�h�F���Q���O�M�ޥ����I�g�A���O�p�v���P�R�ˡC�A�����Ʋz�S�����������n�A�A�٬O�^�h�i�m21�p�ɦA�ӧa ');


-----------------------------------------------------------------------------------------------------------------------------------------------------
--�q����� --�഼

CREATE TABLE ORDER_DETAIL (
   ORD_NO    VARCHAR2(15)
 , MENU_NO   VARCHAR2(10)
 , QTY       NUMBER(2) NOT NULL
 , PRICE     NUMBER(7) NOT NULL
 
 --PK
 , CONSTRAINT ORDER_DETAIL_ORD_MENU_NO_PK PRIMARY KEY ( ORD_NO, MENU_NO )
--FK
 , CONSTRAINT ORDER_DETAIL_ORD_NO_FK FOREIGN KEY ( ORD_NO ) REFERENCES ORD ( ORD_NO )
 , CONSTRAINT ORDER_DETAIL_MENU_NO_FK FOREIGN KEY ( MENU_NO ) REFERENCES RESTAURANT_MENU ( MENU_NO )
);

INSERT INTO ORDER_DETAIL VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'RM00000001',2,400);
INSERT INTO ORDER_DETAIL VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'RM00000002',2,300);
INSERT INTO ORDER_DETAIL VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'RM00000003',1,200);
INSERT INTO ORDER_DETAIL VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'RM00000004',1,400);
INSERT INTO ORDER_DETAIL VALUES (to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'RM00000005',1,600);


-----------------------------------------------------------------------------------------------------------------------------------------------------
--����   --�഼
CREATE TABLE COMMENTS (
    CMNT_NO       VARCHAR2(7),
    ORD_NO        VARCHAR2(15) NOT NULL,
    VENDOR_NO     VARCHAR2(7) NOT NULL,
    SCORE         NUMBER(1) NOT NULL,
    CMNT          VARCHAR2(1200),
    TIME          TIMESTAMP NOT NULL,
    CMNT_STATUS   NUMBER(1) NOT NULL,
--PK
    CONSTRAINT COMMENT_CMNT_NO_PK PRIMARY KEY ( CMNT_NO ),
--FK 
    CONSTRAINT COMMENT_ORD_NO_FK FOREIGN KEY ( ORD_NO ) REFERENCES ORD ( ORD_NO ),
    CONSTRAINT COMMENT_VENDOR_NO_FK FOREIGN KEY ( VENDOR_NO ) REFERENCES VENDOR ( VENDOR_NO )
);

CREATE SEQUENCE COMMENTS_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE;

INSERT INTO COMMENTS VALUES ('C'||LPAD(to_char(comments_seq.NEXTVAL), 6, '0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'V000001',4,'�a�I�ܤ�K�A�F�񱶹B���A���������u����^�ܦn�A�A�X�˪B�n�͡B���Q�E�\�B��ߨơA�~�[�W���������A�A�ȭ��M���A���˵��j�a�o���u���\�U�C',CURRENT_TIMESTAMP ,1);
INSERT INTO COMMENTS VALUES ('C'||LPAD(to_char(comments_seq.NEXTVAL), 6, '0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'V000002',4,'���\���ҫܦn�A�����A�ȿˤ��A���˨ӥ��\�I�\�I����X�z�A�a�I�]�b�����ߡA�Q����K�I�D�`�A�X�B�͡B���Q�E�\�I',CURRENT_TIMESTAMP ,1);
INSERT INTO COMMENTS VALUES ('C'||LPAD(to_char(comments_seq.NEXTVAL), 6, '0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'V000003',4,'�F���ܫܦh�A���ҵξA�A�H���A�Ȥ]�ˤ�? ���ޮa�x�E�|�A�B�ͤp�u�A���Q���\�ҩy �b�F�ϧA���䤤�@�ӿ��',CURRENT_TIMESTAMP ,1);
INSERT INTO COMMENTS VALUES ('C'||LPAD(to_char(comments_seq.NEXTVAL), 6, '0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'V000004',5,'�ӤH�D�`�R�q���Ʋz�A�ר�O���ġA�o�������ĬO���֪��A�@���j���N�O�@�H���A�i�H�I�n�X�ؤf���@�_���ɡA�n�Y�C',CURRENT_TIMESTAMP ,1);
INSERT INTO COMMENTS VALUES ('C'||LPAD(to_char(comments_seq.NEXTVAL), 6, '0'),to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ord_seq.CURRVAL), 6, '0'),'V000005',3,'�p�G�H�q���\�U�ӻ��A�ڻ{���o�ӻ��즳��n����ܡA���L�b���P�����̭��A�٬O���@�w�����ǡA���w���٦�life band�A�ӷ~���\okay',CURRENT_TIMESTAMP ,1);

--------------------------------------------------------------------------------------------------------
--���T
--��x���u
CREATE TABLE EMPLOYEE (
  EMP_NO VARCHAR2(10) NOT NULL 
, EMP_NAME VARCHAR2(20) NOT NULL 
, EMP_SEX VARCHAR2(1) NOT NULL 
, EMP_ACC VARCHAR2(15) NOT NULL  UNIQUE 
, EMP_PWD VARCHAR2(15) NOT NULL 
, EMP_HIRE DATE NOT NULL 
, EMP_RESIGN DATE 
, EMP_STAT NUMBER(2) NOT NULL 

, CONSTRAINT EMPLOYEE_EMP_NO_PK PRIMARY KEY (EMP_NO )
);

--SEQUENCE EMPLOYEE_SEQ
CREATE SEQUENCE EMPLOYEE_SEQ     
INCREMENT BY 1      
START WITH 1        
NOMAXVALUE      
NOCYCLE                        
NOCACHE;


INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPLOYEE_SEQ.nextval), 9, '0'),'�L�T��','M','Jimmy123','123',TO_DATE('2019-03-28','YYYY-MM-DD'),TO_DATE('2019-03-30','YYYY-MM-DD'),2);
INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPLOYEE_SEQ.nextval), 9, '0'),'��v��','M','Bob123','123',TO_DATE('2019-03-20','YYYY-MM-DD'),TO_DATE('2019-03-30','YYYY-MM-DD'),2);
INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPLOYEE_SEQ.nextval), 9, '0'),'�L���T','M','Chris123','123',TO_DATE('2016-03-15','YYYY-MM-DD'),TO_DATE('2019-01-30','YYYY-MM-DD'),2);
INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPLOYEE_SEQ.nextval), 9, '0'),'�d�ç�','M','Peter123','123',TO_DATE('2000-03-20','YYYY-MM-DD'),NULL,1);
INSERT INTO EMPLOYEE VALUES ('E'||LPAD(to_char(EMPLOYEE_SEQ.nextval), 9, '0'),'�d�a��','M','David123','123',TO_DATE('2008-03-20','YYYY-MM-DD'),NULL,1);

--------------------------------------------------------------------------------------------------------
--���T
--��x�\��
CREATE TABLE FEATURE (
  FEA_NO VARCHAR2(10) NOT NULL 
, FEA_NAME VARCHAR2(20) NOT NULL 
, FEA_DET VARCHAR2(150)
, CONSTRAINT FEATURE_FEA_NO_PK PRIMARY KEY (FEA_NO)
);

--SEQUENCE FEATURE_SEQ
CREATE SEQUENCE FEATURE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'���x�Τ�޲z',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'���x���u�B�z',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'���a�f�֧@�~',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�f�֤峹���|',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�f�ֵ������|',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�f�����|�\�U',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'���ڼf�֧@�~',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'���ڧ@�~',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�޲z���n�J',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�q��h��',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�d�߭q�����',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�h�q�@�~',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�̷s�������@',NULL);
INSERT INTO FEATURE VALUES ('F'||LPAD(to_char(FEATURE_SEQ.nextval), 3, '0'),'�^�к޲z',NULL);


--------------------------------------------------------------------------------------------------------
--���T
--���u�\�����
CREATE TABLE FEATURE_DETAIL (
  FEA_NO VARCHAR2(10) NOT NULL 
, EMP_NO VARCHAR2(10) NOT NULL 
, CONSTRAINT FEATURE_DETAIL_FEA_NO_FK   FOREIGN KEY (FEA_NO) REFERENCES FEATURE (FEA_NO)
, CONSTRAINT FEATURE_DETAIL_EMP_NO_FK   FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO)
, CONSTRAINT FEATURE_DETAIL_PRIMARY_KEY PRIMARY KEY (EMP_NO , FEA_NO )
);

INSERT INTO FEATURE_DETAIL VALUES ('F001','E000000005');
INSERT INTO FEATURE_DETAIL VALUES ('F002','E000000005');
INSERT INTO FEATURE_DETAIL VALUES ('F002','E000000002');
INSERT INTO FEATURE_DETAIL VALUES ('F005','E000000002');
INSERT INTO FEATURE_DETAIL VALUES ('F003','E000000001');


--------------------------------------------------------------------------------------------------------
--���T
--�̷s����
CREATE TABLE NEWS (
  NEWS_NO VARCHAR2(10) NOT NULL 
, EMP_NO VARCHAR2(10) NOT NULL 
, NEWS_CONT VARCHAR2(150) NOT NULL 
, NEWS_PIC BLOB 
, NEWS_REA DATE NOT NULL 
, CONSTRAINT NEWS_PRIMARY_KEY PRIMARY KEY (NEWS_NO)
, CONSTRAINT NEWS_EMP_NO_FK FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEE (EMP_NO)
);

CREATE SEQUENCE NEWS_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO NEWS VALUES ('N'||LPAD(to_char(NEWS_SEQ.nextval), 3, '0'),'E000000001','101���Ӥj���',NULL,TO_DATE('2019-03-28','YYYY-MM-DD'));
INSERT INTO NEWS VALUES ('N'||LPAD(to_char(NEWS_SEQ.nextval), 3, '0'),'E000000001','���e�������Y',NULL,TO_DATE('2018-03-28','YYYY-MM-DD'));
INSERT INTO NEWS VALUES ('N'||LPAD(to_char(NEWS_SEQ.nextval), 3, '0'),'E000000003','�Ҥ��ɩu',NULL,TO_DATE('2019-02-28','YYYY-MM-DD'));
INSERT INTO NEWS VALUES ('N'||LPAD(to_char(NEWS_SEQ.nextval), 3, '0'),'E000000003','�U�ѵ��A�Y',NULL,TO_DATE('2017-10-28','YYYY-MM-DD'));
INSERT INTO NEWS VALUES ('N'||LPAD(to_char(NEWS_SEQ.nextval), 3, '0'),'E000000005','�L�~�j�S��',NULL,TO_DATE('2019-03-08','YYYY-MM-DD'));

--------------------------------------------------------------------------------------------------------
--  �|�����]�������   �m��

CREATE TABLE MEMBER_WALLET_LIST  (                              
  LIST_NO           VARCHAR2(10 BYTE) NOT NULL
, MEM_NO            VARCHAR2(7 BYTE) 
, LIST_TIME         DATE
, LIST_WIT          VARCHAR2(10 BYTE) 
, LIST_STAT         NUMBER(1) 
, LIST_DEP          VARCHAR2(10 BYTE) 
, PAY_FOR           VARCHAR2(15 BYTE) 
--PK
, CONSTRAINT MEMBER_WALLET_LIST_LIST_NO_PK PRIMARY KEY (LIST_NO)
--FK
, CONSTRAINT MEMBER_WALLET_LIST_MEM_NO_FK FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO)

);

CREATE SEQUENCE MEMBER_WALLET_LIST_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                 -- �C���W�[�ƶq
START WITH 1                   -- �q1�}�l
NOMAXVALUE                     -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

INSERT INTO MEMBER_WALLET_LIST VALUES ('MWL'||LPAD(to_char(MEMBER_WALLET_LIST_SEQ.NEXTVAL), 7, '0')
    ,'M000001',sysdate,'5566',1,null,'20190330-000001');
INSERT INTO MEMBER_WALLET_LIST VALUES ('MWL'||LPAD(to_char(MEMBER_WALLET_LIST_SEQ.NEXTVAL), 7, '0')
    ,'M000001',sysdate,'3000',2,null,'20190330-000002');
INSERT INTO MEMBER_WALLET_LIST VALUES ('MWL'||LPAD(to_char(MEMBER_WALLET_LIST_SEQ.NEXTVAL), 7, '0')
    ,'M000001',sysdate,null,3,'600',null);
INSERT INTO MEMBER_WALLET_LIST VALUES ('MWL'||LPAD(to_char(MEMBER_WALLET_LIST_SEQ.NEXTVAL), 7, '0')
    ,'M000001',sysdate,'50000',1,null,'20190330-000004');
INSERT INTO MEMBER_WALLET_LIST VALUES ('MWL'||LPAD(to_char(MEMBER_WALLET_LIST_SEQ.NEXTVAL), 7, '0')
    ,'M000001',sysdate,null,3,'9527',null);


--------------------------------------------------------------------------------------------------------

-- 13 �������|�M��   �m��
CREATE TABLE COMMENT_REPORTED  (                                
  REP_NO            VARCHAR2(10 BYTE) NOT NULL
, CMNT_NO           VARCHAR2(7 BYTE) 
, MEM_NO            VARCHAR2(7 BYTE) 
, REP_FOR           VARCHAR2(500 BYTE) 
, REP_TIME          DATE 
, REP_STAT          NUMBER(1) NOT NULL

--PK
, CONSTRAINT COMMENT_REPORTED_REP_NO_PK PRIMARY KEY (REP_NO)
--Fk
, CONSTRAINT COMMENT_REPORTED_CMNT_NO_FK FOREIGN KEY (CMNT_NO) REFERENCES COMMENTS (CMNT_NO)
, CONSTRAINT COMMENT_REPORTED_MEM_NO_FK FOREIGN KEY (MEM_NO) REFERENCES MEMBER (MEM_NO)

);
--SEQUENCE 
CREATE SEQUENCE COMMENT_REPORTED_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1                 -- �C���W�[�ƶq
START WITH 1                   -- �q1�}�l
NOMAXVALUE                     -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

INSERT INTO COMMENT_REPORTED VALUES ('CR'||LPAD(to_char(COMMENT_REPORTED_SEQ.NEXTVAL), 8, '0')
    ,'C000001','M000001','���a�H�U���s�i�١H�o���κޤ@�U��',CURRENT_TIMESTAMP,1);

INSERT INTO COMMENT_REPORTED VALUES ('CR'||LPAD(to_char(COMMENT_REPORTED_SEQ.NEXTVAL), 8, '0')
    ,'C000002','M000002','�o�ڥ��O��L���c�N�Ӿx���a�H�̦n�ڭ̪������ѨS�����׳�I�ӥB�ٰ��껡�Y���������A�ک����������ڡH�޲z���X�ӭ���',CURRENT_TIMESTAMP,3);

INSERT INTO COMMENT_REPORTED VALUES ('CR'||LPAD(to_char(COMMENT_REPORTED_SEQ.NEXTVAL), 8, '0')
    ,'C000003','M000002','���O10���]��@�g�H�o���a���Ӫ��uŪ�ͧa�A�ڧڥh�Y���S���e�s���B�e�j���A�W����',CURRENT_TIMESTAMP,1);

INSERT INTO COMMENT_REPORTED VALUES ('CR'||LPAD(to_char(COMMENT_REPORTED_SEQ.NEXTVAL), 8, '0')
    ,'C000004','M000002','�o�g�O�Ӷê��a?������|�K�O�a�����F��H�����\�U����pŢ�]��?',CURRENT_TIMESTAMP,2);

INSERT INTO COMMENT_REPORTED VALUES ('CR'||LPAD(to_char(COMMENT_REPORTED_SEQ.NEXTVAL), 8, '0')
    ,'C000005','M000003','�g�o�g���f�l�����[�ڦn�͡A�����|�@�i',CURRENT_TIMESTAMP,1);


--------------------------------------------------------------------------------------------------------
--�峹  �t��

CREATE TABLE ARTICLE_PUBLISHED(
    ART_NO      VARCHAR2(10)    NOT NULL
,   MEM_NO      VARCHAR2(7)     NOT NULL
,   ART_TITLE   VARCHAR2(30)    NOT NULL
,   ART_CONTENT VARCHAR2(1500)  NOT NULL
,   ART_TIME    DATE            NOT NULL
,   ART_PIC1    BLOB
,   ART_PIC2    BLOB
,   ART_PIC3    BLOB
,   ART_PIC4    BLOB
,   ART_PIC5    BLOB
,   ART_CODE    NUMBER(1,0)     NOT NULL
,   CONSTRAINT  ART_PUB_NO_PK   PRIMARY KEY(ART_NO)
,   CONSTRAINT  ART_PUB_MEM_FK  FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
);
CREATE SEQUENCE ARTPUB_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO ARTICLE_PUBLISHED VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),'M000001','���������������','   �ӥͲr���A�Y������!�o�a�����A�M�橱,�ϥηs�A����,�h�z�d�B�h�ߪ��������,�����~�ֶp��,�x�F�ܹ��жp�������ƶW������!!!
        �ĤJ�F�s�A�j�z���M���������C�s���ߥ�,���Ǭ����ٳo�򹡺��j��!�ӥB�r�@�f�̭���������!!!',TO_DATE('2016-10-28','YYYY-MM-DD'),null,null,null,null,null,1);

INSERT INTO ARTICLE_PUBLISHED VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),'M000003','���_�������Y',' ���ѨӨ�P�ݶ}���ǻ������p�Y���S�O�Ӥ@�|�ǻ������������Y,�������Y���g�L���j�C�����E�ʤU���V��,�̭��R��������������,�r�U�h�Q�X�F���H���h�����ġC
        �C�Y�L�@��,�ڴN�󦳰ʤO�gCODE�A�H��Y���D�ӫ����!!!!',TO_DATE('2018-10-28','YYYY-MM-DD'),null,null,null,null,null,1);

INSERT INTO ARTICLE_PUBLISHED VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),'M000005','�S�s���Ȫe��',' ť���p��a��W�S�żp�v�H��,�ڴN�S�a�򤽥q�@���ǻ������Ȫe��,�ѱ��ĤJ�L�骺����,�R���F���v�����D�C
        �W���x���F�öQ���ï]��,�ߤW�ӦY�u���i�H�ݨ�R���P�P���P�e',TO_DATE('2017-01-11','YYYY-MM-DD'),null,null,null,null,null,1);
INSERT INTO ARTICLE_PUBLISHED VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),'M000002','���Q�Q���@����','    ��餤���j�Ǿǰϩ�,�@120�W,�`��500�U,�n�R�n��,���L�i����!!!',TO_DATE('2018-03-15','YYYY-MM-DD'),null,null,null,null,null,1);
INSERT INTO ARTICLE_PUBLISHED VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),'M000004','�}���P�沱�b','     �C�ӤH���R�Y��,�ӳo�̤@�|�����P��M�\,�}�G��O�@�M�S�շL�H�������s,���ۦU�ؤf�����P��,���d�h�F��͡B����B�N�O�M��X���G�s�C,�̫��٦���u�R�ɦB,���ѦY�o�n����',TO_DATE('2019-02-17','YYYY-MM-DD'),null,null,null,null,null,1);

--------------------------------------------------------------------------------------------------------
--�峹���|�M��  �t��

CREATE TABLE ARTICLE_REPORTED(
    ARTRE_NO        VARCHAR2(10)    NOT NULL
,   ART_NO          VARCHAR2(10)    NOT NULL
,   MEM_NO          VARCHAR2(7)     NOT NULL
,   ARTRE_CONTENT   VARCHAR2(300)   NOT NULL
,   ARTRE_TIME      DATE            NOT NULL
,   ARTRE_CODE      NUMBER(1)       NOT NULL
--PK
,   CONSTRAINT  ART_RE_ARTRE_NO_PK    PRIMARY KEY(ARTRE_NO)
--FK
,   CONSTRAINT  ART_RE_MEM_NO_FK   FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
,   CONSTRAINT  ART_RE_ART_NO_FK   FOREIGN KEY(ART_NO) REFERENCES ARTICLE_PUBLISHED(ART_NO)
);

CREATE SEQUENCE ARTRE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO ARTICLE_REPORTED VALUES('AR'||LPAD(to_char(ARTRE_SEQ.NEXTVAL),8,'0'),'AP00000001','M000006','�̭����M�t����мs�i',TO_DATE('2017-01-11','YYYY-MM-DD'),1);
INSERT INTO ARTICLE_REPORTED VALUES('AR'||LPAD(to_char(ARTRE_SEQ.NEXTVAL),8,'0'),'AP00000002','M000002','���o�رi�F,�̭������ï]��,�����u�O���q���}��',TO_DATE('2017-02-15','YYYY-MM-DD'),2);
INSERT INTO ARTICLE_REPORTED VALUES('AR'||LPAD(to_char(ARTRE_SEQ.NEXTVAL),8,'0'),'AP00000003','M000005','�ڬO�өt�檺�H,�Q��ڦY���H���w��',TO_DATE('2017-01-11','YYYY-MM-DD'),3);
INSERT INTO ARTICLE_REPORTED VALUES('AR'||LPAD(to_char(ARTRE_SEQ.NEXTVAL),8,'0'),'AP00000004','M000001','�u�W����ʤ���,�֨Ӱѥ[,�Y���@�d�U���ۧA��!!!',TO_DATE('2017-02-15','YYYY-MM-DD'),3);
INSERT INTO ARTICLE_REPORTED VALUES('AR'||LPAD(to_char(ARTRE_SEQ.NEXTVAL),8,'0'),'AP00000005','M000002','���o�رi�F,�̭������ï]��,�����u�O���q���}��',TO_DATE('2017-02-15','YYYY-MM-DD'),2);

--------------------------------------------------------------------------------------------------------
--��Ѭ���  �t��
CREATE TABLE CHAT_RECORD(
    CHAT_NO     VARCHAR2(10)    NOT NULL
,   MEM_NO      VARCHAR2(7)     NOT NULL
,   FRIE_NO     VARCHAR2(7)     NOT NULL
,   WORDS       VARCHAR2(500)
,   CHAT_TIME   TIMESTAMP       NOT NULL
,   CONSTRAINT  CH_RE_NO_PK PRIMARY KEY(CHAT_NO)
,   CONSTRAINT  CH_RE_MEMNO_FK  FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
,   CONSTRAINT  CH_RE_FRIENO_FK FOREIGN KEY(FRIE_NO) REFERENCES MEMBER(MEM_NO)
);

CREATE SEQUENCE CH_RE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000001','M000002','�w�w',CURRENT_TIMESTAMP);

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000002','M000001','���o',CURRENT_TIMESTAMP);

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000001','M000002','�P��񰲷Q��H�Y��,�p�n�Ӷ�?',CURRENT_TIMESTAMP);

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000002','M000001','�n�ڭn�h����',CURRENT_TIMESTAMP);

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000001','M000002','�Aı�o���p�X���p��?',CURRENT_TIMESTAMP);

INSERT INTO CHAT_RECORD VALUES('CH'||LPAD(to_char(CH_RE_SEQ.NEXTVAL),8,'0'),'M000002','M000001','�����A�����ڦҼ{�ݬ�',CURRENT_TIMESTAMP);

--------------------------------------------------------------------------------------------------------
--�ȪA�O��   �t��
--�ȪA�O��   �t��
CREATE TABLE CUSTOMER_SERVICE_RECORD(
    CUST_SER_NO     VARCHAR2(10)    NOT NULL
,   MEM_NO          VARCHAR2(7)     NOT NULL
,   EMP_NO          VARCHAR2(10)    NOT NULL 
,   QUESTION        VARCHAR2(500)
,   ANSWER          VARCHAR2(500)
,   CUST_SER_TIME   TIMESTAMP   NOT NULL
,   CONSTRAINT  CU_RE_NO_PK PRIMARY KEY(CUST_SER_NO)
,   CONSTRAINT  CU_RE_MEMNO_FK  FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
,   CONSTRAINT  CU_RE_EMPNO_FK  FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO)
);

CREATE SEQUENCE CU_SE_RE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000001','E000000001','�z�n',NULL,CURRENT_TIMESTAMP);

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000002','E000000002',NULL,'�z�n,�ܺa�����z�A��',CURRENT_TIMESTAMP);

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000003','E000000003','�ڦ��h�q�����D�n�ббz',NULL,CURRENT_TIMESTAMP);

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000004','E000000004',NULL,'�����A�·бz�ԭz�z�����D?',CURRENT_TIMESTAMP);

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000005','E000000005','�ڥi�H�h�q�W�P�@���@���q���?',NULL,CURRENT_TIMESTAMP);

INSERT INTO CUSTOMER_SERVICE_RECORD VALUES('CU'||LPAD(to_char(CU_SE_RE_SEQ.NEXTVAL),8,'0'),'M000001','E000000001',NULL,'�ھڥ��O�W�w�X�Ѥ����i�H�i��h�w�q��',CURRENT_TIMESTAMP);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�n�ͲM�� �t��
CREATE TABLE FRIEND_LIST(
    MEM_NO      VARCHAR2(7) NOT NULL
,   FRIE_NO     VARCHAR2(7) NOT NULL
,   FRIE_CODE   NUMBER(1,0) NOT NULL
,   CONSTRAINT  FRLI_MEMFR_PK   PRIMARY KEY(MEM_NO,FRIE_NO)
,   CONSTRAINT  FRLI_MEMNO_FK   FOREIGN KEY(MEM_NO) REFERENCES MEMBER(MEM_NO)
,   CONSTRAINT  FRLI_FRIENO_FK  FOREIGN KEY(FRIE_NO) REFERENCES MEMBER(MEM_NO)
);
INSERT INTO FRIEND_LIST VALUES('M000001','M000002',1);
INSERT INTO FRIEND_LIST VALUES('M000002','M000001',2);
INSERT INTO FRIEND_LIST VALUES('M000003','M000005',5);
INSERT INTO FRIEND_LIST VALUES('M000005','M000003',6);
INSERT INTO FRIEND_LIST VALUES('M000004','M000006',7);
INSERT INTO FRIEND_LIST VALUES('M000006','M000004',7);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�\�U�^���M��  --�m��
CREATE TABLE RESTAURANT_RESPONSES  ( 								
  RES_NO			VARCHAR2(10 BYTE) NOT NULL
, CMNT_NO			VARCHAR2(7 BYTE) NOT NULL 
, RES_TEXT			VARCHAR2(500 BYTE) NOT NULL 
, RES_TIME 			DATE 

, CONSTRAINT RESTAURANT_RESPONSES_RES_NO PRIMARY KEY (RES_NO)
, CONSTRAINT RESTAURANT_RESPONSES_CMNT_NO	FOREIGN KEY (CMNT_NO) REFERENCES COMMENTS (CMNT_NO)

);
--SEQUENCE 
CREATE SEQUENCE RESTAURANT_RESPONSES_SEQ     -- �@�Ӫ��u�|���@�Ӭy����,�ҥH�R�W�W��table_SEQ
INCREMENT BY 1				   -- �C���W�[�ƶq
START WITH 1				   -- �q1�}�l
NOMAXVALUE					   -- �S���̤j��
NOCYCLE                        -- ���`��
NOCACHE;                       -- ���֨�,�����

INSERT INTO RESTAURANT_RESPONSES VALUES ('RR'||LPAD(to_char(RESTAURANT_RESPONSES_SEQ.NEXTVAL), 8, '0')
	,'C000001','�P�¥��{�A�Ʊ�z�A�׻Y�{�������\�I',CURRENT_TIMESTAMP);

INSERT INTO RESTAURANT_RESPONSES VALUES ('RR'||LPAD(to_char(RESTAURANT_RESPONSES_SEQ.NEXTVAL), 8, '0')
	,'C000002','���±z���n���A�ܰ����z����w�ڭ̪��A�ȻP�\�I�@! ������~~',CURRENT_TIMESTAMP);


INSERT INTO RESTAURANT_RESPONSES VALUES ('RR'||LPAD(to_char(RESTAURANT_RESPONSES_SEQ.NEXTVAL), 8, '0')
	,'C000003','�P�±z�����лP����A�����@�����ӴN�O�ë��۵��ȤH�̦n�]�̦w�ߪ��\�I�A�õ��U�컫�ܦp�k�S�ŷx���A��',
	CURRENT_TIMESTAMP);

INSERT INTO RESTAURANT_RESPONSES VALUES ('RR'||LPAD(to_char(RESTAURANT_RESPONSES_SEQ.NEXTVAL), 8, '0')
	,'C000004','���~�D�p�ǳƲ��h�s��γ��ŭ����A�N�O���F���z���Ѫ��]�ߡA�~�|�����÷f�t�M���s�A�֨ӻP�ڭ̦@�צ�v���H�`�a',
	CURRENT_TIMESTAMP);

INSERT INTO RESTAURANT_RESPONSES VALUES ('RR'||LPAD(to_char(RESTAURANT_RESPONSES_SEQ.NEXTVAL), 8, '0')
	,'C000005','�Ҧ����A���A���D���A�����N�O�����F�A�Ӧb�饻�����h�O�Q�j�q�ϥΪ��������@�A�䤤�S�H�c����?�W�����̬��ά��M�ܡA
	�O��Ź���D�`�߷R������',
	CURRENT_TIMESTAMP);




COMMIT;