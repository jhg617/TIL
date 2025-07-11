

drop TABLE memo_t;

CREATE TABLE memo_t(
	idx 	BIGINT(6) AUTO_INCREMENT,
	writer 	VARCHAR(30),
	content VARCHAR(4000),
	reg_date DATE,
	ip 	VARCHAR(30),
	CONSTRAINT memo_t_pk PRIMARY KEY(idx)
);
