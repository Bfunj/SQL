create table `TblUser`
(
`userid` varchar(10),
`userName` varchar(10),
`userHp` char(13),
`userAge` tinyint,
`userAddr` varchar(20)
);

drop table `tbluser`;
drop table `tblproduct`;


insert into `TblUser` (`userid`,`userName`,`userHp`,`userAge`,`userAddr`) values ('p101','김유신','010-1234-1001',25,'서울시 중구');
insert into `TblUser` (`userid`,`userName`,`userHp`,`userAge`,`userAddr`) values ('p102','김춘추','010-1234-1002',23,'부산시 금정구');
insert into `TblUser` (`userid`,`userName`,`userAge`,`userAddr`) values ('p103','장보고',31,'경기도 광주군');
insert into `TblUser` (`userid`,`userName`,`userAddr`) values ('p104','강감찬','경남 창원시');
insert into `TblUser` (`userid`,`userName`,`userHp`,`userAge`) values ('p105','이순신','010-1234-1005',50);

create table `tblproduct`
(
`prdCode` int,
`prdName`varchar(10),
`prdPrics`int ,
`prdAmount` int,
`prdCompany` varchar(10),
`prdMakeDate` date
);
insert into `tblproduct` values ('1','냉장고',800,10,'LG','2022-01-06');
insert into `tblproduct` values ('2','노트북',1200,20,'삼성','2022-01-06');
insert into `tblproduct` values ('3','TV',1400,6,'LG','2022-01-06');
insert into `tblproduct` values ('4','세탁기',1000,8,'LG','2022-01-06');
insert into `tblproduct` (`prdCode`,`prdName`,`prdPrics`,`prdAmount`) values ('5','컴퓨터',1100,0);
insert into `tblproduct` values ('6','휴대폰',900,102,'삼성','2022-01-06');


select * from `tbluser`;
select `userName` from `tbluser`;
select `username` ,`userhp` from `tbluser`;
select *from `tbluser` where `userid`='p102';
select *from `tbluser` where `userid`='p104' or `userid`='p105';
select *from `tbluser` where `useraddr`='신라';
select * from `tbluser` where `userage` > 30;
select * from `tbluser` where `userhp` is null;
update `tbluser` set `userage` =42 where `userid`= 'p104';
update `tbluser` set `useraddr` = '경남 김해시' where `userid` = 'p105';
delete from `tbluser` where `userid` = 'p103';

select *from `tblproduct`;
select `prdname` from `tblproduct`;
select `prdname` , `prdprics` from `tblproduct`;
select *from `tblproduct` where `prdCompany`='LG';
select *from `tblproduct` where `prdCompany`='삼성';
update `tblproduct` set
`prdCompany` = '삼성',
`prdmakedate` = '2021-01-01'
where `prdcode`=5;