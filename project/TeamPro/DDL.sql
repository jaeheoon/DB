--테이블 생성
CREATE TABLE customer (
    customer_id            NUMBER(5) NOT NULL,
    customer_country       VARCHAR2(30),
    customer_postcode      NUMBER(10),
    customer_person        VARCHAR2(30),
    customer_credit_rating VARCHAR2(20),
    customer_area          VARCHAR2(30),
    area_id                NUMBER(5),
    customer_address       VARCHAR2(30),
    customer_city          VARCHAR2(30),
    customer_etc           VARCHAR2(100),
    customer_of            VARCHAR2(30),
    customer_name          VARCHAR2(30),
    customer_tell          VARCHAR2(30),
    customer_fax           VARCHAR2(30),
    customer_account_num   VARCHAR2(30),
    customer_person_id     NUMBER(10),
    employee_id            NUMBER(5)
);

CREATE TABLE employee (
    employee_id            NUMBER(5) NOT NULL,
    department_id          NUMBER(5) NOT NULL,
    employee_salary        NUMBER(30),
    employee_position      VARCHAR2(30),
    employee_hire_date     VARCHAR2(30),
    employee_idea          VARCHAR2(100),
    employee_commisson_pct NUMBER(10),
    employee_first_name    VARCHAR2(10),
    employee_last_name     VARCHAR2(10),
    employee_system_user   VARCHAR2(30)
);

CREATE TABLE product (
    product_id         NUMBER(5) NOT NULL,
    product_detailed   VARCHAR2(200),
    product_dynoptic   VARCHAR2(100),
    product_image      VARCHAR2(30),
    product_sales_unit NUMBER(5),
    product_price      NUMBER(20),
    product_name       VARCHAR2(30),
    order_id           NUMBER(5) NOT NULL,
    basket_id          NUMBER(5) NOT NULL,
    stock_id           NUMBER(5) NOT NULL
);

CREATE TABLE storage (
    storage_id         NUMBER(5) NOT NULL,
    area_id            NUMBER(5) NOT NULL,
    storage_address    VARCHAR2(30),
    storage_address_id NUMBER(10),
    storage_country    VARCHAR2(30),
    storage_of         VARCHAR2(30),
    storage_city       VARCHAR2(30),
    storage_tell       NUMBER(20),
    storage_name       VARCHAR2(30),
    storage_person     VARCHAR2(30),
    employee_id        NUMBER(5) NOT NULL,
    storage_person_id  NUMBER(5)
);

CREATE TABLE orders (
    order_id              NUMBER(5) NOT NULL,
    order_count           NUMBER(10),
    order_date            VARCHAR2(20),
    order_state           VARCHAR2(10),
    order_pay             VARCHAR2(30),
    order_status_shipping VARCHAR2(10),
    order_person          VARCHAR2(30),
    order_item_id         NUMBER(5) NOT NULL
);

CREATE TABLE area (
    area_id            NUMBER(5) NOT NULL,
    area_asia          VARCHAR2(30),
    area_europe        VARCHAR2(30),
    area_africa        VARCHAR2(30),
    area_america_south VARCHAR2(30),
    area_america_north VARCHAR2(30)
);

CREATE TABLE department (
    department_id   NUMBER(5) NOT NULL,
    department_area VARCHAR2(30),
    department_name VARCHAR2(30)
);

CREATE TABLE basket (
    basket_id     NUMBER(5) NOT NULL,
    basket_number NUMBER(10),
    customer_id   NUMBER(5) NOT NULL
);

CREATE TABLE item (
    item_id    NUMBER(5) NOT NULL,
    stock_id   NUMBER(5) NOT NULL,
    storage_id NUMBER(5) NOT NULL
);

CREATE TABLE country (
    country_id  VARCHAR2(5) NOT NULL,
    area_id     NUMBER(5) NOT NULL,
    country_usa VARCHAR2(30)
);

CREATE TABLE city (
    city_id           NUMBER(5) NOT NULL,
    of_id             NUMBER(5) NOT NULL,
    city_washington   VARCHAR2(30),
    city_sanfrancisco VARCHAR2(30)
);

CREATE TABLE ofs (
    of_id         NUMBER(5) NOT NULL,
    country_id    VARCHAR2 NOT NULL,
    of_california VARCHAR2(30),
    of_washington VARCHAR2(30)
);

DROP TABLE ofs;

