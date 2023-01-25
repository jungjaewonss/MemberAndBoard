create table myboard(
	idx int not null auto_increment,
	memId varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

select * from myboard;
create table mem_tbl(
	memIdx int auto_increment,
	memId varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memIdx)
);

insert into mem_tbl (memId,memPassword,memName) values('asd','asd','asd');

select * from tblBoard;

delete  from mem_tbl;

