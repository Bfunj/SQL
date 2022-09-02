#실습 4-2
create table `Customer`(
		`cusId` int primary key auto_increment not null,
		`name` varchar(10) not null,
		`address` varchar(20) default null,
		`phone` varchar(13) default null
);

create table `Book`(
		`bookId` int primary key not null,
		`bookName` varchar(20) not null,
		`publisher` varchar(20) not null,
		`price` int default null
);
drop table `book`;

create table `Order`(
		`orderId` int primary key not null auto_increment,
        `custId` int not null,
        `bookId` int not null,
        `salePrice` int not null,
        `orderDate` date not null
);
drop table `order`;


#실습 4-3
insert into `Customer` (`name`,`address`,`phone`) values("박지성","영국 맨체스타","000-5000-0001");
insert into `Customer` (`name`,`address`,`phone`) values("김연아","대한민국 서울","000-6000-0001");
insert into `Customer` (`name`,`address`,`phone`) values("장미란","대한민국 강원도","000-7000-0001");
insert into `Customer` (`name`,`address`,`phone`) values("추신수","미국 클리블랜드","000-8000-0001");
insert into `Customer` (`name`,`address`) values("박세리","대한민국 대전");

insert into `book` values (1,"축구의 역사","굿스포츠",7000);
insert into `book` values (2,"축구아는 여자","나무수",13000);
insert into `book` values (3,"축구의 이해","대한미디어",22000);
insert into `book` values (4,"골프 바이블","대한미디어",35000);
insert into `book` values (5,"피겨 교본","굿스포츠",8000);
insert into `book` values (6,"역도 단계별기술","굿스포츠",6000);
insert into `book` values (7,"야구의 추억","이상미디어",20000);
insert into `book` values (8,"야구를 부탁해","이상미디어",13000);
insert into `book` values (9,"올림픽 이야기","삼성당",7500);
insert into `book` values (10,"Olympic Champions","pearson",13000);

insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (1,1,6000,"2014-07-01");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (1,3,21000,"2014-07-03");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (2,5,8000,"2014-07-03");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (3,6,6000,"2014-07-04");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (4,7,20000,"2014-07-05");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (1,2,12000,"2014-07-07");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (4,8,13000,"2014-07-07");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (3,10,12000,"2014-07-08");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (2,10,7000,"2014-07-09");
insert into `order` (`custid`,`bookid`,`saleprice`,`orderdate`) values (3,8,13000,"2014-07-10");
#실습 4-4

select `cusid`, `name` , `address` from `customer`;
#실습 4-5

select *from `book`;
select `bookname`, `price` from `book`;
#실습 4-6
select  `price`,`bookname` from `book`;
#실습 4-7
select *from `book`;
#실습 4-8
select `publisher` from `book`;
#실습 4-9
select `publisher` from `book`
group by `publisher`;

#실습 4-10
select *from `book`
where `price` >=20000;
#실습 4-11
select *from `book`
where `price` < 20000;
#실습 4-12
select *from `book`
where `price` <= 20000 and `price` >=10000;
#실습 4-13
select `bookid`,`bookname`,`price`from `book`
where `price` <= 30000 and `price` >=15000;
#실습 4-14
select *from `book`
where `bookid` = 2 or `bookid` =3 or `bookid` =5;

select *from `book`
where `bookid` in(2,3,5);

#실습 4-15
select *from `book`
where mod(`bookid`,2) = 0;
#실습 4-16
select *from `customer`
where `name` like '박%';
#실습 4-17
select *from `customer`
where `address` like '대한민국%';
#실습 4-18
select *from `customer`
where `phone` is not null; 
#실습 4-19
select *from `book`
where `publisher` = '굿스포츠' or `publisher` = '대한미디어' ;

#실습 4-20
select `publisher`from `book`
where `bookname` = '축구의 역사';
#실습 4-21
select `publisher`from `book`
where `bookName` like '축구%';
#실습 4-22
select *from `book`
where `bookname` like '_구%';


#실습 4-23
select *from `book`
where `price` >=20000 and `bookname` like '축구%';
#실습 4-24
select *from `book`
order by `bookname` asc;
#실습 4-25
select *from `book`
order by `price` , `bookname`  asc;
#실습 4-26
select *from `book`
order by `price` desc , `publisher` asc;
#실습 4-27
select *from `book`
order by `price` desc
limit 3;
#실습 4-28
select *from `book`
order by `price` asc
limit 3;
#실습 4-29
select sum(saleprice) as '총 판매액' from `order`;
#실습 4-30
select 
	sum(saleprice) as '총 판매액', 
    avg(saleprice) as '평균값', 
    min(saleprice)as '최저가', 
    max(saleprice) as '최고가' 
    from`order`;
    
    
#실습 4-31
select count(orderid) as '판매건수'from `order`;

#실습 4-32
update `book` set `bookname` =replace(`bookname`,'야구','농구');
update `book` set `bookname` =replace(`bookname`,'농구','야구');
select *from `book`;

select
	`bookid`,
	replace(`bookname`, '야구','농구') as `bookname`,
    `publisher`,
    `price` from `book`;


#실습 4-33
select *from `customer`;
select *from `order`;
select `custid`, count(custid) as '구매수량' from `order`
where `saleprice` >= 8000
group by `custId`
having `구매수량`>=2;
#실습 4-34
select *from `customer`;
select *from `order`;


select *from `customer` as a
join `order` as b
on a.cusId=b.custid
order by a.cusId asc;
#실습 4-35
select *from `customer` as a
join `order` as b
on a.cusId=b.custid
order by a.cusId asc;

#실습 4-36
select *from `customer`;
select *from `order`;
select *from `book`;


select a.name,b.salePrice from `customer` as a
join `order` as b
on a.cusId=b.custid
join `book` as c
on b.bookId = c.bookId
order by a.cusId asc;

# 실습 4-37
select 
a.name,
sum(b.salePrice) from `customer` as a
join `order` as b
on a.cusId=b.custid
join `book` as c
on b.bookId = c.bookId
group by a.name
order by a.name asc;


#4-38
select a.name, c.bookName from `customer` as a
join `order` as b
on a.cusId=b.custid
join `book` as c
on b.bookId = c.bookId
order by a.cusId asc;

#4-39
select a.name, c.bookName from `customer` as a
join `order` as b
on a.cusId=b.custid
join `book` as c
on b.bookId = c.bookId
where c.price =20000
order by a.cusId asc;


#4-40

select `name`,`salePrice` from `order` as a
right join `customer` as b
on a.custId=b.cusId 
;


#4-41

select `bookname` from `book`
order by `price` desc
limit 1;

#4-42

select a.name from `customer` as a
left join `order` as b
on a.cusId = b.custId
where b.salePrice is null
;

select *from `customer` where `cusid` in (select distinct `custid` from `order`);

#4-43

select sum(salePrice) as '총 매출' from `customer` as a
join `order` as b
on a.cusId=b.custid
join `book` as c
on b.bookId = c.bookId
where a.name = '김연아'
order by a.cusId asc;

#4-44
select *from `book`;
insert into `book` (`bookid`,`bookname`,`publisher`) values (11,'스포츠의학','한솔의학서적');


#4-45
select *from `customer`;
update `customer` set `address`='대한민국 부산' where `cusid` = 5;

#4-46
select *from `customer`;
delete from `customer` where `cusid` =5;