CREATE TABLE stock (
    stock_id     NUMBER(5) NOT NULL,
    stock_max    NUMBER(10),
    stock_number NUMBER(10),
    stock_date   VARCHAR2(30)
);

CREATE TABLE order_item (
    order_item_id   NUMBER(5) NOT NULL,
    order_item_list VARCHAR2(30),
    customers_id    NUMBER(5) NOT NULL
);

--이름 잘못만들어서 삭제 후 재생성함
ALTER TABLE order_item ADD (
    customer_id NUMBER(5)
);

ALTER TABLE order_item DROP COLUMN customers_id;

--primary key
ALTER TABLE employee ADD CONSTRAINT pk_employee PRIMARY KEY ( employee_id );

ALTER TABLE customer ADD CONSTRAINT pk_customer PRIMARY KEY ( customer_id );

ALTER TABLE product ADD CONSTRAINT pk_product PRIMARY KEY ( product_id );

ALTER TABLE storage ADD CONSTRAINT pk_storage PRIMARY KEY ( storage_id );

ALTER TABLE orders ADD CONSTRAINT pk_orders PRIMARY KEY ( order_id );

ALTER TABLE area ADD CONSTRAINT pk_area PRIMARY KEY ( area_id );

ALTER TABLE department ADD CONSTRAINT pk_department PRIMARY KEY ( department_id );

ALTER TABLE basket ADD CONSTRAINT pk_basket PRIMARY KEY ( basket_id );

ALTER TABLE item ADD CONSTRAINT pk_item PRIMARY KEY ( item_id );

ALTER TABLE country ADD CONSTRAINT pk_country PRIMARY KEY ( country_id );

ALTER TABLE city ADD CONSTRAINT pk_city PRIMARY KEY ( city_id );

ALTER TABLE ofs ADD CONSTRAINT pk_of PRIMARY KEY ( of_id );

ALTER TABLE stock ADD CONSTRAINT pk_stock PRIMARY KEY ( stock_id );

ALTER TABLE order_item ADD CONSTRAINT pk_order_item PRIMARY KEY ( order_item_id );

-- foreign key
ALTER TABLE customer
    ADD CONSTRAINT fk_employee_id FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id );

ALTER TABLE customer
    ADD CONSTRAINT fk_area_id FOREIGN KEY ( area_id )
        REFERENCES area ( area_id );

ALTER TABLE employee
    ADD CONSTRAINT fk_department_id FOREIGN KEY ( department_id )
        REFERENCES department ( department_id );

ALTER TABLE product
    ADD CONSTRAINT fk_order_id FOREIGN KEY ( order_id )
        REFERENCES orders ( order_id );

ALTER TABLE product
    ADD CONSTRAINT fk_basket_id FOREIGN KEY ( basket_id )
        REFERENCES basket ( basket_id );

ALTER TABLE product
    ADD CONSTRAINT fk_stock_id FOREIGN KEY ( stock_id )
        REFERENCES stock ( stock_id );

ALTER TABLE storage
    ADD CONSTRAINT fk_storage_area_id FOREIGN KEY ( area_id )
        REFERENCES area ( area_id );

ALTER TABLE storage
    ADD CONSTRAINT fk_storage_employeeid FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id );

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_orderitemid FOREIGN KEY ( order_item_id )
        REFERENCES order_item ( order_item_id );

ALTER TABLE basket
    ADD CONSTRAINT fk_basket_customerid FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );

ALTER TABLE item
    ADD CONSTRAINT fk_item_stockid FOREIGN KEY ( stock_id )
        REFERENCES stock ( stock_id );

ALTER TABLE item
    ADD CONSTRAINT fk_item_storageid FOREIGN KEY ( storage_id )
        REFERENCES storage ( storage_id );

ALTER TABLE country
    ADD CONSTRAINT fk_country_areaid FOREIGN KEY ( area_id )
        REFERENCES area ( area_id );

ALTER TABLE city
    ADD CONSTRAINT fk_city_ofid FOREIGN KEY ( of_id )
        REFERENCES ofs ( of_id );

ALTER TABLE ofs
    ADD CONSTRAINT fk_ofs_countryid FOREIGN KEY ( country_id )
        REFERENCES country ( country_id );

ALTER TABLE order_item
    ADD CONSTRAINT fk_orderitem_customerid FOREIGN KEY ( customer_id )
        REFERENCES customer ( customer_id );