CREATE TABLE announcement (
    awardno        NUMBER(10) NOT NULL,
    merno          NUMBER(10) NOT NULL,
    announcedate   DATE NOT NULL
);

ALTER TABLE announcement ADD CONSTRAINT announcement_pk PRIMARY KEY ( awardno,
                                                                      merno );

CREATE TABLE awards (
    awardno     NUMBER(10) NOT NULL,
    awardname   VARCHAR2(60) NOT NULL
);

ALTER TABLE awards ADD CONSTRAINT awards_pk PRIMARY KEY ( awardno );

CREATE TABLE branches (
    branchno     NUMBER(10) NOT NULL,
    address      VARCHAR2(60) NOT NULL,
    telno        VARCHAR2(20) NOT NULL,
    aircon       CHAR(1) NOT NULL,
    merno        NUMBER(10) NOT NULL,
    provinceno   NUMBER(10) NOT NULL
);

ALTER TABLE branches ADD CONSTRAINT branches_pk PRIMARY KEY ( branchno );

CREATE TABLE customers (
    customerno   NUMBER(10) NOT NULL,
    fname        VARCHAR2(40) NOT NULL,
    lname        VARCHAR2(40) NOT NULL,
    sex          CHAR(1) NOT NULL,
    telno        VARCHAR2(12) NOT NULL,
    address      VARCHAR2(60) NOT NULL,
    dob          DATE NOT NULL,
    provinceno   NUMBER(10) NOT NULL
);

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customerno );

