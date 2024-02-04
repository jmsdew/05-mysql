CREATE USER 'kbj'@'%' IDENTIFIED BY 'kbj'; /*유저 목록을 만듦 - @는 접근할 수  있는 아이피 범위 설정 . % - 모든 아이피 접근 가능 .  이름을 정하고 identified 로 비밀번호 설정*/  -- 주석 # 주석 /**/ 주석

SHOW DATABASES;

USE mysql; 

SHOW TABLES;

SELECT * FROM USER;

CREATE DATABASE kbjdb;

SHOW DATABASES;

GRANT ALL PRIVILEGES ON kbjdb.* TO 'kbj'@'%';
/*모든 권한부여*/

SHOW GRANTS FOR 'kbj'@'%';
     # grant - 승인하다
     
USE kbjdb;   # 사용하겠다 

SHOW TABLES;
