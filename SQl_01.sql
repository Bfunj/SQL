#날짜 : 2022/08/22
#이름 : 백현조
#내용 : SQL 기초

#실습 1-1 databe 생성 및 제거
CREATE DATABASE `UserDB`;
DROP DATABASE `userdb`;
# ctrl + enter 해당라인 실행 단축키

#실습 1-2 table 생성
CREATE TABLE `User1` (
	`uid` 	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
	`age`	INT
);

DROP TABLE `User1`;

#실습 1-3 테이블에 데이터 추가
INSERT INTO `User1` VALUES ("A101","김유신","010-1234-1111",25);
INSERT INTO `User1` VALUES ("A102","김춘추","010-1222-1234",23);
INSERT INTO `User1` VALUES ("A103","장보고","010-5555-1233",32);
INSERT INTO `User1` (`uid`,`name`,`age`) VALUES ("A104","강감찬",45);
INSERT INTO `User1` SET
				`uid`='A105',
                `name`='이순신',
                `hp`='010-0000-0000';
                
#실습 1-4 테이블에 데이터 조회
SELECT * FROM `User1`;

SELECT * FROM `User1` WHERE `uid` = 'A101';
SELECT `uid`,`name`,`age` FROM `User1`;
SELECT * FROM `User1` WHERE `name` ='김무신';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;

#실습 1-5 테이블에 데이터 수정
UPDATE `User1` SET `hp`='010-8888-7777' WHERE `uid`='A105';
UPDATE `User1` SET `age`=29 WHERE `uid`='A101';
UPDATE `User1` SET `hp`='010-7777-7777', `age`=77 WHERE `uid`='A102';

#실습 1-6 테이블에 데이터 삭제
delete from `User1` where `uid`='A101';
delete from `User1` where `uid `='A102' and `age`=76;
delete from `User1` where `age`>=30;


#실습 1-7
#실습 1-8
#실습 1-9
