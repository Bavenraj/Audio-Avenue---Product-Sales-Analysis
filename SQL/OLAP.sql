create database dw_audioavenue;
use dw_audioavenue;

CREATE TABLE dim_branch (
    dim_branch_id INTEGER NOT NULL PRIMARY KEY,
    branchName VARCHAR(20),
    referenceSource_id CHAR(3)
);

CREATE TABLE dim_staff (
    dim_staff_id INTEGER NOT NULL PRIMARY KEY,
    staffName VARCHAR(50),
    referenceSource_id CHAR(4)
);
CREATE TABLE dim_product (
    dim_product_id INTEGER NOT NULL PRIMARY KEY,
    productName VARCHAR(30),
    referenceSource_id CHAR(4)
);

CREATE TABLE dim_productLine (
    dim_productLine_id INTEGER NOT NULL PRIMARY KEY,
    productLineName VARCHAR(30),
    referenceSource_id CHAR(3)
);

CREATE TABLE dim_brand (
    dim_brand_id INTEGER NOT NULL PRIMARY KEY,
    brandName VARCHAR(10),
    referenceSource_id CHAR(3)
);

CREATE TABLE Dim_Time (
    dim_time_id INTEGER NOT NULL PRIMARY KEY,
    dt DATE,
    dy SMALLINT,
    mth SMALLINT,
    yr SMALLINT,
    referenceSource_id INTEGER
);

CREATE TABLE fact_sales (
    dim_branch_id INTEGER,
    dim_brand_id INTEGER,
    dim_product_id INTEGER,
    dim_productLine_id INTEGER,
    dim_staff_id INTEGER,
    dim_time_id INTEGER,
    sale_Quantity INTEGER,
    CONSTRAINT FACT_SALES_DIM_BRAND_FK FOREIGN KEY (dim_brand_id)
        REFERENCES dim_brand (dim_brand_id),
    CONSTRAINT FACT_SALES_DIM_PRODUCTLINE_FK FOREIGN KEY (dim_productLine_id)
        REFERENCES dim_productLine (dim_productLine_id),
    CONSTRAINT FACT_SALES_DIM_PRODUCT_FK FOREIGN KEY (dim_product_id)
        REFERENCES dim_product (dim_product_id),
    CONSTRAINT FACT_SALES_DIM_BRANCH_FK FOREIGN KEY (dim_branch_id)
        REFERENCES dim_branch (dim_branch_id),
    CONSTRAINT FACT_SALES_DIM_STAFF_FK FOREIGN KEY (dim_staff_id)
        REFERENCES dim_staff (dim_staff_id),
    CONSTRAINT FACT_SALES_DIM_TIME_FK FOREIGN KEY (dim_time_id)
        REFERENCES dim_time (dim_time_id)
);













