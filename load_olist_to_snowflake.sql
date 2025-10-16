create database if not exists RAW; create schema if not exists RAW.PUBLIC;

create or replace file format RAW.CSV_FF type = 'CSV' field_optionally_enclosed_by = '"' skip_header = 1;

create or replace stage RAW.KAGGLE_OLIST file_format=RAW.CSV_FF; -- Use SnowSQL PUT or UI to upload files to this stage

create or replace table RAW.PUBLIC.olist_customers_dataset (
  CUSTOMER_ID VARCHAR,
  CUSTOMER_UNIQUE_ID VARCHAR,
  CUSTOMER_ZIP_CODE_PREFIX NUMBER,
  CUSTOMER_CITY VARCHAR,
  CUSTOMER_STATE VARCHAR
);

copy into RAW.PUBLIC.olist_customers_dataset from @RAW.KAGGLE_OLIST/olist_customers_dataset.csv;

create or replace table RAW.PUBLIC.olist_geolocation_dataset (
  GEOLOCATION_ZIP_CODE_PREFIX NUMBER,
  GEOLOCATION_LAT FLOAT,
  GEOLOCATION_LNG FLOAT,
  GEOLOCATION_CITY VARCHAR,
  GEOLOCATION_STATE VARCHAR
);

copy into RAW.PUBLIC.olist_geolocation_dataset from @RAW.KAGGLE_OLIST/olist_geolocation_dataset.csv;

create or replace table RAW.PUBLIC.olist_order_items_dataset (
  ORDER_ID VARCHAR,
  ORDER_ITEM_ID NUMBER,
  PRODUCT_ID VARCHAR,
  SELLER_ID VARCHAR,
  SHIPPING_LIMIT_DATE TIMESTAMP_NTZ,
  PRICE FLOAT,
  FREIGHT_VALUE FLOAT
);

copy into RAW.PUBLIC.olist_order_items_dataset from @RAW.KAGGLE_OLIST/olist_order_items_dataset.csv;

create or replace table RAW.PUBLIC.olist_order_payments_dataset (
  ORDER_ID VARCHAR,
  PAYMENT_SEQUENTIAL NUMBER,
  PAYMENT_TYPE VARCHAR,
  PAYMENT_INSTALLMENTS NUMBER,
  PAYMENT_VALUE FLOAT
);

copy into RAW.PUBLIC.olist_order_payments_dataset from @RAW.KAGGLE_OLIST/olist_order_payments_dataset.csv;

create or replace table RAW.PUBLIC.olist_order_reviews_dataset (
  REVIEW_ID VARCHAR,
  ORDER_ID VARCHAR,
  REVIEW_SCORE NUMBER,
  REVIEW_COMMENT_TITLE VARCHAR,
  REVIEW_COMMENT_MESSAGE VARCHAR,
  REVIEW_CREATION_DATE TIMESTAMP_NTZ,
  REVIEW_ANSWER_TIMESTAMP TIMESTAMP_NTZ
);

copy into RAW.PUBLIC.olist_order_reviews_dataset from @RAW.KAGGLE_OLIST/olist_order_reviews_dataset.csv;

create or replace table RAW.PUBLIC.olist_orders_dataset (
  ORDER_ID VARCHAR,
  CUSTOMER_ID VARCHAR,
  ORDER_STATUS VARCHAR,
  ORDER_PURCHASE_TIMESTAMP TIMESTAMP_NTZ,
  ORDER_APPROVED_AT VARCHAR,
  ORDER_DELIVERED_CARRIER_DATE TIMESTAMP_NTZ,
  ORDER_DELIVERED_CUSTOMER_DATE TIMESTAMP_NTZ,
  ORDER_ESTIMATED_DELIVERY_DATE TIMESTAMP_NTZ
);

copy into RAW.PUBLIC.olist_orders_dataset from @RAW.KAGGLE_OLIST/olist_orders_dataset.csv;

create or replace table RAW.PUBLIC.olist_products_dataset (
  PRODUCT_ID VARCHAR,
  PRODUCT_CATEGORY_NAME VARCHAR,
  PRODUCT_NAME_LENGHT FLOAT,
  PRODUCT_DESCRIPTION_LENGHT FLOAT,
  PRODUCT_PHOTOS_QTY FLOAT,
  PRODUCT_WEIGHT_G NUMBER,
  PRODUCT_LENGTH_CM NUMBER,
  PRODUCT_HEIGHT_CM NUMBER,
  PRODUCT_WIDTH_CM NUMBER
);

copy into RAW.PUBLIC.olist_products_dataset from @RAW.KAGGLE_OLIST/olist_products_dataset.csv;

create or replace table RAW.PUBLIC.olist_sellers_dataset (
  SELLER_ID VARCHAR,
  SELLER_ZIP_CODE_PREFIX NUMBER,
  SELLER_CITY VARCHAR,
  SELLER_STATE VARCHAR
);

copy into RAW.PUBLIC.olist_sellers_dataset from @RAW.KAGGLE_OLIST/olist_sellers_dataset.csv;

create or replace table RAW.PUBLIC.product_category_name_translation (
  PRODUCT_CATEGORY_NAME VARCHAR,
  PRODUCT_CATEGORY_NAME_ENGLISH VARCHAR
);

copy into RAW.PUBLIC.product_category_name_translation from @RAW.KAGGLE_OLIST/product_category_name_translation.csv;