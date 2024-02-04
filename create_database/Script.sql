SELECT * FROM tbl_category ;
SELECT * FROM tbl_MEMBER;
SELECT * FROM tbl_discount;
SELECT * FROM tbl_product;
SELECT * FROM tbl_order ;

INSERT INTO tbl_category 
VALUES
	('C001', 'TV'),
	('C002', '냉장고'),
	('C003', 'PC');
	

INSERT INTO tbl_member
VALUES
	('U001', '김기유', '관악구'),
	('U002', '백종환', '구로구'),
	('U003', '정민식', '구로구');

INSERT INTO tbl_discount 
VALUES
	('P001', 30,null ),
	('P002', 30,null ),
	('P003', 30,null ),
	('P004', 20,null ),
	('P005', 20,null ),
	('P006', 20,null ),
	('P007', 10,null ),
	('P008', 10,null ),
	('P009', 10,null );


INSERT INTO tbl_product 
VALUES
	('P001', "LG올레드", 2000000, 'C001'),
	('P002', "LG벽걸이", 3000000, 'C001'),
	('P003', "LG티비", 1000000, 'C001'),
	('P004', "LG냉장고", 1000000, 'C002'),
	('P005', "LG김치냉장고", 1500000, 'C002'),
	('P006', "LG정수기냉장고", 2000000, 'C002'),
	('P007', "LG그램", 1500000, 'C003'),
	('P008', "LG노트북", 1000000, 'C003'),
	('P009', "LG데스크탑", 500000, 'C003');

INSERT INTO tbl_order 
VALUES
	('O001', 'P002', 'U003'),
	('O002', 'P004', 'U001'),
	('O003', 'P007', 'U002');
