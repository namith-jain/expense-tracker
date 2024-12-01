-- Categories Table

CREATE TABLE public.categories (
	categoryid serial4 NOT NULL,
	categoryname varchar(255) NOT NULL,
	CONSTRAINT categories_pkey PRIMARY KEY (categoryid)
);

-- SubCategories Table

CREATE TABLE public.subcategories (
	subcategoryid serial4 NOT NULL,
	categoryid int4 NULL,
	subcategoryname varchar(255) NOT NULL,
	CONSTRAINT subcategories_pkey PRIMARY KEY (subcategoryid),
	CONSTRAINT subcategories_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid)
);

-- Transactions Table

CREATE TABLE public.transactions (
	transactionid serial4 NOT NULL,
	userid int4 NULL,
	"date" timestamp NOT NULL,
	"type" public."transactiontype" NOT NULL,
	amount numeric(10, 2) NOT NULL,
	categoryid int4 NULL,
	subcategoryid int4 NULL,
	note text NULL,
	CONSTRAINT transactions_pkey PRIMARY KEY (transactionid),
	CONSTRAINT transactions_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid),
	CONSTRAINT transactions_subcategoryid_fkey FOREIGN KEY (subcategoryid) REFERENCES public.subcategories(subcategoryid),
	CONSTRAINT transactions_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid)
);

-- Users Table

CREATE TABLE public.users (
	userid serial4 NOT NULL,
	username varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (userid)
);