/*
===========================================================================
DDL SCRIPT:Create Bronze Tables
===========================================================================
Script Purpose:
This Script creates tables in the 'bronze' schema, dropping existing tables
if they aleady exist.
Run this script to re-define the ddl structure of the bronze table
===========================================================================
*/
IF OBJECT_ID('bronze.crm_cust_info','u') IS NOT NULL
DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr VARCHAR(50),
cst_create_date DATE
);

IF OBJECT_ID('bronze.crm_prd_info','u') IS NOT NULL
DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cst INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);

IF OBJECT_ID('bronze.crm_sales_details','u') IS NOT NULL
DROP TABLE  bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

IF OBJECT_ID('Bronze.erp_loc_a101','u') IS NOT NULL
DROP TABLE Bronze.erp_loc_a101;
CREATE TABLE Bronze.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);


IF OBJECT_ID('Bronze.erp_cust_az12','u') IS NOT NULL
DROP TABLE Bronze.erp_cust_az12;
CREATE TABLE Bronze.erp_cust_az12(
cid NVARCHAR(50),
bdate DATE,
 gen NVARCHAR(50)
);

IF OBJECT_ID('Bronze.erp_px_cat_g1v2','u') IS NOT NULL
DROP TABLE Bronze.erp_px_cat_g1v2;
CREATE TABLE Bronze.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintainence NVARCHAR(50)
);
