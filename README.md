# SQL

## 제1장 SQL 기초
1. 데이터베이스 생성 및 제거
	생성.- CREATE DATABASE 데이터베이스명;
	제거.- DROP DATABASE 데이터베이스명;
2. 테이블 생성 및 제거
	생성.- CREATE TABLE 테이블명(칼럼명1 자료형1, 칼럼명2 자료형2,...);
	제거.- DROP TABLE 테이블명;
		 DROP TABLE IF EXISTS 테이블명;
3. 테이블에 데이터 추가
	데이터 추가.-INSERT INTO 테이블명 VALUES (데이터1, 데이터2,..);
	칼럼명 지정후 데이터 추가.- INSERT INTO 테이블명(칼럼명1, 칼럼명2,..) VALUES (데이터1, 데이터2,..);
					.- INSERT INTO 테이블명 SET 칼렁명1=데이터1, 칼럼명2=데이터2, ..;
4. 테이블에 데이터 조회
	데이터 조회.- SELECT 칼럼명1, 칼럼명2 .. FROM 테이블명;
			  SELECT 칼럼명1, 칼럼명2 .. FROM 테이블명 WHERE 조건;
	모든 데이터 조회.- SELECT * FROM 테이블명;
				 SELECT * FROM 데이터베이스명, 테이블명;
5. 테이블에 데이터 수정
	데이터 수정.- UPDATE 테이블명 SET 칼렁명1=데이터1, 칼럼명2=데이터2..;
	조건 일치 데이터 수정.- UPDATE 테이블명 SET 칼럼명1=데이터1, 칼럼명2=데이터2 ... WHERE 조건;
6. 테이블에 데이터 삭제
	데이터 삭제.- DELETE FROM 테이블명 WHERE 조건;