CREATE TABLE employees (
    employeeno   NUMBER(10) NOT NULL,
    fname        VARCHAR2(30) NOT NULL,
    lname        VARCHAR2(30) NOT NULL,
    telno        VARCHAR2(12),
    sex          CHAR(1) NOT NULL,
    email        VARCHAR2(60),
    dob          DATE NOT NULL,
    address      VARCHAR2(60) NOT NULL,
    salary       NUMBER(10) NOT NULL,
    branchno     NUMBER(10) NOT NULL,
    positionno   NUMBER(10) NOT NULL,
    provinceno   NUMBER(10) NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( employeeno );

CREATE TABLE geography (
    geono     NUMBER(10) NOT NULL,
    geoname   VARCHAR2(20) NOT NULL
);

ALTER TABLE geography ADD CONSTRAINT geography_pk PRIMARY KEY ( geono );

CREATE TABLE langsupport (
    merno        NUMBER(10) NOT NULL,
    languageno   NUMBER(10) NOT NULL
);

ALTER TABLE langsupport ADD CONSTRAINT langsupport_pk PRIMARY KEY ( languageno,
                                                                    merno );

CREATE TABLE languages (
    languageno     NUMBER(10) NOT NULL,
    languagename   VARCHAR2(30) NOT NULL
);

ALTER TABLE languages ADD CONSTRAINT languages_pk PRIMARY KEY ( languageno );

CREATE TABLE merchandiser (
    merno            NUMBER(10) NOT NULL,
    mername          VARCHAR2(80) NOT NULL,
    registdate       DATE NOT NULL,
    ownerno          NUMBER(10) NOT NULL,
    merchanttypeno   NUMBER(10) NOT NULL
);

ALTER TABLE merchandiser ADD CONSTRAINT merchandiser_pk PRIMARY KEY ( merno );

CREATE TABLE merchanttypes (
    merchanttypeno   NUMBER(10) NOT NULL,
    type             VARCHAR2(60) NOT NULL
);

ALTER TABLE merchanttypes ADD CONSTRAINT merchanttypes_pk PRIMARY KEY ( merchanttypeno );

CREATE TABLE orderdetails (
    orderdetailno   NUMBER(10) NOT NULL,
    quantity        NUMBER(10) NOT NULL,
    amount          NUMBER(10, 2) NOT NULL,
    productno       NUMBER(10) NOT NULL,
    orderno         NUMBER(10) NOT NULL
);

ALTER TABLE orderdetails ADD CONSTRAINT orderdetails_pk PRIMARY KEY ( orderdetailno );

CREATE TABLE orders (
    orderno         NUMBER(10) NOT NULL,
    orderdatetime   TIMESTAMP NOT NULL,
    totalprice      NUMBER(10) NOT NULL,
    customerno      NUMBER(10) NOT NULL,
    branchno        NUMBER(10) NOT NULL
);

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE owners (
    ownerno      NUMBER(10) NOT NULL,
    fname        VARCHAR2(60) NOT NULL,
    lname        VARCHAR2(60) NOT NULL,
    telno        VARCHAR2(12) NOT NULL,
    email        VARCHAR2(60) NOT NULL,
    sex          CHAR(1) NOT NULL,
    dob          DATE NOT NULL,
    address      VARCHAR2(60) NOT NULL,
    provinceno   NUMBER(10) NOT NULL
);

ALTER TABLE owners ADD CONSTRAINT owners_pk PRIMARY KEY ( ownerno );

CREATE TABLE position (
    positionno     NUMBER(10) NOT NULL,
    positionname   VARCHAR2(30) NOT NULL
);

ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY ( positionno );

CREATE TABLE product (
    productno       NUMBER(10) NOT NULL,
    productname     VARCHAR2(60) NOT NULL,
    price           NUMBER(10, 2) NOT NULL,
    producttypeno   NUMBER(10) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productno );

CREATE TABLE producttype (
    producttypeno     NUMBER(10) NOT NULL,
    producttypename   VARCHAR2(60) NOT NULL
);

ALTER TABLE producttype ADD CONSTRAINT producttype_pk PRIMARY KEY ( producttypeno );

CREATE TABLE provinces (
    provinceno     NUMBER(10) NOT NULL,
    provincename   VARCHAR2(60) NOT NULL,
    geono          NUMBER(10) NOT NULL
);

ALTER TABLE provinces ADD CONSTRAINT provinces_pk PRIMARY KEY ( provinceno );

CREATE TABLE selling (
    merno           NUMBER(10) NOT NULL,
    producttypeno   NUMBER(10) NOT NULL
);

ALTER TABLE selling ADD CONSTRAINT selling_pk PRIMARY KEY ( merno,
                                                            producttypeno );

ALTER TABLE announcement
    ADD CONSTRAINT announcement_awards_fk FOREIGN KEY ( awardno )
        REFERENCES awards ( awardno );

ALTER TABLE announcement
    ADD CONSTRAINT announcement_merchandiser_fk FOREIGN KEY ( merno )
        REFERENCES merchandiser ( merno );

ALTER TABLE branches
    ADD CONSTRAINT branches_merchandiser_fk FOREIGN KEY ( merno )
        REFERENCES merchandiser ( merno );

ALTER TABLE branches
    ADD CONSTRAINT branches_provinces_fk FOREIGN KEY ( provinceno )
        REFERENCES provinces ( provinceno );

ALTER TABLE customers
    ADD CONSTRAINT customers_provinces_fk FOREIGN KEY ( provinceno )
        REFERENCES provinces ( provinceno );

ALTER TABLE employees
    ADD CONSTRAINT employees_branches_fk FOREIGN KEY ( branchno )
        REFERENCES branches ( branchno );

ALTER TABLE employees
    ADD CONSTRAINT employees_position_fk FOREIGN KEY ( positionno )
        REFERENCES position ( positionno );

ALTER TABLE employees
    ADD CONSTRAINT employees_provinces_fk FOREIGN KEY ( provinceno )
        REFERENCES provinces ( provinceno );

ALTER TABLE langsupport
    ADD CONSTRAINT langsupport_languages_fk FOREIGN KEY ( languageno )
        REFERENCES languages ( languageno );

ALTER TABLE langsupport
    ADD CONSTRAINT langsupport_merchandiser_fk FOREIGN KEY ( merno )
        REFERENCES merchandiser ( merno );

ALTER TABLE merchandiser
    ADD CONSTRAINT merchandiser_merchanttypes_fk FOREIGN KEY ( merchanttypeno )
        REFERENCES merchanttypes ( merchanttypeno );

ALTER TABLE merchandiser
    ADD CONSTRAINT merchandiser_owners_fk FOREIGN KEY ( ownerno )
        REFERENCES owners ( ownerno );

ALTER TABLE orderdetails
    ADD CONSTRAINT orderdetails_orders_fk FOREIGN KEY ( orderno )
        REFERENCES orders ( orderno );

ALTER TABLE orderdetails
    ADD CONSTRAINT orderdetails_product_fk FOREIGN KEY ( productno )
        REFERENCES product ( productno );

ALTER TABLE orders
    ADD CONSTRAINT orders_branches_fk FOREIGN KEY ( branchno )
        REFERENCES branches ( branchno );

ALTER TABLE orders
    ADD CONSTRAINT orders_customers_fk FOREIGN KEY ( customerno )
        REFERENCES customers ( customerno );

ALTER TABLE owners
    ADD CONSTRAINT owners_provinces_fk FOREIGN KEY ( provinceno )
        REFERENCES provinces ( provinceno );

ALTER TABLE product
    ADD CONSTRAINT product_producttype_fk FOREIGN KEY ( producttypeno )
        REFERENCES producttype ( producttypeno );

ALTER TABLE provinces
    ADD CONSTRAINT provinces_geography_fk FOREIGN KEY ( geono )
        REFERENCES geography ( geono );

ALTER TABLE selling
    ADD CONSTRAINT selling_merchandiser_fk FOREIGN KEY ( merno )
        REFERENCES merchandiser ( merno );

ALTER TABLE selling
    ADD CONSTRAINT selling_producttype_fk FOREIGN KEY ( producttypeno )
        REFERENCES producttype ( producttypeno );