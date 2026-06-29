create database task;
use task;

-- creating the table
create table books(
      book_id int auto_increment,
      title varchar(100),
      isbn varchar(20) unique,
      price decimal,
      published_date date,
      in_stock int default 1,
      primary key(book_id));
      
desc books;

-- insert data
insert into books (title,isbn,price,published_date,in_stock) values
             ('history of java',101,200,'2000-12-19',20),
             ('python',102,300,'2023-10-24',25),
             ('history of war',103,300,'2025-11-20',2),
             ('struggle of life',104,500,'2026-01-19',30),
             ('atomic habits',105,900,'2020-07-14',10);
             
select * from books;

-- renaming a column name
alter table books rename column title to book_title;

-- changing column datatype
alter table books modify price float;

-- adding a new column with a constraint
alter table books add column author_name varchar(50) default 'unknown';

-- updating existing data
update books set price=price*0.9 where published_date < '2020-01-01';

-- deleting specific records 
update books set in_stock =0 where isbn=105;
delete from books where in_stock =0;

-- resetting the auto-increment value
alter table books auto_increment=101;

-- conditional select with pattern matching 
update books set price=400 where isbn=103; 
select book_title,price,published_date from books where book_title like '%History%' and price > 300  order by price desc;

-- working with second table
create table members(
member_id int auto_increment,
member_name varchar(100) not null,
join_date date not null default (current_date), primary key(member_id) );

insert into members (member_name,join_date) values
            ('pravi','2024-06-11'),
            ('kaviya','2025-12-19'),
            ('priya','2022-10-4'),
            ('ravi','2021-9-12');
            
select * from members where year(join_date) =2024 order by member_name asc;
