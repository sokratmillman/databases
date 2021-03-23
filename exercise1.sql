/*CREATE TABLE accounts
	(AccountID INT PRIMARY KEY     NOT NULL,
	AccountName           TEXT    NOT NULL,
	Credit   INT    NOT NULL);

insert into accounts values (1, 'Maxim', 1000);
insert into accounts values (2, 'Vladimir', 1000);
insert into accounts values (3, 'Harry', 1000);*/

begin;
savepoint sp0;

update accounts set Credit = Credit - 500 where AccountID = 1;
update accounts set Credit = Credit + 500 where AccountID = 3;
savepoint sp1;

update accounts set Credit = Credit - 700 where AccountID = 2;
update accounts set Credit = Credit + 700 where AccountID = 1;
savepoint sp2;

update accounts set Credit = Credit - 100 where AccountID = 2;
update accounts set Credit = Credit + 100 where AccountID = 3;
savepoint sp3;

commit;

select * from accounts;