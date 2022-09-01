#2022.09.01
#연습문제3


#3-1
create database `College`;
create user 'java1_admin3'@'%' identified by '1234';
grant all privileges on `java1_College`.* to 'java1_admin3'@'%';
flush privileges;


#실습 3-2
create table `Student`(
	`stdNo` varchar(8)  primary key not null,
	`stdName` varchar(20) not null,
	`stdHp` varchar(20) not null unique,
	`stdYear` int  not null,
	`stdAddress` varchar(100) default null
);


create table `Lecture`(
	`lecNo` int not null primary key,
    `lecName` varchar(20) not null,
    `lecCredit` int not null,
    `lecTime` int not null,
    `lecClass` varchar(10) default null

);

create table `Register`(
	`regStdNo` varchar(8) not null,
    `regLecNo` int not null,
    `regMidScore` int default null,
    `regFinalScore` int default null,
    `regTotalScore` int default null,
    `regGrade` varchar(1) default null

);


#실습 3-3
insert into `student` (`stdNo`,`stdName`,`stdHp`,`stdYear`)values (20201016,'김유신','010-1234-1001',3);
insert into `student` values (20201126,'김춘추','010-1234-1002',3,'경상남도 경주시');
insert into `student` values (20210216,'장보고','010-1234-1003',2,'전라남도 완도시');
insert into `student` values (20210326,'강감찬','010-1234-1004',2,'서울시 영등포구');
insert into `student` values (20220416,'이순신','010-1234-1005',1,'부산시 부산진구');
insert into `student` values (20220521,'송상현','010-1234-1006',1,'부산시 동래구');

insert into `Lecture` values (159,'인지행동심리학',3,40,'본304');
insert into `Lecture` values (167,'운영체제론',3,25,'본805');
insert into `Lecture` values (234,'중급 영문법',3,20,'본201');
insert into `Lecture` values (239,'세법개론',3,40,'본204');
insert into `Lecture` values (248,'빅데이터 개론',3,20,'본801');
insert into `Lecture` values (253,'컴퓨팅사고와 코딩',2,10,'본802');
insert into `Lecture` values (349,'사회복지 마케팅',2,50,'본301');

insert into `Register` (`regStdNo`,`regLecNo`)values ('20201126',234);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20201016',248);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20201016',253);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20201126',239);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20210216',349);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20210326',349);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20201016',167);
insert into `Register` (`regStdNo`,`regLecNo`)values ('20220416',349);
#실습 3-4
select * from `lecture`;
#실습 3-5
select * from `student`;
#실습 3-6
select *from `register`;
#실습 3-7
select *from `student` where `stdYear` = 3;
#실습 3-8
select *from `lecture` where `lecCredit`=2;
#실습 3-9
update `register` set `regMidscore` =36, `regfinalscore` = 42 where `regstdno`='20201126' and `reglecno`=234;
update `register` set `regMidscore` =24, `regfinalscore` = 62 where `regstdno`='20201016' and `reglecno`=248;
update `register` set `regMidscore` =28, `regfinalscore` = 40 where `regstdno`='20201016' and `reglecno`=253;
update `register` set `regMidscore` =37, `regfinalscore` = 57 where `regstdno`='20201126' and `reglecno`=239;
update `register` set `regMidscore` =28, `regfinalscore` = 68 where `regstdno`='20210216' and `reglecno`=349;
update `register` set `regMidscore` =16, `regfinalscore` = 65 where `regstdno`='20210326' and `reglecno`=349;
update `register` set `regMidscore` =18, `regfinalscore` = 38 where `regstdno`='20201016' and `reglecno`=167;
update `register` set `regMidscore` =25, `regfinalscore` = 58 where `regstdno`='20220416' and `reglecno`=349;
#실습 3-10
update `register` set
`regTotalScore` = `regMidScore` + `regFinalScore`,
`regGrade` = if(`regtotalscore` >=90, 'A',
				if(`regtotalscore` >=80, 'B',
                if(`regtotalscore` >=70, 'C',
                if(`regtotalscore` >=60, 'D', 'F'))));
select *from `register`;
#실습 3-11

select * from `register` order by `regTotalScore` desc;

#실습 3-12
select *from `register` where `regLecNo`=349 order by `regTotalScore` desc ;
#실습 3-13
select * from `lecture` where `lectime` >=40;
#실습 3-14
select `lecName`,`lecclass` from `lecture` ;
#실습 3-15
select `stdno`,`stdname` from `student`;
#실습 3-16
select * from `student` where `stdAddress` is null;
#실습 3-17
select *from `student` where `stdAddress` like '부산시%';
#실습 3-18
select * from `student` as a
left join `register` as b 
on a.`stdno` = b.`regstdno`;
#실습 3-19
select a.stdNo,a.stdName,b.regLecNo,b.regMidScore,b.regFinalScore,b.regTotalScore,b.regGrade from `student`as a
join `register` as b
on a.`stdno`= b.`regstdno`;
#실습 3-20
select a.stdname, a.stdno, b.regLecNo from `student` as a
join `register` as b
on a.`stdno`= b.`regstdno`
where b.regLecNo =349
;

#실습 3-21
select 
`stdno`,
`stdname`,
count(stdno) as '수강신청 건수',
sum(regTotalScore) as '종합건수',
sum(regTotalScore) / count(stdno) as '평균'
from `student` as a
join `register` as b
on a.stdNo = b.regStdNo
group by a.stdname 
order by `수강신청 건수` desc;

#실습 3-22
select *from `register` as a
join `lecture` as b
on  a.regLecNo=b.lecNo  ;
#실습 3-23
select 
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `register` as a
join `lecture` as b
on  a.regLecNo=b.lecNo  ;

#실습 3-24
select 
count(*) as '사회복지 마케팅 수강 신청건수',
avg(regTotalScore) as '사회복지 마케팅 평균'
from `register` as a
join `lecture` as b
on  a.regLecNo=b.lecNo 
where b.lecName='사회복지 마케팅' ;

#실습 3-25
select a.regStdNo ,b.lecName  from `register` as a
join `lecture` as b
on a.regLecNo= b.lecNo
where `reggrade` ='A' ;
#실습 3-26
select * from `student` as a
join `register` as b
on a.stdNo= b.regStdNo
join `lecture` as c
on b.regLecNo=c.lecNo
;


#실습 3-27
select 
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `student` as a
join `register` as b
on a.stdNo= b.regStdNo
join `lecture` as c
on b.regLecNo=c.lecNo
;


#실습 3-28
select 
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
from `student` as a
join `register` as b
on a.stdNo= b.regStdNo
join `lecture` as c
on b.regLecNo=c.lecNo
where `regGrade` ='F'
;

#실습 3-29
select 
`stdNo`,
`stdName`,
sum(lecCredit) as '이수학점'
from `student` as a
join `register` as b
on a.stdNo= b.regStdNo
join `lecture` as c
on b.regLecNo=c.lecNo
where `regtotalscore` >=60
group by `stdname`
order by `stdno` asc
;

#실습 3-30

select 
`stdNo`,
`stdName`,
	group_concat(`lecname`) as '신청과목' ,
	group_concat(if(`regtotalscore` >=60, `lecname`, null)) as '이수과목'
from `student` as a
join `register` as b
on a.stdNo= b.regStdNo
join `lecture` as c
on b.regLecNo=c.lecNo
group by `stdname`
order by `stdno` asc
;