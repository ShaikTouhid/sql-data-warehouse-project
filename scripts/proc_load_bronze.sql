/*
====================================================
Stored Procedure:Load Bronze Layer (source->bronze)
====================================================
Script Purpose:
this stored procedure loads data into the 'bronze' schema from external csv files.
it performs the following actions:
--truncates the bronze table before loading the data.
--uses the'bulk insert'command to load the data from csv files.

Parameters:
None
This stored procedure do not accept any values or return any values.

Usage example:
exec bronze.load_bronze;
====================================================
*/
	CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
	BEGIN
		DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
	BEGIN TRY
	SET @batch_start_time=GETDATE();
		PRINT '=================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=================================';
		PRINT '---------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '---------------------------------';
	PRINT'--------------------------------------------------------------------------------------'
		SET @start_time=GETDATE();
		Print '>> Truncating table:Bronze.crm_cust_info';
		Print '>> Inserting Into:Bronze.crm_cust_info';
			TRUNCATE TABLE Bronze.crm_cust_info;
			BULK INSERT Bronze.crm_cust_info
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\cust_info.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
	SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'
		Print '>> Truncating table:Bronze.crm_sales_details';
		Print '>> Inserting Into:Bronze.crm_sales_details';
	PRINT'--------------------------------------------------------------------------------------'
		SET @start_time=GETDATE();

			TRUNCATE TABLE Bronze.crm_sales_details;
			BULK INSERT Bronze.crm_sales_details
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\sales_details.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
			SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'

	PRINT'--------------------------------------------------------------------------------------'
		SET @start_time=GETDATE();
	Print '>> Truncating table:Bronze.crm_prd_info';
		Print '>> Inserting Into:Bronze.crm_prd_info';

			TRUNCATE TABLE Bronze.crm_prd_info;
			BULK INSERT Bronze.crm_prd_info
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\prd_info.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
			SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'
		PRINT '---------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '---------------------------------';


	PRINT'--------------------------------------------------------------------------------------'
		SET @start_time=GETDATE();
		Print '>> Truncating table:Bronze.erp_cust_az12';
		Print '>> Inserting Into:Bronze.erp_cust_az12';
			TRUNCATE TABLE Bronze.erp_cust_az12;
			BULK INSERT Bronze.erp_cust_az12
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\CUST_AZ12.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
	SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'

	PRINT'--------------------------------------------------------------------------------------'
			SET @start_time=GETDATE();
		Print '>> Truncating table:Bronze.erp_loc_a101';
		Print '>> Inserting Into:Bronze.erp_loc_a101';
			TRUNCATE TABLE Bronze.erp_loc_a101;
			BULK INSERT Bronze.erp_loc_a101
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\LOC_A101.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
	SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'

	PRINT'--------------------------------------------------------------------------------------'
		SET @start_time=GETDATE();
		Print '>> Truncating table:Bronze.erp_px_cat_g1v2';
		Print '>> Inserting Into:Bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
			BULK INSERT Bronze.erp_px_cat_g1v2
			FROM 'C:\Users\Public\Documents\SQL_PROJECT\datasets\PX_CAT_G1V2.csv'
			WITH(
				FIRSTROW=2,
				FIELDTERMINATOR=',',
				TABLOCK
			);
	SET @end_time=GETDATE();
	PRINT'>> Load Duration:' +CAST(DATEDIFF(second,@start_time,@end_time)AS NVARCHAR)+'seconds'
	PRINT'--------------------------------------------------------------------------------------'
	SET @batch_end_time=GETDATE();
	PRINT'===================================';
	PRINT'Loading Bronze Layer Is Completed';
	PRINT' -Total Load Duration: ' +CAST(DATEDIFF(Second,@batch_start_time,@batch_end_time)AS NVARCHAR)+'seconds';
	PRINT'===================================';
	END TRY
	BEGIN CATCH

	PRINT'======================================'
	PRINT'ERROR DURING LOADING BRONZE LAYER'
	PRINT'ERROR MESSAGE'+ERROR_MESSAGE();
	PRINT'ERROR MESSAGE'+CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT'ERROR MESSAGE'+CAST(ERROR_STATE() AS NVARCHAR);
	PRINT'======================================'
	END CATCH
	End
